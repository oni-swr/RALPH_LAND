
0. Study Specs in specs/
1. Study @IMPLEMENTATION_PLAN.md (if present; it may be incorrect)
2. study existing source code in `src/dmx_anim_transfer` and compare it against `specs/*`.
3. choose the most important spec you want to plan next.
4. create/update @IMPLEMENTATION_PLAN.md as a detailed bullet point list sorted in priority of items that need to be done.
4. MOST IMPORTANT: WRITE YOUR FINDINGS INTO @IMPLEMENTATION_PLAN.md

IMPORTANT: Plan only. Do NOT implement anything. Do NOT assume functionality is missing; confirm with code search first. Treat `src/lib` as the project's standard library for shared utilities and components. Prefer consolidated, idiomatic implementations there over ad-hoc copies.

Consider missing elements and plan accordingly. If an element is missing, search first to confirm it doesn't exist, then if needed author the specification at specs/FILENAME.md. If you create a new element then document the plan to implement it in @IMPLEMENTATION_PLAN.md using a subagent.
