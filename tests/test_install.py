"""Check the installer payload, destination choice, and update failures."""
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

REPO = Path(__file__).resolve().parents[1]
SCRIPT = REPO / 'install.sh'


class InstallerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.env = os.environ.copy()
        self.env['INSTALL_TEST_SOURCE'] = str(REPO / 'SKILL.md')
        self.env['INSTALL_TEST_URLS'] = str(self.root / 'urls.txt')
        binary = self.root / 'bin'
        binary.mkdir()
        curl = binary / 'curl'
        curl.write_text('''#!/bin/sh
set -eu
printf '%s\\n' "$2" >> "$INSTALL_TEST_URLS"
case "$2" in */missing-ref/*) exit 22 ;; esac
cp "$INSTALL_TEST_SOURCE" "$4"
''')
        curl.chmod(0o755)
        self.env['PATH'] = str(binary) + os.pathsep + self.env['PATH']

    def run_installer(self, *args, piped=False):
        command = ['sh', '-s', '--'] if piped else ['sh', str(SCRIPT)]
        return subprocess.run(
            command + list(args), cwd=self.root, env=self.env,
            input=SCRIPT.read_text() if piped else None,
            text=True, capture_output=True,
        )

    def assert_payload(self, parent):
        skill = Path(parent) / 'anti-defensive-writing'
        self.assertEqual(['SKILL.md'], sorted(p.name for p in skill.rglob('*')))
        self.assertEqual((REPO / 'SKILL.md').read_bytes(), (skill / 'SKILL.md').read_bytes())

    def test_all_destinations_and_spaces(self):
        for directory in ['.agents/skills', '.codex/skills', '.claude/skills', 'custom path/skills']:
            with self.subTest(directory=directory):
                result = self.run_installer('--dest', directory)
                self.assertEqual(0, result.returncode, result.stderr)
                self.assert_payload(self.root / directory)
        self.assertFalse((self.root / 'urls.txt').exists())

    def test_piped_installer_downloads_only_skill_file(self):
        # A SKILL.md in the caller's working directory must not be installed.
        (self.root / 'SKILL.md').write_text('unrelated skill')
        result = self.run_installer('--dest', '.agents/skills', piped=True)
        self.assertEqual(0, result.returncode, result.stderr)
        self.assert_payload(self.root / '.agents/skills')
        self.assertEqual(
            ['https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md'],
            (self.root / 'urls.txt').read_text().splitlines(),
        )

    def test_existing_skill_requires_force(self):
        parent = self.root / '.claude/skills'
        self.assertEqual(0, self.run_installer('--dest', str(parent)).returncode)
        extra = parent / 'anti-defensive-writing/old-script.sh'
        extra.write_text('keep until force is requested')
        result = self.run_installer('--dest', str(parent))
        self.assertNotEqual(0, result.returncode)
        self.assertTrue(extra.exists())
        result = self.run_installer('--dest', str(parent), '--force')
        self.assertEqual(0, result.returncode, result.stderr)
        self.assert_payload(parent)

    def test_explicit_ref_downloads_requested_version(self):
        result = self.run_installer('--dest', '.codex/skills', '--ref', 'v1.0')
        self.assertEqual(0, result.returncode, result.stderr)
        self.assert_payload(self.root / '.codex/skills')
        self.assertIn('/v1.0/SKILL.md', (self.root / 'urls.txt').read_text())

    def test_failed_download_preserves_existing_skill(self):
        parent = self.root / '.agents/skills'
        self.assertEqual(0, self.run_installer('--dest', str(parent)).returncode)
        result = self.run_installer('--dest', str(parent), '--ref', 'missing-ref', '--force')
        self.assertNotEqual(0, result.returncode)
        self.assert_payload(parent)
        self.assertEqual(['anti-defensive-writing'], sorted(p.name for p in parent.iterdir()))

    def test_missing_arguments_fail(self):
        for args in [('--dest',), ('--ref',), ('--dest', '')]:
            self.assertNotEqual(0, self.run_installer(*args).returncode)


if __name__ == '__main__':
    unittest.main()
