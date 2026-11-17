# My preferences

Copied to `~/.claude/CLAUDE.md` by the setup script, so these apply in every cloud session.

## Sound design

- Build soundtracks from sounds available here: earshot's built-in bank (`earshot sfx list`, `earshot sfx render`,
  `earshot kit`) and any audio files I upload.
- Don't rely on Freesound (cdn.freesound.org refuses downloads from cloud sessions). Openverse/Jamendo results are
  fine when they download; skip any that fail rather than working around a site's block.
- Use earshot to choose, check and compare sounds before saying how anything sounds.
- Use openverse-sfx's tools to finish: `sfx_normalize.py` for levels, `beat_grid.py` for beat timing and
  `verify_mix.py` on the exported MP4. Iterate until it passes (-16 LUFS, true peak below -4 dBFS).
- Write `credits.txt` for any sound that needs attribution.
