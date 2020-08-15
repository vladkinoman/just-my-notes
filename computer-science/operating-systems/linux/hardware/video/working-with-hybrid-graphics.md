# Working with hybrid graphics

> My video cards:
>
> 1. Intel HD Graphics 4000.
> 2. AMD Radeon 8750M (Mars).
>
> CPU: Intel i5-3230M (4) @ 3.200GHz.

## AMD GPU Drivers

### What drivers are better

The official hybrid driver from AMD is really only intended for professional workstation applications, or high performance compute.

For gaming you'll want to use the open source drivers. They'll be pre-installed on most distros, but you'll want to make sure they're up to date. By the way, open source are currently the fastest according to [Phoronix](https://www.phoronix.com/vr.php?view=26776).

So, go with the open source drivers.

Now to clear up some confusion that might arise, as there's a lot of different names going around:

The driver stack is made up of a kernel component (amdgpu) that is bundled with the kernel, and a bunch of userspace libraries that implement the graphics APIs OpenGL and Vulkan.

These userspace libraries are provided by the Mesa project. They're called radeonsi (for OpenGL) and radv (for Vulkan). radeonsi is officially maintained by AMD. radv is a community effort that now also gets contributions from game developers like Valve and Feral.

Now less important stuff, but good to know if you come across these names:

There's a second, also now open source, Vulkan implementation called amdvlk which is developed by AMD and shares code with the Windows driver, but it is less stable and most games and DXVK aren't tested/optimized for it, so just stay away from it unless you know for a fact that a game will run better with it, in which case it can just be installed side-by-side with radv as Vulkan allows this easily.

While newer cards use the amdgpu kernel module, older cards will default to the radeon module. This shouldn't concern you if you're getting an RX 400/500 or Vega series card.

"amdgpu-pro" is the name of the proprietary package that offers a hybrid stack for workstations. You shouldn't install this for gaming.

If you read the names "fglrx" or "catalyst", run for your live and stay away as far as possible. If these pop up in a guide, that's a good hint the guide is horribly outdated.

Edit: I forgot to mention there's also the X11 driver and libdrm but I don't think these are important to know as they should just be preinstalled or pulled in as dependencies anyway.

### Installing amdgpu drivers on Linux Mint 19 Tara

> There isn't a fresh version of this tutorial :disappointed:

Here is the way how to do it with proprietary AMDGPU-PRO drivers: [link](https://www.reddit.com/r/linuxmint/comments/9mxafp/how_to_install_the_ubuntu_amdgpu_drivers_from_amd/). However, people still recommend using the opensource drivers, because they're actually better: [link](https://www.reddit.com/r/linuxmint/wiki/index/graphics#wiki_amd).

### Installing amdgpu drivers on Ubuntu 20.04 Focal Fossa

> Old tutorial on installing drivers on Ubuntu 18.04 Bionic Beaver: [link](https://linuxconfig.org/how-to-install-the-latest-amd-radeon-drivers-on-ubuntu-18-04-bionic-beaver-linux)

Let's start by gathering some information about your system and current state of the AMD Radeon driver. First check your VGA graphic card model and driver in use. To do so execute the following command:

```bash
$ sudo lshw -c video
  *-display                 
       description: VGA compatible controller
       product: Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
       vendor: Advanced Micro Devices, Inc. [AMD/ATI]
       physical id: 0
       bus info: pci@0000:01:00.0
       version: e1
       width: 64 bits
       clock: 33MHz
       capabilities: pm pciexpress msi vga_controller bus_master cap_list rom
       configuration: driver=amdgpu latency=0
       resources: irq:38 memory:e0000000-efffffff memory:f0000000-f01fffff ioport:e000(
```

From the above command output we can see the graphics card model and that the AMD Radeon driver `amdgpu` is already installed and in use. This means that all modules are already loaded and in use:

```bash
$ lsmod | grep amd
amdgpu               4575232  11
amd_iommu_v2           20480  1 amdgpu
gpu_sched              32768  1 amdgpu
ttm                   106496  1 amdgpu
drm_kms_helper        184320  1 amdgpu
drm                   487424  7 gpu_sched,drm_kms_helper,amdgpu,ttm
i2c_algo_bit           16384  1 amdgpu
```

Lastly, check boot messages for more information about the graphics card driver in use:

```bash
$ dmesg | grep -i amdgpu
```

Check AMD Radeon VGA driver version by using the glxinfo:

```bash
$ glxinfo -B
```

![](https://linuxconfig.org/images/02-amd-radeon-ubuntu-20-04-driver-installation.png)

#### Open Source AMD Radeon Ubuntu Driver

The Open Source AMD Radeon Ubuntu Driver is already installed on your system by default and out of the box. They're integrated into Mesa and the Linux kernel. There is nothing further you need to do in order to start using your AMD Radeon card. In this scenario you may not be on the bleeding edge in terms of the latest AMD Radeon driver version, but your system will benefit from an increased stability and painless automatic driver updates.

#### PPA third-party repository

If you absolutely insist to have the latest AMD Radeon driver version you may use the PPA third-party repository which might be always ahead of the stable default opensource driver coming with your Ubuntu 20.04 system as default. To install the PPA third-party repository drivers execute the following commands:

```bash
$ sudo add-apt-repository ppa:oibaf/graphics-drivers
```

The above will add the PPA AMD Radeon driver repository to your system. The following command will upgrade your current AMD Radeon driver to the latest version:

```bash
$ sudo apt update && sudo apt -y upgrade
```

In case you need to revert back to your original Ubuntu AMD Radeon drivers you can remove the PPA driver installation using the below commands:

```bash
$ sudo apt install ppa-purge
$ sudo ppa-purge ppa:oibaf/graphics-drivers
```

#### Proprietary AMDGPU-PRO drivers

> Not recommended.

In order to get the drivers, you need to go to the AMD Download Page, and grab the latest version of the drivers that matches your card. The release should come in the form of a tarball. Either extract the tarball automatically with your GUI archive manager through your browser or let it download and extract it using `tar` from the command line.

```bash
$ tar -xf amdgpu-pro_*.tar.xz
```

A directory containing all of the necessary packages will be created based on the version of the drivers. `cd` into that directory.

```bash
$ cd amdgpu-pro-XX.XX-XXXXXX
```

Don't worry about installing all of those packages individually. There's an installer script that will handle everything for you. Run the script as a regular user. It will ask you for your password to use `sudo`. If you want to be lazy, add the `-y` flag to answer "Yes" to every question.

```bash
$ ./amdgpu-pro-install -y
```

Let the script run and install all of your packages. It'll take a bit of time, but once it's done, your system will be ready. Just restart, and you can start using your new drivers.

In case you need to uninstall the previously installed Proprietary AMDGPU-PRO drivers execute the following command:

```bash
$ amdgpu-pro-uninstall
```

## Switch between Intel/AMD GPU

> I found this answer from the answers to [this](https://askubuntu.com/questions/1068343/switch-between-intel-amd-gpu-on-18-04) question.

To be able to render GPU-intensive applications by the more powerful discrete card use

```bash
$ xrandr --setprovideroffloadsink 1 0
```

Now you should be able to choose a GPU for your application. For example you can test this with a command (using `glxinfo`, `sudo apt install mesa-utils`) I found [here on Ubuntu Forums](https://ubuntuforums.org/showthread.php?t=2336098):

```bash
$ DRI_PRIME=0 glxinfo | grep "OpenGL renderer"
OpenGL renderer string: Mesa DRI Intel(R) HD Graphics 4000 (IVB GT2)
$ DRI_PRIME=1 glxinfo | grep "OpenGL renderer"
OpenGL renderer string: AMD OLAND (DRM 2.50.0, 5.4.0-39-generic, LLVM 10.0.0)
```

## Radeon failed VCE resume (-110)

"Radeon failed VCE resume (-110)" message appears before the log screen and unfortunately this seems like a known issue for now (for a long time). See [this](https://bugzilla.kernel.org/show_bug.cgi?id=107381) bugzilla link.

Someone says that I can mostly ignore it.

I may be using the Intel card instead of the AMD gpu. There is a way to instruct the rendering manager to use a different GPU using an environmental variable:

```bash
DRI_PRIME=1 glxinfo | grep "OpenGL renderer"
```

More information is on the Archlinux wiki [here](https://wiki.archlinux.org/index.php/PRIME).

## PRIME

Speaking of Archlinux and PRIME, there is a [nice tutorial](https://wiki.archlinux.org/index.php/PRIME#PRIME_GPU_offloading) about this technology.

PRIME is a technology used to manage hybrid graphics found on recent desktops and laptops ([Optimus for NVIDIA](https://wiki.archlinux.org/index.php/NVIDIA_Optimus), AMD Dynamic Switchable Graphics for Radeon). **PRIME GPU offloading** and **Reverse PRIME** are an attempt to support muxless hybrid graphics in the Linux kernel.

From that tutorial I used commands from the PRIME GPU offloading section. About it below.

### PRIME GPU offloading section

GPU-intensive applications should be rendered on the more powerful discrete card. The command `xrandr --setprovideroffloadsink provider sink` can be used to make a render offload provider send its output to the sink provider (the provider which has a display connected). The provider and sink identifiers can be numeric (0x7d, 0x56) or a case-sensitive name (Intel, radeon).

> **Note:**
>
> - This setting is no longer necessary when using the default intel/modesetting driver from the official repos, as they have DRI3 enabled by default and will therefore automatically make these assignments. ExpliAbout it below.citly setting them again does no harm, though.
> - GPU offloading is not supported by the closed-source drivers. To get PRIME to work you have to use the discrete card as the primary GPU (for the NVidia driver this is no longer the case, for more info see [#PRIME render offload](https://wiki.archlinux.org/index.php/PRIME#PRIME_render_offload) below.)

Example:

```bash
$ xrandr --setprovideroffloadsink radeon Intel
```

You may also use provider index instead of provider name:

```bash
$ xrandr --setprovideroffloadsink 1 0
```

Now, you can use your discrete card for the applications who need it the most (for example games, 3D modellers...) by prepending the `DRI_PRIME=1` environment variable:

```bash
$ DRI_PRIME=1 glxinfo | grep "OpenGL renderer"
OpenGL renderer string: Gallium 0.4 on AMD TURKS
```

Other applications will still use the less power-hungry integrated card. These settings are lost once the X server restarts, you may want to make a script and auto-run it at the startup of your desktop environment (alternatively, put it in `/etc/X11/xinit/xinitrc.d/`). This may reduce your battery life and increase heat though.

This is how I enable discrete video card when launching Steam:

```bash
$ DRI_PRIME=1 steam
```

### Reverse PRIME

If the second GPU has outputs that are not accessible by the primary GPU, you can use **Reverse PRIME** to make use of them. This will involve using the primary GPU to render the images, and then pass them off to the secondary GPU.

In the scenario above, you would do

```bash
$ xrandr --setprovideroutputsource radeon Intel
```

When this is done, the discrete card's outputs should be available in xrandr, and you could do something like:

```bash
$ xrandr --output HDMI-1 --auto --above LVDS1
```

There may be a situation when the performance might be slow, because all the rendering for all outputs is done by the integrated Intel card. You can read more about this in the "Discrete card as primary GPU" section.

As for Intel and AMD GPU video cards, you can read about them on the corresponding Archlinux pages: [Intel](https://wiki.archlinux.org/index.php/intel_graphics), [AMD GPU](https://wiki.archlinux.org/index.php/AMDGPU).

## References

1. https://www.reddit.com/r/linux_gaming/comments/9iyj1n/amd_gpu_drivers/
2. https://www.reddit.com/r/linuxmint/comments/9mxafp/how_to_install_the_ubuntu_amdgpu_drivers_from_amd/
3. https://www.reddit.com/r/linuxmint/wiki/index/graphics#wiki_amd
4. https://linuxconfig.org/amd-radeon-ubuntu-20-04-driver-installation
5. https://askubuntu.com/questions/1068343/switch-between-intel-amd-gpu-on-18-04
6. https://askubuntu.com/questions/1038271/intel-amd-hybrid-graphics-ubuntu-18-04
7. https://www.reddit.com/r/debian/comments/apispy/radeon_failed_vce_resume_110/
8. https://wiki.archlinux.org/index.php/PRIME#PRIME_GPU_offloading
9. https://wiki.archlinux.org/index.php/intel_graphics
10. https://wiki.archlinux.org/index.php/AMDGPU