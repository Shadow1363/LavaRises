# CLAUDE.md — Minigame template datapack

A Minecraft Java datapack template for last-player-standing minigames. Players gather resources first. Then PvP turns on and the world border shrinks. After that, deaths eliminate. The last player or team alive wins.

The engine (`core`) has no game mechanic of its own. A game plugs into it through **hooks**, the stubs in `data/game/function/on/`. The template was extracted from the Lava Rising pack, and all lava/riser code has been removed.

There is no code outside `.mcfunction` and JSON files. There are no automated tests. Everything is verified in-game.

## Version

Targets **1.21.11 through 26.3**: `pack.mcmeta` has `min_format: [94, 1]` and `max_format: 121`. Formats must be integers or `[major, minor]` arrays. Decimals like `94.1` are invalid. Data pack formats are: 1.21.11 = 94.1, 26.1 = 101.1, 26.2 = 107.1, 26.3 = 121.0. When a new version ships, check its changelog and raise `max_format`.

Version notes:

- Folders are singular: `function/`, `tags/function/`, `tags/block/`, `tags/item/`.
- Text components use the 1.21.5+ syntax (`click_event` / `command`, `hover_event` / `value`).
- `worldborder set` times use an `s` suffix. Since 1.21.11 a bare number means **ticks**.
- Item NBT uses components, and item checks use `execute if items` (with the `contents` slot on item entities).
- Macros (`$` lines, `function x {..}` / `with storage`) are used throughout.

## Build / test

- Build: `zip -r Minigame.zip data pack.mcmeta pack.png LICENSE README.md`. Zips are gitignored.
- Install by putting the pack in `<world>/datapacks/`, then run `/reload`.
- Check that functions loaded: `/function core:` should tab-complete. A parse error in one function silently drops that function, and anything referencing it fails too. Check the server log.
- The world needs **cheats / Allow Commands ON**. Without it, `/function` doesn't exist, even though the menu and `/trigger` still work.
- Setup menu: `/trigger setup` (or `/function core:setup/menu`). Start a game with the menu's Start button or `/function core:start`. Back to the lobby with the Back to lobby button after a game, or `/function core:reset`.
- Solo testing: turn on **Singleplayer** in the menu. It bypasses the player and team start checks and adds a phantom contender, so the game doesn't end instantly. It always ends in a draw when you die. With teams on, join a team first, or the game draws as soon as main starts.
- Reset settings to defaults: `/scoreboard players reset defaults internal`, then `/reload`.

## Layout

```
data/minecraft/tags/function/{load,tick}.json   -> core:load / core:tick
data/core/
  function/
    load, tick, defaults, reset, start
    util/         clock, count_players, error {message}, announce {message}
    setup/        menu (render), trigger -> dispatch, toggle {..}, step {..},
                  center_here, lobby, sfx/{on,off}, ui/{toggle,number,section} {..}
    period/       tick (clock + transitions), starter, grace, main, bossbar
    player/       apply -> lobby | starter | playing | over
    border/       set {size,time}, start, grace, final
    center/       set, apply, gather
    teams/        pick (trigger), join {team,name}, shuffle, shuffle_next, ready
    elimination/  count, death
    win/          check, solo, team {..}, draw, finish
    modules/      cut_clean/{tick,item,smelt}, speed_uhc/{tick,grindstone}
  tags/function/hooks/*.json   -> game:on/<hook> (required: false)
  tags/block/safe.json         blocks a lobby player's head may be in
  tags/item/cut_clean/*.json   ore blocks that smelt (silk touch)
data/game/function/on/         the game's hook stubs (see Hooks)
```

## Hooks

Each `#core:hooks/<name>` tag points to `game:on/<name>` with `required: false`. That means a game can delete stubs it doesn't need, or add more functions to a tag.

