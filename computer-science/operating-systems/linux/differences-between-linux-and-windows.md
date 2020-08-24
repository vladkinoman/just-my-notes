# Differences between Linux and Windows

## Fast shutdowns and startups

Some user started the [discussion](https://forums.linuxmint.com/viewtopic.php?t=215021) about suspicious fast shutdowns on Linux Mint 17.3. What other people say:

> This is some of the cool things about Linux. Fast shutdowns and startups. If you decide to try to compile your own kernel you can boot even faster by eliminating components you don't need.
>
> Windows has a lot of administrative work to execute when shutting down. Linux is a different animal altogether.
>
> Now, if you start using exotic protocols like NFS that have to deal with remote file locks, or you install MySQL database server on your machine, you will start seeing the shutdowns arent as fast.

### Why Linux Boots Faster Than Windows?

> The next info on this topic I found [here](https://techlog360.com/linux-boot-shutdown-faster-than-windows/#:~:text=simple text files.-,Process %26 Programs,and exit faster during shutdown.).

First we are going to discuss why Linux boots faster than windows .

A lot factors affect the boot time of both Linux and Windows. Some of the notable reasons are :

#### Kernel

Kernel is the nucleus of an operating system. It has complete control over everything that occurs in the system.

Linux Kernel is monolithic — means it holds all functionality,even drivers ,memory management, task scheduler and file system. So while booting Kernel loads all these functions at once.

And Windows NT kernel is like a micro-kernel which only holds basic features during boot process, then loads other functions,drivers and file systems. Which makes Windows to boot a bit slower than Linux.

#### Services And Programs

In Windows many services auto-starts during start up along with many programs like Antivirus which makes booting process slow. While in case of Linux it is limited.

#### Backward Compatibility

Backward compatibility allows software systems to successfully use interfaces and data from earlier versions of the system or with other systems.

And Windows has a long history and they support old software frameworks, so during boot time, Windows have to load these libraries to make the Windows experience smoother.

While [Linux distributions](https://techlog360.com/tag/linux-distro/) doesn’t have backward compatibility feature.

#### Fragmentation

Fragmentation means the storing of a file in several separate areas of memory scattered throughout a hard disk.

In Windows files are fragmented. So hard disk takes more time for read and write during start up. And also when you installs more programs in Windows, then system takes more time to load. You can notices these by delay in boot time with new and used Windows system.

And in Linux filesystem used is EXT, which doesn’t requires fragmentation. Because Linux allocates files in a more intelligent way. Instead of placing multiple files near each other on the hard disk, Linux file systems scatter different files all over the disk, leaving a large amount of free space between them. So read and write during start up is faster.

#### Desktop Environment

Another main reason behind faster Linux boot is its Desktop Environment (DE). Which is quite faster than Windows.

### Why Linux Shutdown Faster Than Windows?

Now we are going to discuss why Linux shutdown faster than Windows.

#### Services In Windows Delays Shutdown

During Windows shutdown, most services will generate at least one event on terminating. Sometimes each service may have many events.

Eg “NTP Service terminating”, “Printer Driver got signal to terminate”, “Printer Driver is flushing the queue” “Printer Driver Exiting”. These Events are “objects” and are slow to create and destroy, which adds up to shutdown time.

However, during shutdown on Linux, most processes simply print a line on the console or/var/log/messages and exit. Which makes a smoother shutdown.

#### Cache

Windows may cache many things and these caches have to be flushed to filesystem on shutdown. But caches are handled better in Linux, with periodic “fsync” executions, on better filesystems.

#### GUI

Graphical User Interface (GUI) in Windows saves a lot of state information most of which is stored as objects. Which affect shutdown time.

While in case of Linux, Command Line Interface (CLI) has almost nothing to save, except for the shell history file. Most state information is in simple text files.

#### Process & Programs

Like services, some process and programs in Windows a lot more time to exit during shutdown and it will hung up and sometimes we have to forcibly terminate the task.

And Linux takes less time to each process to exit, and most programs may respond quickly and exit faster during shutdown.

However unlike previous Windows versions, Windows 10 some what improved its boot and shutdown time but still doesn’t faster than Linux.

