# CLAUDE.md — Lava Rising datapack

Minecraft Java datapack for the **Lava Rising** minigame. Players first gather resources. PvP then turns on and the world border shrinks. After that, lava rises from the bottom of the world one layer at a time. The last player or team alive wins.

There is no code outside `.mcfunction` and JSON files. There are no automated tests. Everything is verified in-game.

## Version / port status

The pack was originally written for **1.19** (`pack_format: 10`). It now targets **1.21.11 through 26.3**: `pack.mcmeta` has `min_format: [94, 1]` and `max_format: 121`. Formats must be integers or `[major, minor]` arrays. Decimals like `94.1` are invalid. Data pack formats are: 1.21.11 = 94.1, 26.1 = 101.1, 26.2 = 107.1, 26.3 = 121.0. When a new version ships, check its changelog and raise `max_format`.

Port work done:

- The folders are `function/`, `tags/function/` and `tags/block/` (singular).
- `setup/go` uses the 1.21.5+ text syntax (`click_event` / `command`).
- `safe.json` uses `minecraft:short_grass`.
- `worldborder set` times use an `s` suffix (e.g. `worldborder set 160 1990s`). Since 1.21.11 a bare number means **ticks**.
- Item/firework NBT uses item components (`count`, `components:{"minecraft:fireworks":...}`).
- The play area is centered on a configurable point, not 0,0 (see **Play area center**). Spawn chunks are no longer kept loaded, so `system/center/apply` forceloads ±80 around the center.

Still open:

- Legacy mode (pre-1.18 world height) is meaningless on 1.21+. Consider removing it.

## Build / test

- Build: `zip -r LavaRising.zip data pack.mcmeta pack.png LICENSE README.md`. The zip is gitignored.
- Install by putting the pack in `<world>/datapacks/`, then run `/reload`.
- Check that functions loaded: `/function lavarising:` should tab-complete. A parse error in one function silently drops that function, and anything referencing a missing tag or function fails too. Check the server log.
- The world needs **cheats / Allow Commands ON** (or Open to LAN → Allow Commands). Without it, `/function` doesn't exist ("Unknown or incomplete command … function lavarising:start<--[HERE]"), even though the menu still shows and `/trigger` still works.
- Setup menu: `/trigger setup`, or `/function lavarising:setup/go`. Start a game with `/function lavarising:start`.
- Solo testing: turn on **Singleplayer (testing)** in the setup menu. It bypasses the player and team start checks and adds a phantom alive player. The older `/scoreboard players set debug internal 77` does the same, but it also skips the period check.
- Solo debugging: `/scoreboard players set debug internal 77`. This bypasses the "≥2 players" start check and adds a phantom alive player, so the game doesn't end instantly.
- Reset to defaults: `/scoreboard players reset defaults internal`, then `/reload`.

## Layout

```
data/minecraft/tags/function/{load,tick}.json   -> lavarising:load / lavarising:main
data/fm/function/                               shared helpers ("fm" framework)
  clock           time (ticks) -> time_s (seconds) in `internal`
  players/count   `players internal` = # of non-spectators
  prepare         unused
data/lavarising/function/
  load            objectives, bossbar, teams, riser entity, run defaults once
  defaults        all default settings (guarded by `defaults internal`)
  main            TICK entry point
  time            clock, period transitions, bossbar, per-period player state
  start / start_c validation, then actual game start
  setup/          chat-menu UI (go = render menu; <option>/{on,off,up,down})
  extras/         cut_clean, speed_uhc, grindstone (exploit patch)
  system/period/  grace (0->1), main (1->2)
  system/riser/   main, time, go, quadrants/0..3
  system/border/  grace, legacy/grace, main
  system/death/   solos/go, teams/go_{red,blue,green}, disconnect
  system/win/     solos/{check,go}, teams-2/check, teams-3/check, teams/go_*
  system/performance/nearby_blocks
data/lavarising/tags/block/{safe,illegal}.json
```

## Tick flow (`lavarising:main`)

