# Best VM software

[Virtual Box](https://www.virtualbox.org/) is pretty obvious answers.

It is not recommended to install VirtualBox on GNU/Linux because of all the mess with DKMS.

---

Qemu/KVM is powerful and complete, but less easy than VirtualBox if you use CLI. If you look for a good GUI there is Virt-Manager.

KVM/QEMU is much better than VirtualBox for the USB stuff. It provides USB 3.0 for free and is backed by better drivers. It worked for someone's Intel RealSense and the performance was great.

It's advised to don't have both VB and KVM at the same time by the way.

Also: [link](https://alternativeto.net/software/virtualbox/?platform=linux).

> qemu-kvm alone is great, but libvirt is such a pain. Aqemu could work as a frontend but has its own XML files so you depend again on a some piece of software.
>
> I'm in the process of managing my VMs straight from ini files and aliases in a more Unix fashion, to at least get rid of libvirt and its countless dependencies. Each VM is a simple folder in ~/vm containing a setting file fed to qemu as an argument vector, and an associated qcow2 file.
>
> A starting point, should you be interested: [link](http://www.linux-kvm.org/page/Simple_shell_script_to_manage_your_virtual_machine_with_bridged_networking).

> Also worth mentioning that Vagrant seems to be biased in favor of  VirtualBox, there are way more boxes for that in Atlas than libvirt/KVM.
>
> > Vagrant doesn't have great support for KVM tbh. IIRC, you can't provide  much configuration/customization when you want to do para-virtualization and other performance tweaks.
> >
> > > I wouldn't know tbh, I don't really use Vagrant for anything long lived  like that. It's always been "set up a kubernetes cluster" or "set up a  LAMP server" or something. I usually tear it down after a day or so and  never really taxed it.

---

If you want to setup a full virtual server, [Proxmox](https://www.proxmox.com/en/proxmox-ve) is really really good. It is the best alternative to VMWare/Vcenter on Linux there is to me.

Been using it for several years now at home to run all sorts of VM's at home that do everything from security cams, proxy/firewall, to controlling  the lights outside, running a DVR/media center, file server, minecraft server, and more.

It does have a web based gui so its much easier than having to deal with command line and config files like you do in kvm and qemu.

---

For home and if you want a nice gui virtualbox is the easiest. Virt-manager looks a bit crude compared to virtualbox but provides lots of detailed options. But if you are ok with the cli, then qemu/kvm can  even be a bit faster. And you can go hardcore with qubes (which is based on XEN).

##  Wrapping up

Good VM software for Linux:

- Virtual Box — free open source, nice gui, easy to use, it was removed from Debian repositories, might be a bad choice because of all the mess with DKMS.
- QEMU — free open source, no gui, fast, USB 3.0, working with libvirt might be such a pain.
- KVM (Kernel-based Virtual Machine) — free open source, no gui, fast, USB 3.0, working with libvirt might be such a pain.
- Proxmox Virtual Environment — gui.
- virt-manager — free open source, a desktop user interface for managing virtual machines through libvirt, virt-manager with KVM/libvirtd is a powerful as VirtualBox (but much more faster), working with libvirt might be such a pain.

## References

1. https://www.virtualbox.org/
2. https://www.reddit.com/r/linux/comments/bkbbo2/whats_the_best_free_vm_software_for_linux/
3. https://alternativeto.net/software/virtualbox/?platform=linux
4.  http://www.linux-kvm.org/page/Simple_shell_script_to_manage_your_virtual_machine_with_bridged_networking
5. https://www.proxmox.com/en/proxmox-ve