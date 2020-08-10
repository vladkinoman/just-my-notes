# Monitoring CPU temperature

There are two groups of users worried about the temperature of their computer: overclockers… and pretty much anybody with a powerful laptop. Those things just cook you! So have you ever wondered exactly what temperature your CPU is running at?

There are quite a few Windows programs that you can use to monitor the temperature. Here are two of our favorite options.

> Don't use SpeedFan! SpeedFan could be useful to change the speed fan. However, people don't recommend using this application.

## For Basic CPU Temperature Monitoring: Core Temp

The most important temperature to measure in your computer is the processor, or CPU. Core Temp is a simple, lightweight app that runs in your system tray and monitor’s the temperature of your CPU without cluttering it up with other stuff. It offers a few different options so you can customize it to your tastes, and even works with [other programs like Rainmeter](https://www.howtogeek.com/231711/how-to-use-rainmeter-to-customize-your-windows-desktop/).

[Download Core Temp from its home page](http://www.alcpu.com/CoreTemp/) and install it on your computer. **Be very careful to uncheck the bundled software on the third page of the installation!** This was unchecked by default for me, but other users have noted that it is checked by default for them.

![coretempcrapware](https://www.howtogeek.com/wp-content/uploads/2016/10/xcoretempcrapware.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.3nJwrxdy2j.png)

When you run it, it will appear as an icon or series of icons in your system tray showing the temperature of your CPU. If your CPU has multiple cores (as most modern CPUs do), it will show multiple icons–one for each core.

![screenshot.1](https://www.howtogeek.com/wp-content/uploads/2016/09/xscreenshot.1-2.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.c082tOg8JN.jpg)

Right-click on the icon to show or hide the main window. It will give you a bunch of information about your CPU, including the model, speed, and the temperature of each of its cores.

![coretempmain](https://www.howtogeek.com/wp-content/uploads/2016/10/xcoretempmain.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.LNoYJk56rk.png)

Take particular note of the “TJ. Max” value–this is the highest temperature (in Celsius) at which the manufacturer has rated your CPU to run. If your CPU is anywhere near that temperature, it is considered overheating. (Usually it’s best to keep it at least 10 to 20 degrees lower than that–and even then, if you’re anywhere close, it usually means something is wrong unless you’ve overclocked your CPU.)

For most modern CPUs, Core Temp should be able to detect the Tj. Max for your specific processor, but you should look your specific processor online and double check. Every processor is a little different, and having an accurate Tj. Max value is very important, as it ensures you’re getting the correct temperature readings for your CPU.

Head to Options > Settings to configure some of Core Temp’s more useful features. Here are a few settings we recommend looking at:

- General > Start Core Temp with Windows: You can turn this on or off; it’s up to you. Turning it on will allow you to monitor your temperatures at all time without having to remember to start it up. But if you only need the app occasionally, it’s okay to turn this off.
- Display > Start Core Temp minimized: You’ll probably want to turn this on if you have “Start Core Temp with Windows” on.
- Display > Hide Taskbar Button: Again, if you’re going to leave it running all the time, this is good to turn on so it doesn’t waste space on your taskbar.
- Notification Area > Notification Area Icons: This allows you to customize how Core Temp appears in your notification area (or system tray, as its commonly called). You can choose to display just the app’s icon, or display the temperature of your CPU–I recommend the “highest temperature” (instead of “all cores”, which will show multiple icons). You can also customize the font and colors here.

![screenshot.3](https://www.howtogeek.com/wp-content/uploads/2016/09/xscreenshot.3-1.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.6KXAk7YT4J.png)

If the icon is only appearing in the pop-up tray and you want to see it at all times, just [click and drag it onto your taskbar](https://www.howtogeek.com/75510/beginner-how-to-customize-and-tweak-your-system-tray-icons-in-windows-7/).

![screenshot.7](https://www.howtogeek.com/wp-content/uploads/2016/09/xscreenshot.7-1.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.VpoBAy12pD.jpg)

If you decide to show the temperature in the notification area, you may want to change the Temperature Polling Interval in the General tab of Core Temp’s settings. By default, it’s set to 1000 milliseconds, but you can move it higher if the blinking numbers annoy you. Just remember the higher you set it, the more time it’ll take for Core Temp to notify you if your CPU is running hot.

Core Temp can do a lot more than this–you can head to Options > Overheat Protection to have your computer alert you when it reaches its maximum safe temperature, for example–but these basics should be all you need to keep an eye on your CPU temperatures.

## **For Advanced Monitoring Across Your Entire System: HWMonitor**

> That's what I chose.

Generally, your CPU temperatures are going to be the most important temperatures to monitor. But, if you want to see temperatures across your system–motherboard, CPU, graphics card, and hard drives–[HWMonitor](http://www.cpuid.com/softwares/hwmonitor.html) gives you that and much more.

Download the latest version from [the HWMonitor home page](http://www.cpuid.com/softwares/hwmonitor.html)–I recommend the ZIP version, which doesn’t require installation, though you can also download the full setup version if you want. Start it up, and you’ll be greeted with a table of temperatures, fan speeds, and other values.

![screenshot.2](https://www.howtogeek.com/wp-content/uploads/2016/10/xscreenshot.2-1.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.Az1SrDDPKx.png)

To find your CPU temperature, scroll down to the entry for your CPU–mine, for example, is an “Intel Core i7 4930K”–and look at the “Core #” temperatures in the list.

(Note that “Core Temperature” is different than “CPU Temp”, which will appear under the motherboard section for some PCs. Generally, you’ll want to monitor the Core temperature. See our note below about AMD temperatures for more info.)

![screenshot.3](https://www.howtogeek.com/wp-content/uploads/2016/10/xscreenshot.3-1.png.pagespeed.gp+jp+jw+pj+ws+js+rj+rp+rw+ri+cp+md.ic.8hOUDbjL8S.png)

Feel free to poke around and see temperatures for other components in your system, too. There isn’t much else you can do with HWMonitor, but it’s a good program to have around.

## A Note on AMD Processor Temperatures

Monitoring temperatures for AMD processors has long puzzled computer enthusiasts. Unlike most Intel processors, [AMD machines will report two temperatures](http://www.overclock.net/t/1128821/amd-temp-information-and-guide): “CPU Temperature” and “Core Temperature”.

“CPU Temperature” is an actual temperature sensor inside the CPU’s socket. “Core Temperature”, on the other hand, isn’t really a temperature at all. It’s an arbitrary scale measured in degrees celsius designed to, in a way, *mimic* a temperature sensor.

Your BIOS will often show the CPU Temperature, which may differ from programs like Core Temp, which show Core Temperature. Some programs, like HWMonitor, show both.

CPU Temperature is more accurate at low levels, but less so at high levels. Core Temperature is more accurate when your CPU gets hot–which is when temperature values really matter. So, in almost all cases, you’ll want to pay attention to Core Temperature. When your system is idle, it may show impossibly low temperatures (like 15 degrees celsius), but once things heat up a bit, it will show a more accurate–and useful–value.

## **What to Do If You Don’t Get a Reading (or Temperatures Look Really Wrong)**

In some cases, you may find that one of the above programs doesn’t quite work. Maybe it doesn’t match up with another temperature-monitoring program, maybe it’s absurdly low, or maybe you can’t get a temperature at all.

There are a lot of reasons this could happen, but here are a few things to check:

- Are you looking at the right sensors? If two programs don’t agree, it’s possible–especially on AMD machines–that one program is reporting the “Core temperature” and one is reporting the “CPU temperature”. Make sure you’re comparing apples to apples. Core temperature is usually what you want to monitor, as we mentioned above.
- Make sure your programs are up to date. If you’re using an old version of Core Temp, for example, it may not support your CPU, in which case it won’t provide an accurate temperature (or possibly won’t even provide a temperature at all). Download the latest version to see if it fixes the problem. If you have a very new CPU, you may need to wait for an update to the program.
- How old is your computer? If it’s more than a few years old, it may not be supported by programs like Core Temp.

We could write a book about monitoring CPU temperatures, but in the interest of keeping this easy to follow, we’ll leave it at that. Hopefully, you can get a general estimate of how well your CPU is being cooled.

------

Monitoring your temperatures is good, and something everyone should check on once in a while. But if your computer is regularly overheating, there’s probably a deeper cause that you need to look into. [Open up the Task Manager](https://www.howtogeek.com/108742/how-to-use-the-new-task-manager-in-windows-8/) and see if there are any processes using your CPU, and stop them (or figure out why they’re out of control). Make sure that you aren’t blocking any of the vents on your computer, [especially if it’s a laptop](https://www.howtogeek.com/194479/how-to-clean-the-dust-out-of-your-laptop/). [Blow the vents out with compressed air](https://www.howtogeek.com/72716/how-to-thoroughly-clean-your-dirty-desktop-computer/) to make sure they aren’t filled with dust and dirt. The older and dirtier a computer gets, the harder the fans have to work to keep the temperature down–which means a hot computer and very loud fans.

## References

1. [https://www.howtogeek.com/howto/windows-vista/ever-wonder-what-temperature-your-cpu-is-running-at/#:~:text=To%20find%20your%20CPU%20temperature,motherboard%20section%20for%20some%20PCs.](https://www.howtogeek.com/howto/windows-vista/ever-wonder-what-temperature-your-cpu-is-running-at/#:~:text=To find your CPU temperature,motherboard section for some PCs.)