1. Setup. The menu is shown once, keyed by the global fake player `setup internal`. The pre-game actionbar hint appears, and `/trigger setup` is enabled and handled (it only works in period -1).
2. `bossbar ... players @a`.
3. Pre-game only: if the block above a player isn't `#lavarising:safe`, teleport them up 5 blocks.
4. Extras every tick: `cut_clean`, `speed_uhc`, `grindstone` (when speed_uhc and the patch are on).
5. Range clamps on settings (see the table below).
6. Period 2: falling-block culling, then `system/riser/main` run `as` the riser.
7. `lavarising:time`.
8. Period 2: death checks (`player.death ≥ 1`), then `scoreboard players reset @a player.death`.
9. Period 2: win checks (solo, 2-team, or 3-team).
10. Disconnect elimination is force-disabled here: it prints an error and sets the setting back to 0.

## Game state machine — `period internal`

| value | phase                               | set by                                                | player state (applied in `time`)                |
| ----- | ----------------------------------- | ----------------------------------------------------- | ----------------------------------------------- |
| -1    | pre-game / lobby                    | `defaults`                                            | adventure, weakness/resistance/regen/saturation |
| 0     | starter (no PvP)                    | `start_c`                                             | survival, resistance only                       |
| 1     | grace (PvP on, border shrinks)      | `system/period/grace` when `time_s >= starter_period` | survival, no effects                            |
| 2     | main (lava rises, deaths eliminate) | `system/period/main` when `time_s >= grace_period`    | survival, no effects                            |
| 3     | game over                           | `system/win/**/go*`                                   | non-winners → spectator, all get resistance     |

- `fm:clock` runs only in periods 0–2. Each transition resets `time` and `time_s` to 0.
- **last_login pattern** (`time.mcfunction`): each player's `last_login` holds the period whose state was last applied to them. When `last_login != period`, the state is re-applied once. This also handles players who join mid-game. Players on team `admin` are exempt from gamemode changes, but **that team is never created**.
- The bossbar shows time left for periods 0 and 1, and the riser Y plus rise progress for period 2.

## Scoreboards

Objectives:

- `global`: settings.
- `internal`: state and constants.
- `last_login`: see the pattern above.
- `setup`: a trigger.
- `falling_blocks`: scratch value.
- `player.death`: `deathCount`.
- `player.leave`: `minecraft.custom:minecraft.leave_game`.
- `player.y`: scratch value for the hazard contact checks.

### Settings (`<name> global`)

| setting                                           | default | menu / clamp                                                                                  |
| ------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------- |
| starter_period (s)                                | 60      | ±10 in the menu, no bounds. `main` clamps it to at least 10                                   |
| grace_period (s)                                  | 1800    | ±30 in the menu, range 400..2090. `main` resets values below 400 to **1200**                  |
| rise_ticks                                        | 80      | ±1, range 1..5981                                                                             |
| rise_height_limit (Y)                             | 316     | ±1, min 1. Max 320, or 255 in legacy. `main` forces 251 if legacy is on and the value is ≥257 |
| hazard                                            | 0       | menu picker (triggers 22–25): 0 lava, 1 water, 2 powder snow, 3 void. `main` resets out-of-range values to 0 |
| teams                                             | 0       | toggle                                                                                        |
| teams_count                                       | 2       | **no menu**. 2 = red/blue, 3 = red/blue/green                                                 |
| cut_clean                                         | 1       | toggle                                                                                        |
| speed_uhc                                         | 1       | toggle                                                                                        |
| patch_grindstone_exploit                          | 1       | –                                                                                             |
| sfx                                               | 1       | – (the sound on each lava rise)                                                               |
| kill_nearby_falling_blocks / kill_nearby_distance | 1 / 2   | –                                                                                             |
| kill_all_falling_blocks                           | 0       | –                                                                                             |
| clear_illegal_blocks                              | 1       | –                                                                                             |
| legacy                                            | 0       | toggle (pre-1.18: riser starts at Y 0, lower height cap, different border timings)            |
| singleplayer                                      | 0       | toggle (testing: allows starting alone, adds a phantom alive player)                          |
| eliminate_on_disconnect                           | 0       | force-disabled in `main`                                                                      |

### Key `internal` fake players

