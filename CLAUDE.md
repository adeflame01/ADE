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

## Recreating a reference video

- Rebuild it with the free HyperFrames tools (hyperframes skill, ffmpeg, yt-dlp, local `hyperframes render`).
- Don't use paid features (HyperFrames Pro `hyperframes reverse`, HeyGen cloud render or avatars) unless I ask.

## Watching videos (watch skill)

- First use in a session: configure it without asking me:
  `setup.py --engine local`, then `setup.py --backend none --detail balanced`.
- Use the local engine (frames + captions on this machine). Don't send videos to Gemini unless I ask.
- For a video with no captions, transcribe it with the installed `whisper` CLI instead of installing WhisperX.
- YouTube blocks downloads from cloud sessions ("confirm you're not a bot"). For a YouTube link, ask me to upload
  the video file instead; don't use my cookies. Other sites (Vimeo, X, direct links) can be tried.

## Rendering

- Remotion in cloud sessions: pass the preinstalled browser to every render and still:
  `--browser-executable=/opt/pw-browsers/chromium_headless_shell-1243/chrome-headless-shell-linux64/chrome-headless-shell`
  (if that version folder is gone, use whatever `ls /opt/pw-browsers` shows).
- When a skill says to synthesize sound effects in code, use earshot's bank first (see Sound design).