| hook            | when / context                                                                                                 |
| --------------- | -------------------------------------------------------------------------------------------------------------- |
| `load`          | end of `core:load`, every `/reload`. Set `storage core:config {title, start_subtitle, main_subtitle}` here      |
| `defaults`      | inside `core:defaults` (runs once, same guard), before the first `reset`                                       |
| `tick`          | end of `core:tick`, every tick                                                                                 |
| `menu`          | as the viewer, inside `setup/menu`, between Extras and Testing                                                 |
| `setup_trigger` | as the clicker, lobby only, when no core button matched. `clicked internal` is the button number (100+)        |
| `start_check`   | as the clicker, after core's start checks pass. Print why, then set `can_start internal` to 0 to block         |
| `start`         | end of `period/starter` (period 0)                                                                             |
| `grace`         | end of `period/grace` (period 1)                                                                               |
| `main`          | end of `period/main` (period 2). Alive players are tagged `core.alive`                                         |
| `bossbar`       | every tick, after core sets `bossbar core:main`. Override it here                                              |
| `death`         | as/at a player eliminated in main, after the counters and announcement                                         |
| `win`           | end of `win/finish` (period 3). Winners are tagged `win`, with none on a draw                                  |
| `reset`         | end of `core:reset` (back to the lobby, and also on the very first load)                                       |
| `center`        | end of `center/apply`, when the play area center moved. Read `storage core:center {x, z}`                      |

## Tick flow (`core:tick`)

1. Lobby only: if `center_set` is unset, set the center to the first player's position. The pre-game actionbar hint appears. Players whose head is in a block not in `#core:safe` are teleported up 5 blocks.
2. The menu is shown once to everyone, keyed by the global `setup internal`. `reset` clears it so the menu appears again.
3. Triggers: `setup` and `team` are enabled for `@a`, and anyone with a value runs `setup/trigger` or `teams/pick`.
4. Modules: `cut_clean` and `speed_uhc` run when they are on.
5. `period/tick`: the clock (periods 0–2), period transitions, the final border shrink, the bossbar, then `player/apply` for anyone whose `last_login ≠ period`.
6. Period 2: `elimination/death` runs for `core.alive` players with `player.death ≥ 1`. Then `player.death` is reset for everyone, and `win/check` runs.
7. `#core:hooks/tick`.

## Game state machine — `period internal`

| value | phase                          | entered via                                  | player state (`player/*`, applied once per period)                                         |
| ----- | ------------------------------ | -------------------------------------------- | ------------------------------------------------------------------------------------------ |
| -1    | lobby                          | `core:reset`                                 | adventure, infinite weakness/resistance/regen/saturation. Clears `core.alive` and `win`     |
| 0     | starter (no PvP)               | `start` → `period/starter`                   | survival (unless spectator), resistance                                                    |
| 1     | grace (PvP on, border shrinks) | `period/grace` when `time_s >= starter_period` | survival (unless spectator), no effects                                                  |
| 2     | main (deaths eliminate)        | `period/main` when `time_s >= grace_period`  | no effects. Players without `core.alive` (joined late) become spectators                   |
| 3     | game over                      | `win/finish`                                 | non-winners become spectators, all get resistance, winners glow                            |

- Each transition resets `time` and `time_s` to 0. The main period has no time limit and ends when `win/check` finds ≤ 1 contender.
- **last_login pattern**: `player/apply` runs when `@s last_login ≠ period` (and for new players, who have no score). It sets `last_login` and dispatches to the period's file. This also handles players who join mid-game.
- **Spectators are observers/admins.** Anyone who switches to spectator after the lobby state was applied stays out of the game. They are ignored by the player count and team checks, and they don't get `core.alive`.

## Scoreboards

Objectives:

- `global`: settings.
- `internal`: state.
- `last_login`: see the pattern above.
- `player.death`: `deathCount`.
- `setup` / `team`: triggers.

### Settings (`<name> global`)

