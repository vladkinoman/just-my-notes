# PCSX2 life hacks

All life hacks I found on site [1] and tested on my laptop using Metal Gear Solid 3 Snake Eater (PAL version which comes with 3 discs: Subsistence, Persistence, and Existence). Metal Gear Solid 3: Snake Eater is a "Crysis" game for the best Playstation 2 emulator called PCSX2. Well, it is not perfect emulator, but it is still better than others. MGS 3 doesn't work perfectly, but it is playable. I would say the game works above average. It is a bit laggy in high-density locations with grass (for example).

Computer: Intel Core i5-3230M 2.60 GHz (2 cores) / 4.00 Gb RAM / AMD RADEON HD 8750M (Direct3D 11 video card).

## Emulator settings

GS Window:

- Aspect Ratio: Fit to Window / Screen.
- Custom Window Size: 800 x 600.

Speedhacks:

- Enable speedhacks: check.
- EE Cyclerate [Not Recommended]: I use 0 - Default cyclerate, meanwhile PCSX2 Wiki recommends +2.
- Other Hacks:
  - Enable INTC Spin Detection: check.
  - Enable Wait Loop Detection: check.
- microVU Hacks:
  - mVU Flag Hack: check.

Game Fixes:

- Enable manual game fixes [Not recommended]: check.
  - FFX videos fix - Fixed bad graphics overlay in FFX videos.

## Video settings (GSdx plugin settings)

- Adapter: Default Hardware Device.
- Renderer: Direct3D11 (Hardware).
- Interlacing: Auto.

Hardware Mode Settings:

- Internal Resolution: 2x Native (3x Native gives few more lags for my computer).
- Texture Filtering: Bilinear (PS 2).
- Anisotropic Filtering: 2x.
- CRC Hack Level: Full (Safest).
- Enable HW Hacks: check + Configure Hacks:
  - Skipdraw: 1.

## Sound settings (SPU2-X plugin settings)

Mixing Settings:

- Interpolation: 4-Catmull-Rom (PS2-like/slow).
- others are unchecked.

Output Settings:

- Module: 1 - XAudio 2 (Recommended)
- Volume: 50% is OK for me.
- Latency: 100 ms (avg).
- Synchronizing Mode (It is a key parameter for the MGS 3 Snake Eater): Async Mix.
- Audio Expansion Mode: Stereo (none, default).

## Aspect ratio

> Just select it in-game and press F6 with GSDX to change between Aspect Ratios.

16:10 (my screen is 1680x1050) isn't even supported by the PS2. You can just play at 16:9 (1920x1080) when supported or 4:3 (800x600 - I use it, 1600x1200).

If you still want to stretch it though, GSDx does support it.

## References

1. [Metal Gear Solid 3: Snake Eater - PCSX2 - Wiki](https://wiki.pcsx2.net/Metal_Gear_Solid_3:_Snake_Eater).

