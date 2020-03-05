> Source: [link](steamcommunity.com/discussions/forum/12/412447331651444453/)﻿.

Frame rate/FPS is a function of the power of your GPU vs the workload placed on it.

A higher resolution means a bigger workload, thus lower framerates. Depending on the power of the GPU, you may still reach 60 fps.

Newer, more demanding games, or inefficient engines (looking at you, every Bethesda engine ever), mean a bigger workload. But again, throw enough GPU power at it and you can still get to 60 fps.

720p: 1280x720 is 0.9 megapixels for the GPU to deliver
1080p: 1920x1080 is 2.1 megapixels for the GPU to deliver
1280x1024 is 1.2 megapixels for the GPU to deliver
1366x768 is 1.0 megapixels for the GPU to deliver

So in terms of performance, you can expect your alternate resolutions to be close to 720p, but a couple of fps lower.

---

A lower resolution will always be less demanding but the resolution does not actually affect the CPU much, the graphics card directly has access to view port and renders there, if anything if the CPU wants to draw something it still has to go through the graphics card to present anything to the screen. A lower resolution is less demanding for the GPU because it has less pixels to rasterize in between vertices, but it is not as demanding as many people make it sound, it is not exactly twice as demanding to render something at 1080p then it is at 720p.

If the game has a dynamic frame rate if the game runs slower then normal(normally 60 FPS but it is running at 30 FPS) but the gamelay does not slow down and instead looks more choppy. If its fixed a lower frame rate will mean the actual game will not look choppy but will instead appear to be running in slow motion.

---

If a game supports 60 fps @ 720p and 30 fps @ 1080p , what will happen if I use 1280x1024
or 1366x768 . Will I get 60 fps because it is below 1080p or 30 fps because it is above 720p?

1:Depends on the game
2:Depends on game Engine
3:Depends on Game Option
4:Depends on you PC/Laptop Specs

---

Changing the resolution changes the balance of the workload between the CPU and the GPU. At a high resolution and high detail settings, the CPU will be waiting for the GPU. At a low resolution/low detail settings, the GPU will be waiting for the CPU. But in the first case you're rendering, say, 60 fps and in the second case you're rendering 300 fps.

Is the CPU working harder? Technically, yes. But if you were to cap the fps at 60, then both CPU and GPU will be working less than they would at a higher resolution.

So for the same fps, a lower resolution is NOT more taxing on the CPU.

---

> So, if I use a software like dxtory to lock fps , will it just show less frames or it will stop cpu and gpu from making extra frames ?

Depends on the way the application is set up to run, a good modern programmer will have the game physics running in a seperate thread will the games rendering runs in another thread. As far as application interactions are concerned i have no idea, but in general you cannot stop the GPU from rendering a frame, once a draw call is sent the GPU will draw that frame, regardless of its render target. The only way to make a thread actually stop running is to put it to sleep but is not a safe or stable practice on windows.