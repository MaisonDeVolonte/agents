```javascript
/**
 * =====================================================
 * @file gitaudit.md - read-only git diagnostics trigger
 * =====================================================
 * @description
 * - ran only on explicit `@gitaudit` command; read-only, never mutates the repo
 * - runs `AGENTS/git/gitaudit.sh` then evaluates telemetry for ghost branches, local
 *   clutter, conflict risk, and a dirty trunk
 * - outputs a numbered list of issues with manual + `@agent` shortcut resolutions
 * @see AGENTS.md, AGENTS/git.md, AGENTS/git/gitaudit.sh
 */
```

**@gitaudit:** Run ONLY on explicit `@gitaudit` command
1. run the native shell command exactly as specified
  ```bash
  AGENTS/git/gitaudit.sh
  ```

2. IF FAILURE (exit code > 0):
  ```text
  - output the raw terminal error inside a markdown code block
  ```

3. IF SUCCESS (exit code = 0):
  - evaluate the telemetry against these potential scenarios:
    - IF a branch has `upstream: gone`: Explicitly label it a "Ghost Branch"
    - IF a branch has `merged: yes` and `upstream: none`: Explicitly label it "Local Clutter"
    - IF `conflict_risk_files` > 0: Immediately issue a high-alert warning naming the branch
    - IF there are `unstaged_files` or `untracked_files` on the default branch: help the user clear the working directory

  ```text
  - output the raw telemetry

  - provide a highly specific summary of how/why the repository might be in its current state
  - generate a numbered list of potential issues/tasks (e.g. ghost branches, conflict risk, etc)
  - include specific/explicit resolution steps (both manual terminal commands and @agent shortcuts where possible)
  ```
