# Fans

## Debugging ACPI

The Advanced Configuration and Power Interface (ACPI) is an open industry specification which establishes industry-standard interfaces enabling OS-directed configuration, power management, and thermal management of mobile, desktop, and server platforms. Support is often tough to get right. The following information can help with debugging ACPI related issues. For background information regarding ACPI, see [www.acpi.info](http://www.acpi.info/), [ACPI Overview](http://www.acpi.info/presentations/ACPI_Overview.pdf) and [Wikipedia](http://en.wikipedia.org/wiki/Acpi).

### Debugging procedure

(See [LessWatts.org](http://www.lesswatts.org/projects/acpi/debug.php) for more information regarding ACPI debugging in general.)

1. Make sure your BIOS is up to date.
   - To find the version of the BIOS you currently have, run `sudo dmidecode`. The version of your BIOS should be listed in the BIOS Information section of the output.
   - Check to see if your hardware's manufacturer has provided a newer BIOS version.

#### Trouble Booting

For detailed instructions regarding how to modify boot parameters see [DebuggingKernelBoot](https://wiki.ubuntu.com/DebuggingKernelBoot).

1. Try booting with the "acpi=off" kernel parameter
   - This will disable ACPI support. If the error is the same with ACPI enabled and disabled, this may not be an ACPI issue.
2. If "acpi=off" allows the system to boot, try to isolate the ACPI issue with the following boot parameters
   - Try booting with "acpi=ht"
     - This disables all of ACPI except just enough to enable Hyper Threading. If acpi=off works and acpi=ht fails, then the issue is in the ACPI table parsing code itself, or perhaps the SMP code.
   - Try booting with "pci=noacpi"
     - This disables ACPI for IRQ routing and PCI scanning.
   - Try booting with "acpi=noirq"
     - This disables ACPI for IRQ routing.
   - Try booting with "pnpacpi=off"
     - This disables the ACPI component of the Linux Plug and Play code.
   - Try booting with "noapic"
     - Disables the IO-APIC for IRQ routing or PCI scanning.
   - Try booting with "nolapic"
     - Disables the local APIC.

#### Fan Issues

These usually relate to the fan spinning too often or too fast. Another indication may be that the temperature remains high even when the fans are spinning.

1. Determine if the system has ACPI-based fan control
   - if **/proc/acpi/fan** is empty and **/proc/acpi/thermal_zone/\*/trip_points** has no active trip points (those starting with "AC") then there is no ACPI-based fan control on your system
2. If the system does have an ACPI-based fan control try booting with kernel parameter options listed above

More about this: [link](https://wiki.ubuntu.com/DebuggingACPI).

## Detecting fans

Fans can be detecting using next command:

```bash
$ sudo sensors-detect
```

It's okay to say "yes" to all the questions.

Now, you should launch `sensors` to print the list of the devices and their temperatures:

```bash
$ sensors
coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +68.0°C  (high = +87.0°C, crit = +105.0°C)
Core 0:        +67.0°C  (high = +87.0°C, crit = +105.0°C)
Core 1:        +68.0°C  (high = +87.0°C, crit = +105.0°C)

BAT0-acpi-0
Adapter: ACPI interface
in0:          12.35 V  
curr1:         0.00 A  

radeon-pci-0100
Adapter: PCI adapter
temp1:        +58.0°C  (crit = +120.0°C, hyst = +90.0°C)

acpitz-acpi-0
Adapter: ACPI interface
temp1:        +71.0°C  (crit = +128.0°C)
temp2:        +59.0°C  (crit = +128.0°C)
temp3:        +52.0°C  (crit = +128.0°C)
temp4:        +56.0°C  (crit = +128.0°C)
temp5:         +0.0°C  (crit = +128.0°C)
temp6:       +127.0°C  (crit = +128.0°C)
```

`sensors` couldn't find my fans. That's because I have no pins for them. Or maybe this is a driver issue which is most likely. Considering driver issue, I found this information from [this question](https://askubuntu.com/questions/114490/fan-not-detected-by-lm-sensors).  There may also be a problem with drivers even when one of the sensors shows 127 degrees according to [this](https://askubuntu.com/questions/177698/sensors-showing-temps-like-127c):

> Now i just applied the propriety driver and i think it is working well !

Although, OP solved his problem this way:

> I have found out that this occurs when you have two graphic cards (integrated and discrete) and discrete is turned off (usually with `echo OFF > /sys/kernel/debug/vgaswitcheroo/switch` at boot time).
>
> If you [power on your discrete card](https://help.ubuntu.com/community/HybridGraphics), the temperature readings become normal.

## Fan control

From [this discussion](https://forums.linuxmint.com/viewtopic.php?t=278215):

> 1. How can I check if the system detects my fans?
> 2. How can I control the fan speeds?
> 3. Why does the laptop warm up even when it's in locked mode and the lid is closed? One would expect it to stay cool...

Hi, i usually post in threads about heat issues. If you check my posts you will find a range of advice that might be of use to you. So as to the questions above:

1. You just did by giving your temp readouts. Now IF your laptop has a discreet GPU (which i think it does not), then that could be an issue as you will need to install the correct drivers for that GPU and hope it works (I never got it to before i cooked one laptop!).

2. You can't really. If you can it is incredibly complex to do in Linux it seems. There are no easy to install utilities to let you set/adjust fan speeds in your machine, or certainly none i am aware of.
   I use psensor to show me my temps at all times, and you can set it to give warnings. It is available to download in the 'Software Manager' (Menu>Administration>Software Manager) and you can type 'psensor' into the search bar and you want psensor and psensor-common to set it up.

   > Some user tried his best to do this but he couldn't. Here is the [discussion](https://forums.linuxmint.com/viewtopic.php?t=325963).

3. Not sure really, although it could be an issue of the fans going into 'sleep' mode whenever you use the 'locked' mode? For the laptop that cooked itself to death, it's GPU fan would not spin until i had logged out of the 'desktop' into the login screen, then it would fire up full speed to deal with the crazy temps (it hit 100 degrees C a few times!).
   Finally the BEST solution i have found to Mint overheating is to use external fans to blow more air into the case of the laptop/pc. You can get various cheap usb fans that do the job or spend a lot on those laptop base attachments that have a bunch of fans that blow air upwards into the vents etc. I use the usb single fan types and position them to blow air into the case via an opening (like open the DVD slot etc). It takes a good 10 degrees C of my temps overall but does not stop the peaks (usually from watching youtube) that go into the 80's degrees C.

Start at the beginning and give the readout from your inxi -Fxz, and folks will be able to help better.

> In [this discussion](https://forums.linuxmint.com/viewtopic.php?t=282341), this user recommends doing these steps:
>
> Try this edit the file; /etc/default/grub
> change the line;
> GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
> to read;
> GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi=LINUX"
> save, and exit
> run
> sudo update-grub
> reboot

## Package temperature above threshold, cpu clock throttled

Found the next information from [this question](https://superuser.com/questions/478721/package-temperature-above-threshold-cpu-clock-throttled):

>[You said:](https://superuser.com/questions/478721/package-temperature-above-threshold-cpu-clock-throttled#comment572222_482169)
>
>> I had cpu cooling (fan) but it went kaput `:(`
>
>This is why you are having this problem. Your CPU is overheating; these messages are warning you that the system is throttling down **in order to prevent permanent physical damage to the system**.
>
>I generally expect a Core i7 desktop CPU running under full load to be somewhere around 75-80 degrees Celsius. At around 95-100, thermal throttling kicks in. If it gets significantly above that, the computer will power itself off without warning in an attempt to prevent permanent damage.
>
>**The proper thing to do is to replace the CPU fan.** Replacement OEM fan/heatsink combos can be had on eBay for less than $20; or you may want to invest a little more cash in something better if you intend to overclock, or run lots of these computations. A better fan may run quieter for the same CPU temperatures, or may cool the CPU more effectively allowing for overclocking, or both.
>
>**Ignoring this message, you will eventually destroy your CPU or lose significant amounts of performance or both.**

## Problems in video games

[Witcher 2 overheats and shuts system down](https://ubuntuforums.org/showthread.php?t=2370547).