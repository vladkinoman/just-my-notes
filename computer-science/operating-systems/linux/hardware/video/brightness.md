# Настройка яркости в Ubuntu

> Если по умолчанию яркость не настроена. Хотя, в Ubuntu 18.04 LTS (и аналогичной Lubuntu) всё уже работает.

Для настройки:

1. Необходимо прописать в /etc/default/grub следующее (отредактировать
  имеющуюся строку до следующего вида):
  GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_backlight=vendor"
2. sudo update­grub
3. Перезагрузится