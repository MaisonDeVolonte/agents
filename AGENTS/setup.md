```javascript
/**
 * ==================================
 * @file setup.md - project setup doc
 * ==================================
 * @description
 * - how to link this scaffold into a host project
 * - symlink rather than copy so edits stay shared across every project
 * - host projects gitignore the links, so nothing is committed downstream
 * - the rulebook is README.md here, linked in as AGENTS.md
 * @see README.md, /AGENTS/
 */
```

# Setup

Symlink the files into any project instead of copying, so edits stay shared:

```bash
ln -s ~/Developer/operator/README.md /path/to/project/AGENTS.md
ln -s ~/Developer/operator/AGENTS    /path/to/project/AGENTS

# optional: wires up the hooks and permission rules for this scaffold
mkdir -p /path/to/project/.claude
ln -s ~/Developer/operator/AGENTS/settings.local.json \
      /path/to/project/.claude/settings.local.json
```

The rulebook is `README.md` so it renders on the repo landing page, and links in as
`AGENTS.md` where agents expect to find it. Nothing symlinked is ever committed, so
clones on filesystems without symlink support still get plain files.

`settings.local.json` is deliberately not named `.claude/...` in this repo, since
`**/.claude/settings.local.json` is a common global gitignore rule. Symlinking it in
keeps it tracked here and ignored in the host project.

These are mostly tuned to how I work — but if you like them, link away or fork.