- `period`: the game state.
- `time` / `time_s`: the clock.
- `time_left`: shown in the bossbar.
- `riser_height`: current lava Y.
- `rise_time`: ticks since the last rise.
- `alive`, `alive_red`, `alive_blue`, `alive_green`: players still alive.
- `players`: set by `fm:players/count`.
- `can_start*`: start validation flags.
- `1`: the constant 1.
- `defaults`: the run-once guard.
- `setup`: "menu already shown".
- `debug`: 77 means debug mode.

## Riser (lava) mechanics

- When the main phase starts, `system/period/main` summons an invisible marker armor stand tagged `riser` at the play area center, at Y -64 (or 0 in legacy). Any old riser is killed first.
- `system/riser/main` runs as the riser every tick in period 2:
  1. If `clear_illegal_blocks` is on, it replaces `#lavarising:illegal` blocks (water, kelp, seagrass, coral, sea pickles) with air, from the riser's Y up to Y+3, across the area.
  2. It sets `riser_height` to the armor stand's Y − 1.
  3. If `riser_height < rise_height_limit`, it runs `system/riser/time`. That counts `rise_time` up, and at `rise_ticks` it calls `go`.
- `go` teleports the riser up 1 block. It then fills one lava layer in 4 quadrants (±80 on x/z around the riser, 161×161 in total). The quadrants run at 0, 2, 4 and 6 ticks via `schedule`, which spreads out the lag and keeps each `fill` under the 32768-block limit. The quadrant functions re-find the riser with `execute at @e[tag=riser,limit=1]`.
- Falling-block culling (`system/performance/nearby_blocks`) kills falling blocks whose Y − `kill_nearby_distance` is ≤ `riser_height`.
- The lava fills and illegal-block clears are **relative to the riser** (`~-80..~80`), so the riser's x/z is the play area center.

### Hazard (`hazard global`)

What rises is configurable. "Lava" in the rest of this file means whichever hazard is selected.

| value | hazard      | layer filled with | how it kills                                                                                       |
| ----- | ----------- | ----------------- | -------------------------------------------------------------------------------------------------- |
| 0     | lava        | `lava`            | vanilla lava damage                                                                                |
| 1     | water       | `water`           | `system/hazard/water`: 2 `drown` damage per hit (i-frames → ~4 HP/s) when feet Y ≤ `riser_height` and in `#lavarising:water_hazard` |
| 2     | powder snow | `powder_snow`     | vanilla freezing. Leather boots let players walk on it                                             |
| 3     | void        | `air`             | `system/hazard/void`: `out_of_world` damage when feet Y ≤ `riser_height`, so blocks placed below the cleared layer don't save anyone |

- The quadrant functions have one gated `fill` line per hazard.
- `clear_illegal_blocks` only runs for lava. In water mode it would delete the newly placed water layer.
- Rise SFX, the `start_c` subtitle, the `system/period/main` announcement and the period-2 bossbar title all have one line per hazard.
- Adding a hazard means touching all of those, plus `defaults`, the `main` clamp, `setup/go`, `setup/trigger` and `setup/hazard/<name>`.

### Play area center

- It's stored in `storage lavarising:center {x, z}` (for macros), plus the `center_x` / `center_z global` scores (for display). `center_set internal` means it has been chosen.
- **Default:** in period -1, if `center_set` is unset, `main` runs `system/center/set` as the first player (`@a[limit=1]`). `defaults` resets `center_set`. `load` seeds the storage with 0,0 so macros never fail.
- **Set here:** the menu button (trigger 21) runs `setup/center/here`. It calls `set` and then teleports everyone to the clicker.
- `system/center/set` stores @s's x/z, runs `setworldspawn` there (so respawns land inside the area), then calls `apply`.
- `system/center/apply` (macro) kills loaded risers, runs `worldborder center`, `forceload remove all`, then `forceload add` ±80 around the center.
- The riser is only summoned when the main period starts, by `system/center/riser` (macro, called from `system/period/main`). It's placed at the center, at Y -64 (or 0 in legacy).

### World border

- Pre-game: 10.
- `start_c`: expands over 5s to a size that depends on the `grace_period` bucket (444…2222).
- Grace (`system/border/grace`): shrinks to 160 over roughly `grace_period + 190` seconds. The legacy version uses roughly `grace_period` seconds.
- Main: `system/period/main` schedules `system/border/main` 130s later, which shrinks the border to 20 over 1250s.
- These three bucket tables are hand-written in 100s steps. Keep them in sync if you change one.