| setting          | default | menu (button numbers)                                                     |
| ---------------- | ------- | ------------------------------------------------------------------------- |
| teams            | 0       | toggle (2 on / 3 off). Shuffle (25) also turns it on                      |
| teams_count      | 2       | ±1, 2..4 (4/5). 2 = red/blue, 3 = +green, 4 = +yellow                     |
| starter_period   | 60 s    | ±10, 10..600 (6/7)                                                        |
| grace_period     | 1800 s  | ±60, 60..7200 (8/9)                                                       |
| border_size      | 2000    | ±100, 100..20000 (10/11). Size the border opens to over 5s at start       |
| border_mid       | 160     | ±10 (12/13). Reached exactly when grace ends                              |
| border_end       | 20      | ±5 (14/15). The final shrink target                                       |
| border_delay     | 130 s   | none. Seconds into main before the final shrink starts                    |
| border_end_time  | 1250 s  | none. Duration of the final shrink                                        |
| cut_clean        | 1       | toggle (16/17)                                                            |
| speed_uhc        | 1       | toggle (18/19)                                                            |
| patch_grindstone_exploit | 1 | none                                                                   |
| singleplayer     | 0       | toggle (23/24)                                                            |

Other buttons: 1 = re-render the menu, 20 = start, 21 = set the center here, 22 = back to lobby (only works in period 3), 25 = shuffle teams. **Core owns 1–99, and games use 100+.** Out-of-range values are clamped by `setup/step`. `start` also keeps `border_end ≤ border_mid ≤ border_size`.

### Key `internal` fake players

- `period`, `time` (0–19), `time_s`, `time_left`.
- `alive`, `alive_red`, `alive_blue`, `alive_green`, `alive_yellow`: counted from `core.alive` at the start of main, then **decremented** on death. Offline players still count, so a game doesn't end because someone disconnected.
- `contenders`: players alive, or teams with someone alive (+1 in singleplayer).
- `players`: set by `util/count_players` (non-spectators).
- `clicked`: the setup button being handled.
- `picked`: the team trigger being handled.
- `can_start`: set by the start_check hook.
- `defaults`: the run-once guard.
- `setup`: "menu already shown".
- `center_set`: the center has been chosen.
- Scratch values: `delta`, `shuffle`, `team_index`.

### Tags

- `core.alive`: still in the game (main period).
- `win`: a winner.
- `core.cc`: an item entity cut clean has already checked.

### Storage

- `core:config {title, start_subtitle, main_subtitle}`: shown via `nbt` text components in the menu header, titles, the main-period announcement and the bossbar.
- `core:center {x, z}`: the play area center.
- `core:border {size, time}`: scratch values for `border/set`.

## Systems

### Setup panel

- The menu is rendered by `setup/menu` as `@s`. Rows use the macros `setup/ui/section {label}`, `setup/ui/toggle {label, score, on, off}` and `setup/ui/number {label, score, down, up}`.
- **Menu buttons never click-run `/function`.** Since 1.21.6, that shows a "run this command?" confirmation for op-level commands. Buttons run `/trigger setup set <n>` instead. `setup/trigger` copies the value into `clicked internal`, resets it, and calls `setup/dispatch` only in the lobby. In period 3 it only accepts 22.
- Dispatch actions are `setup/toggle {score, value}` or `setup/step {score, delta, min, max}`. Both play a sound (`sfx/on` for on or up, `sfx/off` for off or down) and **re-render the menu**. Any custom action must end in `core:setup/sfx/on` or `core:setup/sfx/off` for the same reason.
- Anyone can use the menu. It's trust-based, like the original.

### Teams

- Teams `red`, `blue`, `green` and `yellow` are created in `load`. Team ids equal their colour names, and macros rely on that.
- Players join with `/trigger team set 1..4` (the Join buttons). This only works in the lobby, with teams on, and for team numbers ≤ `teams_count`. Shuffle spreads the non-spectators round-robin in random order.
- `teams/ready` returns 1 when every playing team has a non-spectator and no non-spectator is outside the playing teams.
- Elimination and win logic is **not** copy-pasted per colour. `elimination/death` uses `@s[team=x]` lines, and `win/team` is a macro. **Adding a team colour** means touching: `load` (team add), `teams/pick`, `teams/shuffle_next`, `teams/ready`, the `setup/menu` join rows, `elimination/count`, `elimination/death`, and `win/check` (contender count + win line with firework colours). Then raise the `teams_count` max in `setup/dispatch`.

### World border

