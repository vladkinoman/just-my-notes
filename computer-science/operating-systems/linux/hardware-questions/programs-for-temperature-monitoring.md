# Programs for temperature monitoring

The **CPU** or **GPU** temperature depends entirely on the usage of running programs or applications. Sensitive computer components such as CPUs have a finite lifespan and running them at a temperature that [exceeds a certain limit](https://www.tecmint.com/cputool-limit-linux-process-cpu-usage-load/) (or at higher temperatures generally) can shorten it. Besides, it can also cause thermal throttling especially when the fan is not providing adequate cooling.

So it is important to monitor your system’s CPU temperature to avoid damaging it as a result of overheating. In this article, we will share some useful command-line tools to help you keep a close eye on the temperature of your **CPU** and **GPU**.

## Glances

[Glances](https://www.tecmint.com/glances-an-advanced-real-time-system-monitoring-tool-for-linux/) is a cross-platform, advanced and popular real-time system monitoring tool that uses the **psutil**library to gather information from various system resources.

It can display information from sensors using the **psutil** and/or **hddtemp** tools. One of its intriguing features is the [webserver mode](https://www.tecmint.com/glances-monitor-remote-linux-in-web-server-mode/) which allows you to access it via a web browser to remotely monitor your Linux server.

There are various methods to install **Glances** on your system, but the preferred way of installing **glances** is using an auto-install script, which will install the latest production-ready version.

To install **Glances** on your system, use [curl](https://www.tecmint.com/linux-curl-command-examples/) or [wget](https://www.tecmint.com/10-wget-command-examples-in-linux/) command as shown.

```bash
# curl -L https://bit.ly/glances | /bin/bash
OR
# wget -O- https://bit.ly/glances | /bin/bash
```

Once you have installed it, start **Glances** and press `f` key to view sensors information.

```bash
# glances
```

## Sensors

> This app is recommended by many users. However, I don't like it, because it has no real-time update. Also, you need to use `sensors-detect` first.

**Sensors** is a simple command-line utility that displays the current readings of all sensor chips including the **CPU**. It comes pre-installed some Linux distributions such as **Ubuntu** by default, otherwise install it as shown.

```bash
$ sudo apt-get install lm-sensors
```

Then you can run the following command to detect all sensors on your system.

```bash
$ sudo sensors-detect
```

Once detected, you can run the following command to check CPU temperature, GPU temperature, fan speed, voltage, etc.

```bash
$ sensors
```

Especially `sensors` can be useful to find out the fan speed:

```
sensors | grep fan
```

This will output fan speed

or install `psensor` using:

```
sudo apt-get install psensor
```

One can also use `hardinfo`

```
sudo apt-get install hardinfo
```

> "If `sensors |grep fan` doesn't output anything at all the sensors have to be detected first by running `sensors-detect` after installation (interactive terminal script, just pres Enter on questions and all have to be done automagically). This is needed on CentOS, on Debian configure/reconfigure is fired after install or dpkg-reconfigure psensor). After `sensors-detect` has listed your sensors, you need to check that the kernel driver modules are also installed." - [source](https://unix.stackexchange.com/questions/328906/find-fan-speed-and-cpu-temp-in-linux).

## Hardinfo

**Hardinfo** is a lightweight system profiler and benchmark tool designed for hardware analysis and report generation. It features comprehensive reports on system hardware and allows for the generation of HTML reports on your system’s hardware.

To install the **hardinfo** package on your **Ubuntu** Linux system, run the following command.

```bash
$ sudo apt install hardinfo
```

After the installation is complete, you can launch **hardinfo** to view devices’ information by running the following command.

```bash
$ hardinfo -rma devices.so
```

To launch the **GUI** app, simply run the following command or search for ‘**System Profiler and Benchmark**’ in the system menu or **Dash** and open it.

```bash
$ hardinfo
```

Then click on sensors to view sensors information.

## i7z

> I like this app because it shows the temperature of CPU in real time.

**i7z** is a tiny command-line utility that reports Intel Core i7, i5, i3 CPU information including temperatures. You can install it on your **Ubuntu** system by running the following command.

```bash
$ sudo apt install i7z
```

Once installed, run **i7z** with root privileges as shown.

```bash
$ sudo i7z
```

## Psensor

Some people also recommend [Psensor](https://wpitchoune.net/psensor/). Psensor is a graphical hardware temperature monitor for Linux.

It can monitor:

- the temperature of the motherboard and CPU sensors (using lm-sensors).

- the temperature of the NVidia GPUs (using XNVCtrl).

- the temperature of ATI/AMD GPUs (not enabled in official distribution repositories, see the instructions for enabling its support).

- the temperature of the Hard Disk Drives (using hddtemp or libatasmart).

- the rotation speed of the fans (using lm-sensors).

- the CPU usage (since 0.6.2.10 and using Gtop2).

## S-tui

If you would like to try a different option, you can try s-tui, a software we were working on. It is a terminal UI app, so running it over SSH is also possible. It displays CPU temperature, utilization, frequency and power. Fan speed was also added.

Installation methods are explained on the GitHub Readme. [s-tui on GitHub](https://github.com/amanusk/s-tui)

This is a screenshot of what it looks like [![s-tui screenshot](https://i.stack.imgur.com/O1sZb.png)](https://i.stack.imgur.com/O1sZb.png)

## References

1. https://www.tecmint.com/monitor-cpu-and-gpu-temperature-in-ubuntu/
2. https://wpitchoune.net/psensor/