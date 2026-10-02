# ScreenCaster

A lightweight, OBS-style screen recorder and live streamer for Windows.
Record your screen to a file, stream to **Twitch** or **YouTube** (or any RTMP server), or do both at once.
Built with Python (Tkinter) and FFmpeg.

## Features
- Capture the entire desktop, a custom region, or a single window
- Record to MKV (crash-safe) or MP4
- Live stream over RTMP: Twitch, YouTube, or a custom server
- Record and stream simultaneously
- Up to two audio sources (e.g. microphone + system audio), mixed together
- x264 (CPU) or NVENC (NVIDIA GPU) encoding, configurable FPS, size and bitrate
- Your stream key is never written to disk

## Quick start
1. Get **FFmpeg**: `winget install Gyan.FFmpeg`, or download `ffmpeg.exe` and put it next to the app.
2. Either:
   - double-click `build_exe.bat` to produce `ScreenCaster.exe` (needs Python 3.9+), or
   - double-click `run.bat` to run directly from source.

Tip: if `ffmpeg.exe` is in the project folder when you run `build_exe.bat`, it is bundled into the `.exe`
so the result is a single standalone file.

## Streaming setup
| Platform | Server (auto-filled) | Stream key |
|---|---|---|
| Twitch | `rtmp://live.twitch.tv/app` | Creator Dashboard > Settings > Stream |
| YouTube | `rtmp://a.rtmp.youtube.com/live2` | YouTube Studio > Go Live > Stream key |

Recommended: 1920x1080 at 30 FPS with 4500-6000 kbps (check your platform's current guidelines).

## Capturing system audio
Windows exposes it through DirectShow only if a device is enabled, e.g. **Stereo Mix**
(Sound settings > Recording > show disabled devices) or a virtual cable such as VB-Cable.
Pick it as "Device 1" and your microphone as "Device 2".

## Development
```
python src/app.py
python -m pytest tests
```

## Limitations
Windows only (uses FFmpeg's `gdigrab` and `dshow`). No scenes, overlays or per-app audio capture like OBS.

## Responsible use
Only capture and broadcast content you have the right to share, and keep your stream key private.

## License
MIT
