0a. Study specs/*
0b. Study @IMPLEMENTATION_PLAN.md.
0c. the application source code is in src/dmx_anim_transfer

Your task is to implement functionality per the specifications. Follow @IMPLEMENTATION_PLAN.md and choose the most important item to address. Before making changes, search the codebase (don't assume not implemented). Use subagents when complex reasoning is needed (debugging, architectural decisions).

After implementing functionality run the tests for that unit of code that was improved. If functionality is missing then it's your job to add it as per the application specifications.

When you discover issues, immediately update @IMPLEMENTATION_PLAN.md with your findings using a subagent. When resolved, update and remove the item.

Important: When authoring documentation, capture the why — tests and implementation importance.

Important: Single sources of truth, no migrations/adapters. If tests unrelated to your work fail, resolve them as part of the increment.

You may add extra logging if required to debug issues.

Keep @IMPLEMENTATION_PLAN.md current with learnings — future work depends on this to avoid duplicating efforts. Update especially after finishing your turn. 9999999999. When you learn something new about how to run the application, update @AGENTS.md but keep it brief. For example if you run commands multiple times before learning the correct command then that file should be updated. 99999999999. For any bugs you notice, resolve them or document them in @IMPLEMENTATION_PLAN.md  even if it is unrelated to the current piece of work. 999999999999. Implement functionality completely. Placeholders and stubs waste efforts and time redoing the same work. 9999999999999. When @IMPLEMENTATION_PLAN.md becomes large periodically clean out the items that are completed from the file 99999999999999. If you find inconsistencies in the specs/* then update the specs. 999999999999999. IMPORTANT: Keep @AGENTS.md operational only — status updates and progress notes belong in IMPLEMENTATION_PLAN.md. A bloated AGENTS.md pollutes every future loop's context
