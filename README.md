# ADE

My Claude Code skills. A setup script on my cloud environment copies `skills/*` into `~/.claude/skills/`
at the start of every new session.

| Skill | Source | License |
|---|---|---|
| lemo-opuscar | [lemomo-ai/lemo-opuscar](https://github.com/lemomo-ai/lemo-opuscar) | MIT / CC-BY-NC-4.0 |
| hyperframes, hyperframes-cli, hyperframes-registry, media-use, style-sampling, slideshow, figma, remotion-to-hyperframes | [heygen-com/hyperframes](https://github.com/heygen-com/hyperframes) | Apache-2.0 |
| earshot, real-sound | [Leonxlnx/earshot](https://github.com/Leonxlnx/earshot) | MIT |
| watch | [bradautomates/claude-video](https://github.com/bradautomates/claude-video) | MIT |
| openverse-sfx | [Varnan-Tech/opendirectory](https://github.com/Varnan-Tech/opendirectory) | MIT |

Also downloaded fresh each session (not stored here): the 13 Remotion skills from
[remotion-dev/skills](https://github.com/remotion-dev/skills) (Remotion License).

## Setup script

`setup.sh` is a copy of the setup script saved on my Default cloud environment (the environment holds the copy that runs).
It installs ffmpeg 8.1, yt-dlp, librosa, Whisper (CPU PyTorch), earshot + its models and the HyperFrames CLI,
then copies these skills and the Remotion skills into `~/.claude/skills/`, and `CLAUDE.md` (my preferences) to `~/.claude/CLAUDE.md`. Log: `/tmp/ade-setup.log`.