## Deaths, teams, wins

- Deaths only count in period 2. A death puts the player in spectator mode and decrements `alive`, plus `alive_<team>` in team games. It also announces the death and plays thunder.
- Teams `red`, `blue` and `green` are created in `load`. Players are assigned manually with `/team join`. `start` refuses to start if teams are on and any player is outside the allowed teams, or if an allowed team is empty.
- Solo win: when `alive ≤ 1`, the remaining survival player gets tagged `win`, then `system/win/solos/go` runs.
- Team wins: when exactly one team has `alive_<team> ≥ 1`, that team's `go_<color>` runs.
- `win/**/go*` sets period 3, shows the title, gives everyone resistance, launches fireworks at the winners, and makes the winners glow.
- The `start_c` → next-game path clears the `win` tags. There is no automatic world or riser reset between games: a new game needs a fresh world, or `period` set back to -1 and the riser moved back.

## Conventions

- Each file starts with a `# LAVARISING <area>` header. `##` marks sub-notes. There are two blank lines after the header.
- Settings go in `global`, runtime state in `internal`. Toggles use `matches 1..` / `unless ... matches 1..`.
- Chat prefixes: `[X]` (red) for errors, `[!]` for announcements, `[☠]` for eliminations. They use `dark_gray` brackets.
- **Menu buttons never click-run `/function`.** Since 1.21.6, that shows a "run this command?" confirmation screen for any op-level command. Buttons run `/trigger setup set <n>` instead, and `setup/trigger` dispatches on the value: 1 = menu, 2–19 = option on/off/down/up, 20 = start, 21 = set center here, 22–25 = hazard lava/water/powder snow/void. Pick an unused number for a new button.
- Every setup action calls `setup/sfx/on` or `setup/sfx/off`, which plays a sound and **re-renders `setup/go`**.
- **Adding a setting** requires changes in these places:
  - a default in `defaults`
  - a menu line in `setup/go` (clicks use `/trigger setup set <n>`)
  - a dispatch line for each `<n>` in `setup/trigger`
  - the `setup/<name>/{on,off}` or `{up,down}` files
  - a clamp in `main` (optional)
  - then use the setting wherever it is needed
- Team logic is copy-pasted per colour. Any change to `death/teams/go_*`, `win/teams/go_*` or `win/teams-*/check` must be applied to red, blue **and** green.
- Nearly every line in `main` and `time` gates on `period` itself. Keep that pattern, or better, group lines under a single `execute if score period internal matches N run function ...`.

## Known bugs / improvement ideas (not yet fixed)

- `system/death/*` runs `scoreboard players reset @s death`, but that objective doesn't exist. It's harmless because `main` resets `player.death`.
- `win/teams/go_green`'s title color is `blue`. The header comment in `go_blue` says "teams red", and the one in `go_green` says "teams blue".
- Team `admin` is referenced in `time` but never created.
- A solo game where the last players die on the same tick (`alive` = 0) ends with no winner tagged.
- `eliminate_on_disconnect` is stubbed out. `system/death/disconnect` exists but is never reached. Items from the old todo list that are still open: announce team eliminations, and eliminate players on disconnect.
- `cut_clean` matches items by English display name (`name="Raw Iron"`) and runs 3 selectors per item type every tick. It would be better to do one `as @e[type=item]` pass that checks `Item.id` (or uses an item predicate) and then dispatches. Also, 1.16-era ore names don't drop as items in 1.21.
- `speed_uhc` runs `enchant @a efficiency 2` every tick. That only affects held items, and it spams errors on items that can't be enchanted.
- `grindstone` runs a `fill` in an 11³ box around every player every tick.
- `time`'s last_login block re-evaluates `as @a` plus the period check on about 24 lines every tick. It could dispatch once per period to a function.
- 1.21 features that could simplify things:
  - `return` and `execute if function` for guard clauses
  - function macros for the per-team copies and the border bucket tables
  - `execute summon` / `on`
  - item components
