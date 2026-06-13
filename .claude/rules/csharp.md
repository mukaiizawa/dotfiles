---
paths: ["**/*.cs"]
---

# C# / Unity

- Expose fields to the Inspector as `public` fields, not `[SerializeField] private`.
- Prefix private instance fields with an underscore (`_camelCase`).
- Use C# `event Action<...>` for code-level events; reserve `UnityEvent` for Inspector wiring. Invoke with `?.Invoke(...)`, and unsubscribe in `OnDestroy` whatever you subscribed in `Awake`/`Start`.
- Expose internal collections through an `IReadOnly*` interface, not the concrete type.
- Reserve `try/catch` for external operations (file I/O, networking, Steam, JSON). Signal ordinary failures with an early `return false`/`null` guard, not exceptions.
- Prefix log messages with a bracketed subsystem tag, e.g. `Debug.Log("[Network] ...")`.
- Do not write XML doc comments (`///`). Comment only non-obvious logic; separate major sections of a long file with a divider comment (`// ─── label ───…`) instead of per-line narration.

