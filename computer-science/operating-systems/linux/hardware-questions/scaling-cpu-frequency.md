# Scaling CPU frequency

## Governors In the Linux Kernel

### What Is A CPUFreq Governor?

Most cpufreq drivers (except the intel_pstate and longrun) or even most cpu frequency scaling algorithms <u>only allow the CPU frequency to be set to predefined fixed values</u>.  In order to offer dynamic frequency scaling, the cpufreq core must be able to tell these drivers of a "target frequency". So these specific drivers will be transformed to offer a "->target/target_index/fast_switch()" call instead of the "->setpolicy()" call. For set_policy drivers, all stays the same, though.

How to decide what frequency within the CPUfreq policy should be used? That's done using "cpufreq governors".

```
Basically, it's the following flow graph:

CPU can be set to switch independently	 |	   CPU can only be set
      within specific "limits"		     |   to specific frequencies

                                     "CPUfreq policy"
            consists of frequency limits (policy->{min,max})
                 and CPUfreq governor to be used
                                 /		      \
                                /		       \
                               /		       the cpufreq governor decides
                              /			       (dynamically or statically)
                             /			       what target_freq to set within
                            /			       the limits of policy->{min,max}
                           /			            \
                          /				             \
        Using the ->setpolicy call,		 Using the ->target/target_index/fast_switch call,
            the limits and the			  the frequency closest
             "policy" is set.			  to target_freq is set.
                                          It is assured that it
                                          is within policy->{min,max}
```

### Performance

The CPUfreq governor "performance" sets the CPU statically to the highest frequency within the borders of scaling_min_freq and scaling_max_freq.


### Powersave

The CPUfreq governor "powersave" sets the CPU statically to the lowest frequency within the borders of scaling_min_freq and scaling_max_freq.

> I think this is a default option.


### Userspace

The CPUfreq governor "userspace" allows the user, or any userspace program running with UID "root", to set the CPU to a specific frequency by making a sysfs file "scaling_setspeed" available in the CPU-device directory.


### Ondemand

The CPUfreq governor "ondemand" sets the CPU frequency depending on the current system load. Load estimation is triggered by the scheduler through the update_util_data->func hook; when triggered, cpufreq checks the CPU-usage statistics over the last period and the governor sets the CPU accordingly.  The CPU must have the capability to switch the frequency very quickly.

### Conservative

The CPUfreq governor "conservative", much like the "ondemand" governor, sets the CPU frequency depending on the current usage.  It differs in behaviour in that it gracefully increases and decreases the CPU speed rather than jumping to max speed the moment there is any load on the CPU. This behaviour is more suitable in a battery powered environment.

### Schedutil

The "schedutil" governor aims at better integration with the Linux kernel scheduler.  Load estimation is achieved through the scheduler's Per-Entity Load Tracking (PELT) mechanism, which also provides
information about the recent load [1-1].  This governor currently does load based DVFS only for tasks managed by CFS. RT and DL scheduler tasks are always run at the highest frequency.  Unlike all the other governors, the code is located under the kernel/sched/ directory.

## Using cpufrequtils

Install cpufrequtils:

```bash
$ sudo apt-get install cpufrequtils
```

### Using cpufrequtils to set performance temporarily 

This is how it's done for one core:

```bash
$ sudo cpufreq-set -g performance
```

This will work until the reboot.

The shortest command to change governor of all cores is the following:

```bash
$ sudo bash -c 'for ((i=0;i<$(nproc);i++)); do cpufreq-set -c $i -g performance; done'
```

You could add it to .bashrc like htorque mentioned, you will have to run it as root `sudo setgov performance`:

```bash
function setgov ()
{
     for i in {0..7}; 
     do 
         cpufreq-set -c $i -g $1; 
     done
}
```

### Using cpufrequtils to set performance permanently 

Then edit the following file (if it doesn't exist, create it):

```bash
sudo nano /etc/default/cpufrequtils
```

And add the following line to it:

```bash
GOVERNOR="performance"
```

Save and exit.

For changes take effect, run:

```bash
sudo systemctl restart cpufrequtils
```

Then you can run `cpufreq-info` to see informations about your cpu frequency, governor and more:

```bash
$ cpufreq-info
    current policy: frequency should be within 800 MHz and 3.90 GHz.
              The governor "performance" may decide which speed to use
              within this range.
```

As per this Q&A: [How to set "Performance" instead of "Powersave" as default?](https://askubuntu.com/questions/929884/how-to-set-performance-instead-of-powersave-as-default)

If you want performance governor all the time you need to edit `/etc/rc.local` and insert these lines before the last line containing `exit 0`:

```bash
sleep 120 # Give CPU startup routines time to settle.
cpupower frequency-set --governor performance
```

## References

1. https://www.kernel.org/doc/Documentation/cpu-freq/governors.txt
2. https://askubuntu.com/questions/20271/how-do-i-set-the-cpu-frequency-scaling-governor-for-all-cores-at-once
3. https://askubuntu.com/questions/929884/how-to-set-performance-instead-of-powersave-as-default