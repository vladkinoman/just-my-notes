# Wi-Fi keeps dropping out

**Issue. ** Wi-Fi keeps disconnecting during idle periods.

`journalctl -f` gives me the following error (or similar one - I can't remember):

```bash
kernel: wlan1: deauthenticating from x by local choice (reason=3)
...
wpa_supplicant[123]: wlo1: CTRL-EVENT-BEACON-LOSS
```

**Solution**.

First I tried [this](https://askubuntu.com/questions/554584/kernel-wlan0-deauthenticating-from-x-by-local-choice-reason-3) strange suggestion to kill the [wpa_supplicant](https://wiki.archlinux.org/index.php/wpa_supplicant) service:

```bash
sudo killall wpa_supplicant
```

It may have helped me, but only temporarily.

Then I found [this](https://bbs.archlinux.org/viewtopic.php?id=226251) discussion on the ArchLinux forum. So, I executed the following command:

```bash
systemctl list-unit-files --state enabled
```

According to people on the forum, the Wi-Fi keeps dropping out because I have more than one service managing my network. The wiki warns against this.

Eventually I decided to disable this service:

```bash
systemctl disable --now wpa_supplicant.service
```

Check if it is disabled:

```bash
systemctl list-unit-files --state disabled
```

However, I found a complete solution to this problem [here](https://ubuntuforums.org/showthread.php?t=2441872). That is, I had to disable [Wi-Fi powersafe](https://core.docs.ubuntu.com/en/stacks/network/network-manager/docs/reference/snap-configuration/wifi-powersave).


I checked power management that it was in fact "on" for the card:

```bash
iwconfig wlo1
```


This command updated the setting to confirm that power management was the culprit:

```bash
sudo iwconfig wlo1 power off
```

In order to make this change persistent, I had to update the default-wifi-powersave-on.conf file.

```bash
sudo sed -i 's/wifi.powersave = 3/wifi.powersave = 2/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
```

However, it is not sufficient to turn off wireless power management at boot. It is mentioned [here](https://unix.stackexchange.com/questions/269661/how-to-turn-off-wireless-power-management-permanently). So, I had to create a script that runs using Cron. **Dirty but worky**:

> It is not sufficient to turn off wireless power management at boot.
>
> There are probably hooks like if I plug off power adapter.
>
> So one of possible solutions is as follows; step-by-step.
>
> Create a directory, where you wish to store the file, if not already having one for all your scripts, I personally want to have it in `/etc/pm/`:
>
> ```
> sudo mkdir -p /etc/pm/power.d
> ```
>
> Create (anywhere you like) a script, name it to be sensible, for me it is:
>
> ```
> sudo nano /etc/pm/power.d/wireless_power_management_off
> ```
>
> I used `nano`, but use whatever, e.g. if you want to create the file graphically, eg. with `gedit` (LM17) or `xed` (LM18):
>
> ```
> gksudo gedit /etc/pm/power.d/wireless_power_management_off
> gksudo xed /etc/pm/power.d/wireless_power_management_off
> ```
>
> Enter the following contents to the file:
>
> ```
> #!/bin/bash
> 
> /sbin/iwconfig wlan0 power off
> ```
>
> Save the file.
>
> Owner of the file should be `root`, if you created the file as normal user somewhere, go to the folder where it is and fix it with:
>
> ```
> sudo chown root:root wireless_power_management_off
> ```
>
> Next, you need to set proper permissions to the file, `rwx` for owner:
>
> ```
> sudo chmod 700 wireless_power_management_off
> ```
>
> Finally we will be executing the script every minute using CRON; **dirty but worky**:
>
> ```
> sudo crontab -e
> ```
>
> If you never edited `crontab` before, it will ask what editor you wish to use, this is totally up to you.
>
> Paste this to the end of the file:
>
> ```
> */1 * * * * /etc/pm/power.d/wireless_power_management_off
> ```
>
> Wait a minute and then you may check if power management if turned off:
>
> ```
> iwconfig wlan0 | grep "Power Management"
> ```
>
> Example output:
>
> ```
> Power Management:off
> ```

So, yeah. Even if something triggers the power management to turn on, it will last only a minute.

**Just in case**.

https://support.system76.com/articles/wireless/

https://wireless.wiki.kernel.org/en/developers/documentation/ieee80211/power-savings

https://askubuntu.com/questions/1230140/wifi-keeps-dropping-out-ubuntu-20-04-and-broadcom-wireless-adaptor

https://pop-planet.info/forums/threads/openvpn-firewall-kill-switch.19/