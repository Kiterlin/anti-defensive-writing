#!/usr/bin/env python3
"""Regenerate the repo's star-history chart (light + dark SVG) and its data series.

Two data paths, tried in order:

1. Exact history — the stargazers API with the `star+json` media type returns a
   `starred_at` per star, which rebuilds the whole curve. Since 2026-06-30 GitHub
   limits that data to a repo's admins and collaborators, so it only works with a
   token that has that access.
2. Count snapshot — if the exact fetch is refused, append today's public
   `stargazers_count` to the stored series instead. Needs no privileged access, so
   the chart keeps moving either way.

The series lives in a JSON file (one cumulative total per day, so the file grows by
at most a line a day) and the SVGs are rendered from it.

Usage:
    python3 generate_star_history.py --repo OWNER/NAME \
        --data .github/data/star-history.json \
        --out-light assets/star-history.svg \
        --out-dark assets/star-history-dark.svg
"""
import argparse
import json
import math
import subprocess
from datetime import datetime, timedelta, timezone

# --- palette -----------------------------------------------------------------
# Categorical slot 1 (blue) per mode, >= 3:1 against each GitHub canvas; chrome is
# one step off the canvas it renders on.
THEMES = {
    "light": dict(series="#2a78d6", grid="#e1e0d9", axis="#c3c2b7",
                  muted="#898781", ink="#0b0b0b", canvas="#ffffff"),
    "dark":  dict(series="#3987e5", grid="#21262d", axis="#30363d",
                  muted="#898781", ink="#ffffff", canvas="#0d1117"),
}
FONT = "system-ui,-apple-system,'Segoe UI',Roboto,Helvetica,Arial,sans-serif"

W, H = 800, 360
PL, PR, PT, PB = 52, 60, 34, 46          # plot padding
X0, X1, Y0, Y1 = PL, W - PR, PT, H - PB  # plot box
DAY = 86400

MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]


# --- data --------------------------------------------------------------------
def gh(args):
    return subprocess.run(["gh", *args], capture_output=True, text=True,
                          check=True).stdout


def fetch_exact(repo):
    """Per-star `starred_at` timestamps, or None if GitHub refuses the data."""
    try:
        out = gh(["api", "--paginate", f"repos/{repo}/stargazers?per_page=100",
                  "-H", "Accept: application/vnd.github.star+json",
                  "--jq", ".[].starred_at"])
    except subprocess.CalledProcessError as e:
        print(f"exact history unavailable: {e.stderr.strip().splitlines()[-1:]}")
        return None
    stamps = [parse_ts(l) for l in out.splitlines() if l.strip()]
    return stamps or None


def fetch_count(repo):
    return int(gh(["api", f"repos/{repo}", "--jq", ".stargazers_count"]).strip())


def parse_ts(s):
    return (datetime.strptime(s.strip(), "%Y-%m-%dT%H:%M:%SZ")
            .replace(tzinfo=timezone.utc).timestamp())


def day_of(ts):
    return datetime.fromtimestamp(ts, timezone.utc).strftime("%Y-%m-%d")


def epoch_of(day):
    return datetime.strptime(day, "%Y-%m-%d").replace(tzinfo=timezone.utc).timestamp()


def daily_from_stamps(stamps):
    """[(day, cumulative total at end of that day)] for every day that gained stars."""
    totals = {}
    for i, t in enumerate(sorted(stamps)):
        totals[day_of(t)] = i + 1
    return [[d, v] for d, v in sorted(totals.items())]


def load_points(path):
    try:
        with open(path, encoding="utf-8") as f:
            return json.load(f).get("points", [])
    except FileNotFoundError:
        return []


def save_points(path, repo, source, points):
    rows = ",\n".join(f'    ["{d}", {v}]' for d, v in points)
    with open(path, "w", encoding="utf-8") as f:
        f.write('{\n'
                f'  "repo": "{repo}",\n'
                f'  "source": "{source}",\n'
                f'  "updated": "{points[-1][0]}",\n'
                f'  "points": [\n{rows}\n  ]\n'
                '}\n')


