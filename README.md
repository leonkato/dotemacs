(The `&` only works in bash; in cmd just use `runemacs`.)

Use `runemacs.exe` rather than `emacs.exe` on Windows — same Emacs but
detached from the console, so no spurious GLib warnings spill into your
terminal.

## Daily Git workflow for this repo

```bash
cd ~/.emacs.d
# edit init.el in Emacs
git status
git diff
git add init.el
git commit -m "describe the change"
git push
```

## Configuration choices

- **Theme:** `modus-operandi` — light, low-contrast, well-designed.
  Built into Emacs 29.
- **Default font:** Segoe UI (proportional). Unusual for an Emacs setup;
  the tradeoff is prose looks great, but code alignment in heavily-
  indented files can look slightly off. Swap to Cascadia Code as the
  default if it becomes annoying.
- **No backup files, no lockfiles** — `.bak~` and `.#foo` litter
  is disabled. Git is the backup.
- **`global-auto-revert-mode`** is on so Emacs notices when files change
  on disk (e.g. when another editor like Obsidian saves them).
- **`C-x C-b` rebound to `electric-buffer-list`** — the modal,
  key-driven buffer switcher in the Lisp Machine tradition.

## Gotchas encountered (so I don't forget)

- **GitHub Desktop + Emacs as external editor doesn't work cleanly** on
  Windows — argument quoting gets mangled and Emacs tries to create a
  directory named `"C:/...`. Use the editor directly, skip GitHub
  Desktop entirely or use only its built-in editor list (PyCharm, etc.).
- **`modus-operandi-tinted`** isn't in all Windows Emacs 29.3 builds;
  the plain `modus-operandi` is.
- **The bare `emacs.exe`** dumps GLib warnings about UWP apps to its
  console. Use `runemacs.exe` (no console attached, no warnings) for
  GUI use.
