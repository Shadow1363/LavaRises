# Minigame Template

A Minecraft Java datapack (1.21.11 – 26.3) base for last-player-standing minigames. It includes:

- an in-chat **setup panel** (`/trigger setup`), so players never need op or confirmation prompts
- **periods**: lobby → starter (no PvP) → grace (PvP, border shrinks) → main (deaths eliminate) → game over
- a **world border** that opens up, shrinks during grace, then shrinks again in main
- **teams**: 2–4 teams, join buttons, shuffle, and team win detection
- **Cut Clean**: instant smelting of ores and food
- **Speed UHC**: free Efficiency II, with a grindstone exploit patch
- solo, team and draw endings, plus a **Back to lobby** button

## Making a game

The engine lives in `data/core`. Your game goes in `data/game/function/on/*`. Core calls these hooks at the right moments (start, main period, death, win…). Each stub explains what it receives and shows examples.

1. Set the title and subtitles in `game:on/load`.
2. Start your mechanic in `game:on/main`, run it every tick from `game:on/tick`, and stop it in `game:on/win` / `game:on/reset`.
3. Add settings with `game:on/defaults`, `game:on/menu` and `game:on/setup_trigger`, using button numbers 100 and up.

See `CLAUDE.md` for the full reference.

## To Build

`zip -r Minigame.zip data pack.mcmeta pack.png LICENSE README.md`

Load as a datapack in a world with cheats on.
