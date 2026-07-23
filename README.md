# operator

My personal operating rules for AI coding agents — a read-only-by-default posture,
explicit action triggers, git automations, and a boring, highly-legible coding philosophy.

The rulebook lives in [`AGENTS.md`](AGENTS.md); supporting workflows, hooks, and
templates live in [`AGENTS/`](AGENTS/).

## Using it in a project

Symlink the files into any project instead of copying, so edits stay shared:

```bash
ln -s ~/Developer/operator/AGENTS.md   /path/to/project/AGENTS.md
ln -s ~/Developer/operator/AGENTS      /path/to/project/AGENTS

# optional: wires up the hooks and permission rules for this scaffold
mkdir -p /path/to/project/.claude
ln -s ~/Developer/operator/AGENTS/settings.local.json \
      /path/to/project/.claude/settings.local.json
```

`settings.local.json` is deliberately not named `.claude/...` in this repo, since
`**/.claude/settings.local.json` is a common global gitignore rule. Symlinking it in
keeps it tracked here and ignored in the host project.

These are mostly tuned to how I work — but if you like them, link away or fork.
