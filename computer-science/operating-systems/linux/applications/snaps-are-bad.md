# Snaps are bad

According to [wiki](https://www.wikiwand.com/en/Snap_(package_manager)), **Snap** is a software [packaging](https://www.wikiwand.com/en/Package_manager) and [deployment](https://www.wikiwand.com/en/Software_deployment) system developed by [Canonical](https://www.wikiwand.com/en/Canonical_(company)) for the [operating systems](https://www.wikiwand.com/en/Operating_system) that use the [Linux](https://www.wikiwand.com/en/Linux) kernel. The packages, called *snaps*, and the tool for using them, *snapd*, work across a range of [Linux distributions](https://www.wikiwand.com/en/Linux_distribution) and allow [upstream](https://www.wikiwand.com/en/Upstream_(software_development)) software developers to distribute their applications directly to users. Snaps are self-contained applications running in a sandbox with mediated access to the host system. Snap was originally released for [cloud](https://www.wikiwand.com/en/Cloud_computing) applications but was later ported to work for [Internet of Things](https://www.wikiwand.com/en/Internet_of_things) devices and desktop applications too.

## Pros and Cons

> Sources: [link 1](https://discourse.ubuntu.com/t/please-do-not-use-snap-into-ubuntu-its-too-early/11206), [link 2](https://www.reddit.com/r/linuxquestions/comments/hfa5ru/eli5_why_snaps_are_so_bad_hard_numbers_please_and/).

Pros:

- Developers can make one package that runs on many releases of the same distro
- Snaps automatically update so users have the latest software without manually updating
  - Users who prefer manual update can override this to a great degree
- The Snap Store provides delta updates, so users don't have to download the full snap file every time
- Users get up to date releases (shorter delivery times between developer and user).
- Developers can push out test releases to users who can test them before they go stable. (possibility to use tracks and choose how much on the bleeding edge you want to be)
- Developers can publish one snap which works on multiple distros (less interesting for Ubuntu users)
- Less dependency issues (whait? But we removed them)
- Way more security and privacy (Is it really that secure?).

Cons:

- The startup time for snap packages when the start for the first time on a session slow. Still a bit slower launch after, much much slower on non ssd setups. 15 seconds to open a calculator is not acceptable for a so-called modern distribution. It is an obvious loss of productivity.

  > The most noticeable downside of Snap is slowness at startup. With many libraries and other assets to load, some of the delays get compounded. This is offset by the fact that snaps are compressed on disk, so there's fewer blocks to read, which is countered by the overhead of the realtime decompression taking some CPU overhead.
  > Further on top of this is the need to stand up the necessary directories, mounts and caches to ensure the application launches correctly. There is some overhead on doing this on first launch. It was way worse, and was improved recently. It turned out some font caches were being rebuilt on every launch of the application.
  > So for example on someone's machine running Libreoffice from the deb takes 0.9 seconds to launch, from the snap it takes around 1.8 seconds. That's certainly a difference, but it's far from the 15s.

- Canonical imposes snap by default. Imposing snaps is a bad idea. Linux Mint for example integrates flatpak but it does not impose any software installed by flatpak.

  > If Ubuntu wants to propose some apps with snap as default, it's fine and no problem **if the deb package remains available and snap can be uninstalled.**
  >
  > > See this thread from last year for an insight into why Chromium is the first desktop application to be delivered to Ubuntu users as a snap only. Trusty is now EOL but presumably Xenial will be similarly affected in due course if not already.
  > > [https://discourse.ubuntu.com/t/chromium-updates-on-trusty/5905 59](https://discourse.ubuntu.com/t/chromium-updates-on-trusty/5905)
  >
  > This is unacceptable and a **very bad idea, as deb packages are well used, performant, secure.** Use snap only when it will be as effective as a deb.
  >
  > You don't need snaps when you use ppas for beta software.

- Snap store is slow?

- Snaps take lots of place as each of them brings the required libs.

- Snap in themselves are not bad - but for a smoother UX they require a « wider view » about how people use their computers.  How test any and all use cases ? Why pushing snap so strongly when basic flaws for users are not solved ? And above all what is the meaning of LTS if it's used as a testing bed for a non mature technology? Snap for the moment covers none of my needs as a desktop user while .deb do. Safety ? How am I not safe using .deb ?





> A little benefit compared to the flaws snap bring into « average » desktop usage.
> ⋅ confinement somehow forces user to change their data organization,
> ⋅ slow ( first ) launch, still a bit slower launch after, much much slower on non ssd setups,
> ⋅ waste disk space,
> ⋅ often theming issues
> …

Ofc snaps have their rough edges that need to be rounded but overall they are already the best package. Auto update and channel switching are my favourite features.



Disk space is generally not an issue, not only disks are cheap, but snaps are compressed archives, and they can re-use some special snaps of common dependencies. And this strategy allows the advantages I mentioned above, developers won’t have to worry about which distro or version they’re targetting and this will bring us much more software as it already did.

Snaps provide more security, the confinement they have is way more secure than what we have by default with any deb package.



Third party doesn’t refer to licensing, only to who provides it. However there’s more benefit of confining proprietary closed source applications, because they are to audit to the same level, but that doesn’t mean that confining applications is not a benefit also to FOSS applications, security is an issue that needs to be addressed with many layers of measures no mater what licensing approach you use to license the software.

---

My only complaint is proprietary app store. It gives too much power to Canonical. The way Canonical is pushing it in Ubuntu, such as forcibly installing chromium's snap, even when apt is used, is already causing me concern towards their practices, if snap becomes the leading distribution method. They open source the store or do not make it hardcoded into snap, I am ready to ignore all the technical disadvantages they have to flatpaks and appimages.

> > The whole "snap store is proprietary" thing is fine, but I personally think it's a small price to pay to make Linux software more stable and easier to distribute.
> >
> > > No it is not a small price. Whats the use of linux winning the majority of marketshare, if the major distros and software end up becoming privacy nightmare, such as windows or android is right now? Flatpak and flathub are fully open source. There is no reason why snapstore can't be too. Unless Canonical wants to profit through it, and it is more or less known how profiting from software store occurs.
> > >
> > > Some can argue that snap could be forked to allow for other stores, but these stores, if not endorsed by any distro, would end up not getting most software, giving rise to situation such as with android and play store. Moreover, these stores would be inaccessible from ubuntu unless an user specifically installs the alternate version.
> > >
> > > If snaps become the de facto standard of distribution, it would be the worst thing that could happen to linux, as well as free and open software.
> >
> > > The Open Source part is not trivial, it is a vital component of Linux and the majority of users' philosophy.

Flatpaks are way better, at least for conservation of open source culture. There is no forced store. Flathub.org though is rising as the de facto library for flatpaks, but it is not enforced. Also flatpaks are more suited to desktop use, or at least snaps provide no additional advantage to desktop users over flatpaks. Snaps may be however be better for certain use cases, such as IoT.

But, to me, there's a difference between making an informed choice to run a particular piece of closed software because you've determined that the benefits outweigh the costs for you...and having an entire platform (such as Ubuntu) forcing it upon you, removing the choice that I, as an individual, would have to make that determination for myself.
And sure, ultimately I do still have a choice...I can choose NOT to use Ubuntu, which I have done (for more reasons that just the Snapstore)...

---

Package managers are hugely more powerful for both users and developers compared to anything AppImage / Snap / FlatPak can do.

Properly packaged software (DEB, RPM or even from AUR)

1. handle dependencies infinitely better (shared where possible, updated systemwide, you can easily know if software is depending on an old version of a library with a security issue. "Dependency hell" was solved 10 years ago for anyone who has a clue. Multiple versions of shared libraries was solved 10 years ago too.)
2. integrate well with other system resources and decades of Linux system design, and
3. have 20 years of development behind them. There's basically nothing that *can't* be done using a well-written RPM or DEB package, and there are *so* many helper tools that are well-tested and trusted.
   I can churn out an RPM for arbitrary software from source in 30 mins, and have it published in a repository (completely under my control) within an hour using tools like the [OBS](http://build.opensuse.org/). And this gives me (basically for free) a verifiable repeatable build, with complete knowledge of all sources used, a trust chain, etc.

Yes it is a bit intimidating to beginners, but Snaps/AppImages/Flatpaks are trying to make it *too* easy imo, trying to take away too many important decisions from the distro and the developer, and hiding necessary complexity. There's always a tradeoff between ease of use and security/functionality.

The only possible advantages I can see, but don't need, are

1. user-only installations -- well sure, but in a single-user system are you not admin of your own box? and on a multi-user system, do you really want each user to try and install their own version of everything? That they're then going to leave to bitrot as open security holes in your system?

and 2) sandbox/isolation. However most don't implement that correctly and there are very regularly security holes and escalation bugs discovered. Or your app is so well sandboxed it can't interact with anything else on the system. And of course traditional packages can have sandboxing/isolation capabilities too.

I will never install a Snap, Flatpak, or AppImage unless it is proprietary software which is absolutely necessary and cannot be made available any other way. Even then, I might try first to take apart their code and turn it into an RPM for my machines.

If I have to use one of them, AppImage is the lightest footprint; then Flatpak, and worst of all is Snap. Snap is an absolute abomination in terms of the number of layers it introduces between your system and the software, all for a very questionable increase in security.

In any case, I can guarantee you that the primary way of building distros, that is around package managers, will not change.

> > The only possible advantages I can see
>
> I think the advantages are supposed to include:
>
> - move packaging work from distro maintainers to app devs, where it only has to be done once to work in many distros
> - allows a user to run multiple versions of app, using multiple versions of dependencies, in same system
> - install/remove an app without disturbing rest of system (dependencies that may be shared with other apps)
>
> - any user can install a snap, without needing root privilege
> - installer scripts from app dev don't run as root, and they run in a contained environment
>
> > These are good points, but definitely not a knockout blow in favour of containerized packages, imo.
> >
> > > move packaging work from distro maintainers to app devs, where it only has to be done once to work in many distros
> >
> > In some ways, I get this. If an app dev is really expected to provide binaries for *every* distro, it's a pain. But if the distro devs aren't doing packaging, what are they doing (and I say this as one)? A distro without intentionally selected packages that are tested to work with each other is basically just a wallpaper and theme.
> > And if the app is open-source with a sensible build system, it is *easy* to put up a recipe on launchpad, koji, OBS, or AUR to build proper packages. Anyone can do it, and in fact I think it's a nice way to introduce beginners to the ecosystem and Linux way of scratching your own itches.
> >
> > There is one benefit I'll readily admit, which is that app devs can push out updates much faster on a new release than distro devs, who sometimes need reminding. But there is a downside to this too -- less scrutiny of the app dev's output means security issues, and bugs involving multiple interacting components, are often not checked for. When I install an traditional RPM from openSUSE I know that an independent set of eyes has looked at it for both security and compatibility with everything else in the distro.
> >
> > > allows a user to run multiple versions of app, using multiple versions of dependencies, in same system
> >
> > RPMs (in Fedora and openSUSE at least) have allowed multiversion packages and automatic, correctly versioned shared library dependencies for a while now. I agree though it's still not trivial to have multiple versions of, say, Firefox installed. So if you are really in need of something like that, sure (or you can roll your own chroot-style solution with traditional packages). Is this use case really that common?
> >
> > Overall it feels like the big advantages of Snaps etc are really meant for proprietary apps. Which I avoid on principle, and feel we should think twice about twisting our systems to accommodate.
>
> > > move packaging work from distro maintainers to app devs, where it only has to be done once to work in many distros
> >
> > Swiss army knife approach. Jack of all trades, master of none. This guarantees that the app is ill-fitting, theming problems are just the first thing of the top of my head.
> >
> > Also, I'd rather have a specialist do the work than an app developer who is expert with his app, but most likely not packaging.
> >
> > > install/remove an app without disturbing rest of system (dependencies that may be shared with other apps)
> >
> > This was never a problem for me, and with modern packaging tools, it shouldn't be. Shared dependencies just stay on, I think that issue was solved 20 years ago.

---

Both as a developer, and as a corporate engineer, I often publish rpm packages or container images to private repositories. As far as I know, I cannot do that with snap, and therefore I can't publish software only to users that I support. That's enough reason for me.

Sometimes broken packages get uploaded to public repositories. It's rare, but it does happen. A few months ago, an update to the Signal flatpak was published, and that wouldn't run on my workstation. That's bad, but because flatpak doesn't auto-update, I was able to tell people that I support not to update the package at that time, and they were able to continue using Signal. As far as I know, there's no way to inhibit updates for snap. That would be enough reason for me, too.

As I understand it, flatpak is tied to desktop sessions, and it can't be used for server applications where no user is logged in, and snap can. That's great, except that for that use case, snap isn't competing with flatpak, it's competing with Podman and Docker. I'm going to go with Podman or Docker, here.

I don't have a lot of experience with snap, but this comparison for Firefox lists startup time as < 1 second for flatpak and roughly 11 seconds for the snap. I assumed that when people talked about slow startup for snap, they meant something far less bad than this:

https://www.ctrl.blog/entry/firefox-linux-flatpak-snap.html

> I am no pro, recently switched to Fedora (after 10 years of Ubuntu)and was forced to use 1 or 2 flatpaks and was amazed at how quick they were compared to snaps on Ubuntu.

> running a private repo is easy, just download the snap files and sideload them with snapd directly with `snap install --dangerous --classic $SNAPNAME.snap`
>
> updates can be turned off with snapd for a certain package in the same way. since the system keeps the current and two previous versions downloaded it's a piece of cake to keep a privileged version installed under a different alias like that. you can also use `snap download` to get a certain version (if available) like a stable version installed as a sideload while you track the git-edge version for your normal snap. also there are rollbacks for prior versions available in the case of broken updates like your signal-desktop example (I've used this myself before, not for signal though).
>
> snaps are not at all in contest with podman (lol) or docker, those are deployment platforms for rolling out into big server architecture and clusters. snap is a platform for rolling out into very very small servers, the so-called "edge" appliance server, which is why the format is designed the way it is. snaps are also a very nice way to manage languages that move very fast (like golang) or have multiple concurrent versions (nodejs).
>
> snap startup times are still not amazing, but they're better and still improving. it is the major user-facing problem though.
>
> > What makes you think podman and docker aren't for "small" servers?
> >
> > For that matter, why would you laugh at one of two interchangeable components?
> >
> > OP asked for objective reasons for one container runtime (which, to be clear, all of Podman, Docker, Snap, and Flatpak are) over another. I'm looking for those objective reasons in your response, but I interpret most of your response as being highly subjective.
> >
> > > i laugh at podman for the same reason i laugh at people talking about rkt containers in 2020.
> > >
> > > what makes me think docker is not a platform for small servers like an RPi3 or smaller is that I've tried it (maybe the RPi4's will be okay for lightweight stuff?). without many Gb's of ram it is not going to work, and without a decent amount of CPU it doesn't work.
> > >
> > > snaps on the other hand are great for this. when deployed on UbuntuCore as the base os you have a read-only appliance that has automatically snapshots of every aspect of the system with automatic rollbacks for all updateable parts of the system. but UbuntuCore is a really weird platform and a little hard to work with, so with snapd on Debian 10 or some other appropriate base os, you still get the atomic, immutable, sandboxed, automatic update, automatable rollback advantages of snaps on a more conventional system without having to constrain your project to Debian 10 as an environment and ship whatever version of whatever libraries you want.

---

All these newer methods of distribution are really just an excuse for developers to keep outdated libraries instead of maintaining and updating their software.

There, I said it. (wrote)

Look at Docker, a recent study found 80% of containers supplying outdated packages with security vulnerabilies of varying degree.

With traditional repositories, if your package doesn't compile against a secure source, it will be dropped, end of story.

People wrote about the proprietary nature of Snaps, but ironically, you can't decide to **not** update a Snap package, if the functionality is transparent and you can handle the risks involved.

You can just postpone updating Snaps for a certain amount of time, that's a disgusting approch close to Windows, which treats users like idiots, no matter what.

I don't particularly like Flatpak or Redhat, either, but it's objectively a better system. Don't really care about AppImages at all, personally.

---

I think a lot of the hate relating to snaps specifically (but maybe flatpak as well... not really sure) is due to the fact that there is a separate service that runs at all times, used to manage how snaps function. This consumes system resources (to me it's not noticeable, but maybe if you are running a low RAM system it might make a difference).

Additionally, since snaps and flatpaks have all the relevant dependencies bundled up inside them, you end up with wasted storage space, as opposed to the package manager way of installing libraries system-wide so that they can be used by other packages that need them, and only need to be installed once.

Snap and Flatpak allow dependencies on things other than what comes with every Linux distribution by default, and this can mean that net you need to actually download *more* stuff than with AppImage. For example, if an application needs Qt, then with Snap and Flatpak you need to download the whole Qt, whereas an AppImage comes with just *a tiny fraction of* Qt that is actually needed for the particular application.

---

You want "Hard numbers" and to ELI5? Amusing.

I don't like Snaps, Flatpaks, or AppImages. It breaks the UNIX way. It duplicates files, worse, it depends on individual maintainers to be on top of all their dependencies, so if a distribution updates a library in the usual manner, you could still be susceptible to the bug, or vulnerable to a hack, because whoever built that package didn't update it. You ask about performance, I don't imagine there would be much, other than wasted disk space.

---

One way snaps are bad is because Canonical makes its own company-controlled snapcraft the only source you can obtain snaps from.

There's no mirrors, regional or private company servers even if you have the bandwidth to serve everything inhouse.

Everything has to go through Canonical, which insists on packagers creating developper accounts and for the original creators of the apps to make their own - you cant create snaps for many opensource apps you normally packaged as debs before that you did not author yourself (its very rare for distro packagers to be the actual developpers).

Snapcraft is run like an app store for paid apps in preparation, not a repository of free opensource apps.

---

The point of the AppImage format is:

One app = one file. Simple. No root, no package manager, no app stores. Just one file that you download and run.

No middle men between application developers and end users.

For a comparison between the different formats, see https://github.com/AppImage/AppImageKit/wiki/Similar-projects.

## Linux Mint drops support for Ubuntu's Snap

> [Source](https://itsubuntu.com/linux-mint-20-dropped-ubuntus-snap/).

Linux Mint 20, like previous Mint releases, will not ship with any snaps or snapd installed. In Linux Mint 20, APT will forbid snapd from getting installed.

The reason behind why they were planning to dump Snap from last year:

> When snap was announced it was supposed to be a solution, not a problem. It was supposed to make it possible to run newer apps on top of older libraries and to let 3rd party editors publish their software easily towards multiple distributions, just like Flatpak and AppImage. What we didn't want it to be was for <u>Canonical to control the distribution of software between distributions and 3rd party editors</u>, to prevent direct distribution from editors, to make it so software worked better in Ubuntu than anywhere else and to make its store a requirement.

> If you're a Fedora user and you want to install Spotify, you're told to go tohttps://snapcraft.io/spotify. Spotify doesn't distribute RPM packages, appimage, Flatpak or anything useful to a Fedora user who wants to download it, or to a Fedora maintainer who wants to add it to a repository. Fedora users are told to go to what is essentially a commercial store operated by a RedHat competitor where stats tell them their distribution is only 7th best.

 Lead developer, Clement “Clem” Lefebvre further explained:

> A year later, in the Ubuntu 20.04 package base, the Chromium package is indeed empty and acting, without your consent, as a backdoor by connecting your computer to the Ubuntu Store. Applications in this store cannot be patched, or pinned. You can’t audit them, hold them, modify them or even point snap to a different store. You’ve as much empowerment with this as if you were using proprietary software, i.e. none. This is in effect similar to a commercial proprietary solution, but with two major differences: It runs as root, and it installs itself without asking you.

