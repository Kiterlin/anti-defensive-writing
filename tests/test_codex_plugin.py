"""Validate native Codex packaging against the existing installable skill."""
import json
from pathlib import Path
import unittest

REPO = Path(__file__).resolve().parents[1]


class CodexPluginTests(unittest.TestCase):
    def test_marketplace_resolves_repository_plugin(self):
        marketplace = json.loads((REPO / '.agents/plugins/marketplace.json').read_text())
        entry, = marketplace['plugins']
        self.assertEqual('local', entry['source']['source'])
        root = (REPO / entry['source']['path']).resolve()
        self.assertEqual(REPO, root)
        plugin = json.loads((root / '.codex-plugin/plugin.json').read_text())
        self.assertEqual(plugin['name'], entry['name'])
        self.assertEqual('AVAILABLE', entry['policy']['installation'])
        self.assertEqual('ON_INSTALL', entry['policy']['authentication'])

    def test_plugin_reuses_existing_skill_payload(self):
        plugin = json.loads((REPO / '.codex-plugin/plugin.json').read_text())
        metadata = json.loads((REPO / 'skill.json').read_text())
        self.assertEqual(metadata['name'], plugin['name'])
        payload = (REPO / plugin['skills']).resolve()
        self.assertEqual((REPO / metadata['skill_path']).resolve(), payload)
        self.assertEqual((REPO / 'SKILL.md').read_bytes(), (payload / 'SKILL.md').read_bytes())


if __name__ == '__main__':
    unittest.main()