def series_from_points(points, now):
    """Daily totals -> plot points: each active day is a plateau then a rise, so the
    curve never invents growth on days that had none."""
    out, prev = [], 0
    for day, total in points:
        start = epoch_of(day)
        end = min(start + DAY, now)
        out.append((start, prev))
        out.append((max(end, start), total))
        prev = total
    if now > out[-1][0]:
        out.append((now, prev))
    return out


# --- rendering ---------------------------------------------------------------
def nice_axis(vmax, target=4):
    """Round the y-axis up to a clean step/top (1, 2, 2.5, 5 x 10^k)."""
    if vmax <= 0:
        return 1, 1
    raw = vmax / target
    mag = 10 ** math.floor(math.log10(raw))
    step = mag * 10
    for m in (1, 2, 2.5, 5, 10):
        if raw <= m * mag:
            step = m * mag
            break
    return step, math.ceil(vmax / step) * step


def fmt_int(v):
    return f"{int(round(v)):,}"


def esc(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def month_starts(t0, t1):
    d0 = datetime.fromtimestamp(t0, timezone.utc)
    y, m = d0.year, d0.month
    if (d0.day, d0.hour) != (1, 0):
        y, m = (y + 1, 1) if m == 12 else (y, m + 1)
    out = []
    while True:
        t = datetime(y, m, 1, tzinfo=timezone.utc).timestamp()
        if t > t1:
            return out
        out.append((t, y, m))
        y, m = (y + 1, 1) if m == 12 else (y, m + 1)


def x_ticks(t0, t1):
    """(epoch, label, text-anchor). Short spans get evenly spaced dates; long spans
    get month boundaries thinned to at most six labels."""
    if (t1 - t0) / DAY <= 130:
        n, ticks = 4, []
        for i in range(n + 1):
            t = t0 + (t1 - t0) * i / n
            d = datetime.fromtimestamp(t, timezone.utc)
            anchor = "start" if i == 0 else "end" if i == n else "middle"
            ticks.append((t, f"{MONTHS[d.month - 1]} {d.day}", anchor))
        return ticks
    starts = month_starts(t0, t1)
    for step in (1, 2, 3, 6, 12):
        kept = [s for s in starts if (s[2] - 1) % step == 0]
        if len(kept) <= 6:
            break
    ticks, prev_year = [], None
    for t, y, m in kept:
        label = f"{MONTHS[m - 1]} {y}" if (prev_year != y or m == 1) else MONTHS[m - 1]
        ticks.append((t, label, "middle"))
        prev_year = y
    return ticks


def thin(px):
    """Collapse points that land in the same half-pixel column."""
    out = []
    for x, y in px:
        if out and round(out[-1][0] * 2) == round(x * 2):
            out[-1] = (x, y)
        else:
            out.append((x, y))
    return out


def build(series, repo, theme, updated):
    th = THEMES[theme]
    t0, t1 = series[0][0], max(series[-1][0], series[0][0] + DAY)
    last = series[-1][1]
    step, top = nice_axis(max(v for _, v in series))

    def sx(t):
        return X0 + (t - t0) / (t1 - t0) * (X1 - X0)

    def sy(v):
        return Y1 - v / top * (Y1 - Y0)

    px = thin([(sx(t), sy(v)) for t, v in series])
    line = "M" + " L".join(f"{x:.1f},{y:.1f}" for x, y in px)
    area = f"{line} L{px[-1][0]:.1f},{Y1} L{px[0][0]:.1f},{Y1} Z"

    d0, d1 = (datetime.fromtimestamp(t, timezone.utc) for t in (t0, t1))
    span = (f"{MONTHS[d0.month - 1]} {d0.day}, {d0.year} – "
            f"{MONTHS[d1.month - 1]} {d1.day}, {d1.year}")

    s = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" '
         f'viewBox="0 0 {W} {H}" role="img" aria-labelledby="title desc" '
         f'font-family="{FONT}">',
         f'<title id="title">Star history for {esc(repo)}</title>',
         f'<desc id="desc">Cumulative GitHub stars for {esc(repo)}, {span}: '
         f'{fmt_int(last)} stars.</desc>',
         f'<text x="{X0}" y="20" font-size="12" fill="{th["muted"]}">'
         f'{esc(repo)} · stars over time</text>',
         f'<text x="{X1}" y="20" font-size="11" fill="{th["muted"]}" '
         f'text-anchor="end">Updated {updated}</text>']

    v = 0.0
    while v <= top + 1e-9:                      # gridlines + y labels
        y = sy(v)
        s.append(f'<line x1="{X0}" y1="{y:.1f}" x2="{X1}" y2="{y:.1f}" '
                 f'stroke="{th["grid"] if v else th["axis"]}" stroke-width="1"/>')
        s.append(f'<text x="{X0 - 10}" y="{y:.1f}" font-size="11" '
                 f'fill="{th["muted"]}" text-anchor="end" dominant-baseline="middle" '
                 f'font-variant-numeric="tabular-nums">{fmt_int(v)}</text>')
        v += step

    for t, label, anchor in x_ticks(t0, t1):
        s.append(f'<text x="{sx(t):.1f}" y="{Y1 + 22}" font-size="11" '
                 f'fill="{th["muted"]}" text-anchor="{anchor}">{label}</text>')

    s.append(f'<path d="{area}" fill="{th["series"]}" fill-opacity="0.1"/>')
    s.append(f'<path d="{line}" fill="none" stroke="{th["series"]}" stroke-width="2" '
             f'stroke-linejoin="round" stroke-linecap="round"/>')

    ex, ey = px[-1]                             # 2px surface ring + dot + label
    s.append(f'<circle cx="{ex:.1f}" cy="{ey:.1f}" r="6" fill="{th["canvas"]}"/>')
    s.append(f'<circle cx="{ex:.1f}" cy="{ey:.1f}" r="4" fill="{th["series"]}"/>')
    s.append(f'<text x="{ex + 10:.1f}" y="{ey:.1f}" font-size="13" font-weight="600" '
             f'fill="{th["ink"]}" dominant-baseline="middle">{fmt_int(last)}</text>')
    s.append("</svg>")
    return "\n".join(s) + "\n"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--repo", required=True)
    ap.add_argument("--data", required=True, help="JSON series file (read + rewritten)")
    ap.add_argument("--out-light", required=True)
    ap.add_argument("--out-dark", required=True)
    ap.add_argument("--from-file", help="newline-delimited starred_at timestamps")
    ap.add_argument("--snapshot-only", action="store_true",
                    help="skip the exact fetch, to exercise the count fallback")
    args = ap.parse_args()

    now = datetime.now(timezone.utc)
    today = day_of(now.timestamp())
    stored = load_points(args.data)

    if args.from_file:
        with open(args.from_file, encoding="utf-8") as f:
            stamps = [parse_ts(l) for l in f if l.strip()]
        points, source = daily_from_stamps(stamps), "starred_at"
    else:
        stamps = None if args.snapshot_only else fetch_exact(args.repo)
        if stamps:
            points, source = daily_from_stamps(stamps), "starred_at"
        elif stored:
            count = fetch_count(args.repo)
            points = [p for p in stored if p[0] != today] + [[today, count]]
            source = "stargazers_count"
            print(f"exact history refused; snapshotted the public count: {count}")
        else:
            raise SystemExit("no stored series and no access to starred_at — "
                             "cannot reconstruct a curve")

    save_points(args.data, args.repo, source, points)
    series = series_from_points(points, now.timestamp())
    for theme, path in (("light", args.out_light), ("dark", args.out_dark)):
        with open(path, "w", encoding="utf-8") as f:
            f.write(build(series, args.repo, theme, today))
    print(f"{points[-1][1]} stars · {len(points)} days · source={source} · "
          f"wrote {args.out_light} and {args.out_dark}")


if __name__ == "__main__":
    main()
