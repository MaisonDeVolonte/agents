```javascript
/**
 * ==============================
 * @file plans.md - plan template
 * ==============================
 * @description
 * - one file per plan, `AGENTS/plans/`
 * - gitignored, local-only, never committed
 * - written before complex or architectural work
 * - covers overview, context, fixes, risks, and checklist
 * - plans are written in maximally clear, concise, action-oriented language
 * - write for humans, not machines
 * @see AGENTS.md, /AGENTS/plans/
 */
```

# AGENT PLAN: Short Title
write before executing complex tasks

## 1. Context & Goal
what is broken, what are the limiting factors, and what does success look like?

*example:*
> - `lead with the core idea` so plan steps are easy to scan and understand
> - `write concisely` aiming for one main idea per line, favoring more lines over completeness

## 2. Solution & Checklist
what is the general strategy and what are the atomic steps to ship it?

*example:*
> [ ] `combine` this with that to make it lighter
> [ ] `separate` this from that to make it easier
> [ ] `refactor` this into that to make it simpler
> [ ] `test` that with this to make it resilient

## 3. Risks & Gotchas
what could break, what hidden edge cases exist, and how do we avoid them?

*example:* 
> - `race condition` between this and that
> - `breaking change` if we change this to that
> - `edge case` due to changing that to this