- Lobby: size 10 around the center.
- Starter: opens to `border_size` over 5s.
- Grace: shrinks to `border_mid` over exactly `grace_period` seconds.
- Main: at `time_s = border_delay`, it shrinks to `border_end` over `border_end_time` seconds. This is driven from `period/tick`, not `schedule`, so `reset` has nothing to cancel.
- All sizes go through the `border/set {size, time}` macro.

### Play area center

- In the lobby, if `center_set` is unset, `tick` runs `center/set` as the first player. `defaults` clears `center_set`. `load` seeds the storage with 0,0.
- The Set here button (21) runs `setup/center_here`. It calls `center/set` and then teleports everyone to the clicker.
- `center/set` stores @s's x/z, runs `setworldspawn` there, then calls `center/apply` (macro). That runs `worldborder center` and `#core:hooks/center`.
- `center/gather` (macro) teleports everyone to the surface at the center. `reset` uses it.
- Nothing is forceloaded. If a game needs loaded chunks (fills, markers), forceload them in the `center` hook.

### Eliminations and wins

- Deaths only eliminate in period 2, and only for players with `core.alive`. Earlier deaths just respawn at world spawn (the center).
- `elimination/death`: removes `core.alive`, switches the player to spectator, decrements the counters, announces the death (the selector shows the team colour), plays thunder, and runs the `death` hook.
- `win/check`: if `contenders ≤ 1`, the result is a solo win, a team win, or a draw (nobody left, e.g. simultaneous deaths). `win/solo`, `win/team` and `win/draw` each set the title and chat message, and then call `win/finish`. `win/finish` sets period 3, plays the sound, prints the Back to lobby button, and runs the `win` hook.
- Titles always send `subtitle` before `title`.

### Modules

- **Cut Clean**: every item entity without `core.cc` is checked once. Raw ores, ore blocks (`#core:cut_clean/*`) and raw meat/fish have their `Item.id` swapped to the smelted item in place. This keeps the stack count (1:1, so Fortune still matters) and plays a smoke puff. To add an item, add one line to `modules/cut_clean/item`.
- **Speed UHC**: survival players holding an `#minecraft:enchantable/mining` item without Efficiency get Efficiency II. The grindstone patch (`patch_grindstone_exploit`) deletes grindstones within 5 blocks of players and clears them from inventories every tick, because otherwise grinding off the free enchant is an infinite XP source.

## Conventions

- Each file starts with a `# CORE <area>` header (`# GAME <area>` in the game namespace, `# CUT CLEAN` / `# SPEED UHC` for modules). `##` marks sub-notes. There are two blank lines after the header, and two blank lines before a trailing hook call.
- Settings go in `global`, runtime state in `internal`. Toggles use `matches 1..` / `unless ... matches 1..`.
- Chat prefixes: `[X]` (red) for errors (`util/error`, which tells @s, plays bass and fails), `[!]` for announcements (`util/announce`, green, or red for phase changes), `[☠]` for eliminations. They use `dark_gray` brackets.
- Prefer `return run` dispatch and single `execute if score period internal matches N run function ...` gates over repeating the period check on every line.
- Macro arguments are interpolated into JSON strings, so messages must not contain `"`.
- **Adding a game setting** (in the `game` namespace, no core edits):
  - a default in `game:on/defaults`
  - a row in `game:on/menu` via `core:setup/ui/*`, with button numbers 100+
  - dispatch lines in `game:on/setup_trigger` via `core:setup/toggle` / `core:setup/step`
  - then use the setting wherever it is needed
- When starting a new minigame from this template: copy the pack, then fill in `data/game`. Rename `game` if you like, and update the ids in `core/tags/function/hooks/*.json` to match. Set `core:config` in `game:on/load`, and update `pack.mcmeta`, `pack.png` and this file.

## Known limitations / ideas

- `reset` doesn't restore the world. Use a fresh world, or have the game clean up in its `reset` hook.
- There is no eliminate-on-disconnect option. Offline alive players keep their slot until they return.
- Anyone can use the setup menu. A permission model (e.g. only players tagged `host`) would gate `setup/trigger`.
- The grindstone patch still runs a `fill` in an 11³ box around every player every tick.
- A game whose main period ends on a timer (not last-standing) needs to call `win/*` itself from its hooks.
