#!/bin/bash
# Cloud session setup: tools + Claude skills. Runs as root before Claude starts.
# Every step is allowed to fail without stopping the session; problems go to the log.
LOG=/tmp/ade-setup.log
step() { echo "== $1" >>"$LOG"; shift; "$@" >>"$LOG" 2>&1 || echo "!! failed: $*" | tee -a "$LOG"; }

# ffmpeg 8.1 (static build; Ubuntu's 6.1 is too old for lemo-opuscar)
FF=https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-n8.1-latest-linux64-gpl-8.1.tar.xz
ff() {
  d=$(mktemp -d) && curl -sSLf "$FF" | tar xJ -C "$d" --strip-components=2 --wildcards '*/bin/ff*' &&
  install -m755 "$d/ffmpeg" "$d/ffprobe" /usr/local/bin/ && rm -rf "$d"
}
step "ffmpeg 8.1" ff

# Python tools: CPU-only PyTorch first, so Whisper and earshot don't pull the 3 GB GPU build
PIP="pip install -q --disable-pip-version-check"
step "torch (CPU)" $PIP torch --index-url https://download.pytorch.org/whl/cpu
step "yt-dlp" $PIP "yt-dlp @ git+https://github.com/yt-dlp/yt-dlp.git"
step "librosa + whisper" $PIP librosa openai-whisper
step "earshot" $PIP "earshot[mcp] @ git+https://github.com/Leonxlnx/earshot"

# HyperFrames CLI
step "hyperframes" npm i -g --silent hyperframes

# Skills: ADE repo + Remotion's official skills -> ~/.claude/skills; ADE's CLAUDE.md -> ~/.claude/CLAUDE.md
SK=$HOME/.claude/skills
skills() {
  t=$(mktemp -d) && mkdir -p "$SK" &&
  git clone -q --depth 1 "$1" "$t/r" && cp -r "$t/r/skills/." "$SK/" &&
  { [ ! -f "$t/r/CLAUDE.md" ] || [ "$2" != prefs ] || cp "$t/r/CLAUDE.md" "$HOME/.claude/CLAUDE.md"; } && rm -rf "$t"
}
step "skills + prefs: ADE" skills https://github.com/adeflame01/ADE.git prefs
step "skills: Remotion" skills https://github.com/remotion-dev/skills.git

# earshot listening models (~1.1 GB), last so everything else is ready first
step "earshot models" earshot doctor --fetch

echo "ADE setup done: $(ls "$SK" 2>/dev/null | wc -l) skills; log $LOG"
exit 0
