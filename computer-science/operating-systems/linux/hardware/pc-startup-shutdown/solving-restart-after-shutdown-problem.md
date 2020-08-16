# Solving "restart after shutdown problem"

So, my problem is next. PC restarts/launches automatically after shutdown on Linux Mint 20. 

I identified that PC restarts if and only if my Wi-Fi/networking was enabled before the shutdown. That's all. So, how did I managed to remove this problem? I thought it would be nice to enable/disable networking using systemd service.



## Just in case: solutions for similar problems

1. [One person recommends installing laptop-mode-tools in order to control booting-process](https://forums.linuxmint.com/viewtopic.php?t=199810#p1041344). [Laptop-mode-tools page](https://wiki.archlinux.org/index.php/Laptop_Mode_Tools) on wiki.Archilinux.org.
2. [People recommend disabling USB 3.0 support in BIOS](https://forums.linuxmint.com/viewtopic.php?t=283503#p1566002). It would be nice to disable all options with "Wake on" or "Power on" in Bios.
3. [Here, someone recommends disabling Wake on LAN option in Bios](https://forums.linuxmint.com/viewtopic.php?f=46&t=282106#p1556116). It would be nice to install Bios update if you can. If all else fails you can boot with ACPI disabled, because it might be an ACPI issue (ACPI might be faulty).

## References

1. https://forums.linuxmint.com/viewtopic.php?t=199810#p1041344
2. https://wiki.archlinux.org/index.php/Laptop_Mode_Tools
3. https://forums.linuxmint.com/viewtopic.php?t=283503#p1566002
4. https://forums.linuxmint.com/viewtopic.php?f=46&t=282106#p1556116



