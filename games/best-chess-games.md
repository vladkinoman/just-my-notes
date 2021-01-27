# Best chess games

> In short (sorted from best to worst; bold means that it is really good): 
>
> - the best chess clients are **SCIDvPC**, Arena, ChessX, LucasChess, Knights. Plus, Chessbase is the industry standard and it's good, but it's not free.
> - the best chess engine is **Stockfish**.
> - the best database is ICOFY.
> - the best server are **Chess.com** and **Lichess**.

## Table of Contents

- [If you are a newbie](#If-you-are-a-newbie)
- [Chess clients](#Chess-clients)
  - [GUIs that can do pretty much anything](#GUIs-that-can-do-pretty-much-anything)
  - [Decent GUIs](#Decent-GUIs)
  - [Simple GUIs](#Simple-GUIs)
  - [Text GUIs](#Text-GUIs)
- [Chess engines](#Chess-engines)
- [Servers](#Servers)
- [Databases](#Databases)
- [References](#References)

## If you are a newbie

**According to Reddit:**

Get a proper chess course/book/video/whatever that explains well the basic tactics, positional game and most importantly the endgame. Back in the 90s I loved Karpov's introductory book but I don't think what's out there now, I read it in a different language and I cannot find it in English anywhere. In chess.com I think there's plenty of material including introductory material, although I haven't gone through it.

Don't just play the computer on easy levels too much, this is mostly a waste of time and won't improve your game at the beginner level. It's a common mistake. It will actually stall you big time if you get used to play back moves, have no discipline to continue in disadvantage and play for the draw, etc. Keep it real against even a poor computer opponent. Play it no more than a few times a day.

Don't try to memorize a lot of opening lines. Memorize the basic ideas from a good generic introductory source. Don't go reading opening books as a beginner, that can wait. Definitely the endgame must be mastered before going into that.

This is how you effectively use a computer as a beginner:

- easy level games, no more than a few.
- set up endgame drills on an editable board against a strong opponent. No matter how strong the opponent is a strongly winning endgame must be won. I don't recommend specialized books on openings to beginners but you can get endgame books that cover basically any level up to International Master or even Grandmaster. For instance you can peek inside [this](http://www.amazon.co.uk/Fundamental-Chess-Endings-One-Encyclopaedia/dp/1901983536/) one and set up positions and finish off Stockfish on them. [This](https://www.amazon.co.uk/Pandolfinis-Endgame-Course-Concepts-Explained/dp/0671656880/) is another book you can peek inside for classic endgame positions and tactics.
- with solid endgame play you will be able to beat many engines on easy levels, you can try upping the level but beware of that, because the kind of play and errors engines make are rarely human-like. This can twist your game and hurt your progress. Eventually you want to face humans to progress, get beaten in humanly ways, win in humanly ways with blunders on both ends, the psychological aspect, etc.

All that should keep you busy for a while. Then, calculation and tactical + positional theory. Maybe best with a coach because it will be hard to keep motivation on your own with just books.

As a beginner, you should not spend more than 15-20 minutes trying to figure out one single position. If you find yourself doing that, you are aiming too high. Your learning will be a lot more effective if it's incremental. As a higher-intermediate maybe studying a position from a book 20 minutes is just fine. But by then you will know.

## Chess clients

### GUIs that can do pretty much anything

> Sorted from best to worst.

[SCID](http://scid.sourceforge.net/) or [SCIDvPC](http://scidvspc.sourceforge.net/) (multi-platform compatibility). This is an open source chess database, available for free. SCIDvPC is a later version of SCID with more features. Upside: it's free, and let's you plug in UCI-compatible engines (e.g. Stockfish), you can have the game(s) stored by SCIDvsPC as database for a permanent record and for later analysis. Downside: the UI is a bit clunky.

> I use and like [SCID](), which is free (as are its various forks/cousins like [Scid vs. PC](http://scidvspc.sourceforge.net/), [ChessDB](http://chessdb.sourceforge.net/), and [ChessX](http://chessx.sourceforge.net/node/5)).

> Another vote for SCIDvsPC combined with Stockfish 6, both fully open source and free. I like supporting projects like this, and both products are top notch - you would never need more below a professional level.

> [**SCID**](http://scid.sourceforge.net/): Like the other GUIs on this list, SCID can be used to play against an engine, but it's most useful as a fast way to organize and analyze databases of chess games. You'll want to pair it with MillionBase, a massive database of chess games in PGN format (scroll [to 'Data Downlods' here](http://rebel13.nl/rebel13/rebel 13.html)) or other chess game databases. If you like the SCID interface, you can also try [**SCID vs PC**](http://scidvspc.sourceforge.net/) as a GUI for playing chess. — PC Gamer. — PC Gamer.

> **SCID/SCID vs. PC** - **[SCID](http://scid.sourceforge.net/)** stands for Shane’s Chess Information Database. SCID does just about everything that you could want from a chess program. SCID is primarily designed to work with databases, and it allows you to create, edit, and search large databases very quickly. SCID also contains functions to play against and analyze with engines, annotate games, play on FICS, interact with DGT boards, etc. There are very few functions that SCID does not provide. I have a set of youtube [tutorials](https://www.youtube.com/playlist?list=PLL0mDDYLk9Cg2dyWjRd_Cgy32hOmVzrAi) showing some of the basic SCID functions that I recommend to my students.
>
> **[SCID vs. PC](http://scidvspc.sourceforge.net/)** is a dubiously named, but very well developed, fork of SCID. In fact, I strongly recommend using SCID vs. PC instead of SCID because of the more regular and useful updates to the program. Steven and the various other developers deserve high praise. The one advantage of SCID right now is that it has a bit better LINUX support such as being available for download from the Software Center and looking a bit more native. — Sam Copeland.

[Arena](http://www.playwitharena.de/).

> [**Arena Chess GUI**](http://www.playwitharena.de/): Arena Chess is more daunting for newcomers than Lucas Chess, but it includes a [great deal of features](http://www.playwitharena.com/?Features), as well as support for 19 languages and a Linux verison. — PC Gamer.

[Chessbase](https://account.chessbase.com/en).

> Chessbase is the industry standard and it's good. Some of my colleagues settled to Arena. This is free and highly adjustable. Maybe worth a shot? You will need a database as well. I don't know if there is some free database online, but also here Chessbase is the industry standard commercial solution.

> Chessbase - this is the obvious commercial option on the PC, and it's what many people use. Base version is $99, and goes up substantially from there as you add features.

> Chessbase is the pro standard, but you might not need all the features.
>
> Basically you have 3 components to worry about: Interface(SCID vs Fritz style), DBs(again free/self curated and/or paid collections) and Engines(super strong Stockfish is free for all UCI interfaces, and many other paid and free engines).
>
> Pick the interface that you like and you can add the other components later	

[ChessX](http://chessx.sourceforge.net/). On debian you can just `apt-get install chessx stockfish` and you should be set.

> [**ChessX**](http://chessx.sourceforge.net/) is a very nice alternative to SCID. It doesn't offer quite as much functionality, but it has most of the basic features, and those features all seem to work very well. The project seemed stagnant for awhile, but it is now developing rapidly, and I am eager to see how the program develops over the next year. The program is developed with QT which provides a nice interface and should be an excellent platform to build on going forward. — Sam Copeland.

> ChessX is a variant of SCID (Shane's Chess Information Database), as is SCIDvsPC (which is what I use, on Linux).
>
> For a reference database, there's [Caissabase](http://caissabase.co.uk/) which has 3.8 million games. And you can find lots of other types of data (eg. tactics, openings, etc) available on the net as PGN files which the SCIDs can import.
>
> If you want games annotated by grandmasters or instructional databases made by granmasters (eg. "Karsten Müller - Endgame Strategy - The Power of the Bishops"), the commercial program [ChessBase](https://shop.chessbase.com/en/categories/chessbase) is your choice. Chessbase.com publishes a truly massive amount of chess information, much of which can be used with their free Chess Reader (castrated version of Chessbase).
>
> One of the main ways I use SCIDvsPC is to enter the diagrams for a chess book, with all the moves and variations. Each book gets its own database. Then when I go back through the book, I play it out in SCIDvsPC, which is much quicker and less tedious than using a physical board & pieces. Currently I'm working on "Silman's Complete Endgame Course".
>
> ChessBase is a more mature and feature-full database program (they've just released version 15 this week) than SCIDvsPC. My suggestion would be to use one of the SCIDs (SCID, SCIDvsPC, ChessX) until you decide that the cost of ChessBase is worth it to you. You can always export your SCID etc. data as PGN and import it into ChessBase.

### Decent GUIs

[Lucas Chess](https://github.com/lukasmonk/lucaschess) (Windows only).

> [**Lucas Chess**](http://lucaschess.pythonanywhere.com/index.html): Simple and easy to understand for beginners, Lucas Chess is a good place to start. It includes a bunch of engines and training tools, and the UI isn't too confusing, even if you're unfamiliar with the more complicated functions of chess engines. — PC Gamer.

> Here's a brief [tutorial](https://github.com/lukasmonk/lucaschess/blob/master/Linux/LinuxInstallation.md) on how to run on Linux.

[Tarrasch](https://www.triplehappy.com/downloads.html) (Windows only).

[CuteChess](https://github.com/cutechess/cutechess/releases) (Linux Mostly). Cute Chess is a graphical user interface, command-line interface and a library for playing chess. Cute Chess is written in C++ using the [Qt framework](https://www.qt.io/).

[Hiarcs Chess Explorer](https://www.hiarcs.com/chess-explorer.htm).

> Hiarcs Chess Explorer - this is a pretty under-rated chess database imho. I use this one because I'm on a Mac and it's the only commercial database available for Mac that runs natively, but it is quite good, has a lot of great features, and I like it a lot. Base version is $50. The "Deep" version with endgame tables is $100, and you can also subscribe to their opening book (which I have tried, and is pretty good).

### Simple GUIs

[Knights](https://kde.org/applications/games/org.kde.knights).

> [Knights](https://linuxreviews.org/Knights) is a nice-looking chess interface made using the [KDE](https://linuxreviews.org/KDE) libraries. It was originally made for KDE 3.5 and later ported to KDE 4 and 5.
> It supports themes, loading and saving of games, multiple chess engines (it will auto-detect the ones you have installed) and online play on chess servers. Creating a new online account - if you don't already have one - is easy.
>
> [Knights](https://linuxreviews.org/Knights) is overall a really nice program for playing chess and it is the best alternative available on Linux. It's homepage is at https://kde.org/applications/games/org.kde.knights.

> **LinuxReviews: In bullet summary, [Knights](https://linuxreviews.org/Knights), [pychess](https://linuxreviews.org/Pychess) and [XBoard](https://linuxreviews.org/XBoard) are the best choices (in that order).**

[PyChess](http://pychess.org/).

> pychess as frontend for fics and stockfish. SCID vs. PC (AUR) is probably the best free database. On line: lichess.org.

> Try pychess (should be in the repos). You can set the level it plays at. You may also want to get scid vs pc. Phalanx and Stockfish work with both of those.

> **PyChess** - **[PyChess](http://pychess.org/)** doesn’t do as much as SCID or ChessX, but it still does quite alot. It’s a very user friendly program for LINUX that allows playing games against engines or humans, playing on FICS, and playing through and annotating a game. If you are a casual chess player that would like a simple program to annotate or play a personal game on occasion, PyChess may be the right program for you. PyChess has made some nice improvements since the last time I used it; hearty compliments to the developers on their fine work. — Sam Copeland.

> It is a chess game written in Python. It's a fully-featured chess game with support for all the chess engines as well as online play. It has got a interface with animations. It supports chess board themes using both images and TTF files. Using TTF files appears to be broken, perhaps it's just our version of it or perhaps it's broken for everyone.
>
> **[PyChess](https://linuxreviews.org/PyChess) has all the features you would want from a chess game** but it's not our favorite. The interface feels sluggish and laggy regardless of what hardware it's on, this is the case on laptops as well as computers capable of running modern FPS titles at 120 fps in 4k. It simply feels irresponsible. This may just be a personal opinion you won't share if you try it. It absolutely is feature-rick and it has everything you would want from a chess program. Perhaps *you* will like it.

[Xboard](https://www.gnu.org/software/xboard/).

> [XBoard](https://linuxreviews.org/XBoard) is a *very old* and mature chess interface. It's not at all fancy or very flashy and there is no "3D" view or anything like that. It supports the chess engines Fairymax, Fruit, Crafty and GNU Chess - and others with support for the common protocol used by these programs.
>
> **[XBoard](https://linuxreviews.org/XBoard) lacks a very significant and important feature: There is no graphical support for playing games over the network.** This really is quite the deal-breaker and it makes [XBoard](https://linuxreviews.org/XBoard) an alternative not worth consideration if you want to play anything other than computer opponents. The sad part is that Board *does support* playing over the network and *it has had support for chess servers for over a decade*. The trick required to connect to say freechess is to *start [XBoard](https://linuxreviews.org/XBoard) from the command-line* with arguments like `xboard -ics -icshost freechess.org`. That's not exactly user-friendly. It may have been a fine way of doing things in the 1980s but it's simply not someone a program should expect users to do in 2019.

[Jerry Chess](https://github.com/asdfjkl/jerry) (Cross Platform).

[GNOME Chess](https://wiki.gnome.org/Apps/Chess).

### Text GUIs

[Sunfish](https://github.com/thomasahle/sunfish).

> Sunfish is a simple, but strong chess engine, written in Python, mostly for teaching purposes. Without tables and its simple interface, it takes up just 111 lines of code! (see [`compressed.py`](https://github.com/thomasahle/sunfish/blob/master/compressed.py)) Yet [it plays at ratings above 2000 at Lichess](https://lichess.org/@/sunfish-engine).
>
> Because Sunfish is small and strives to be simple, the code provides a great platform for experimenting. People have used it for testing parallel search algorithms, experimenting with evaluation functions, and developing deep learning chess programs. Fork it today and see what you can do!

[Command Line Chess](https://github.com/marcusbuffett/command-line-chess). A python program to play chess against an AI in the terminal.

## Chess engines

> There are fine engines for LINUX. I recommend **Stockfish** and **Critter** personally. It is useful to have two engines to get a second opinion on complicated positions. Both Stockfish and Critter are free and have native LINUX versions available. — Sam Copeland.

Stockfish. Free and open source.

> In my experience, **[Stockfish](http://stockfishchess.org/)** may actually be the stronger program in terms of move selection, but the evaluations are not intended to be human readable. The evaluations often seem inflated to me, and it can be difficult for me to determine whether a +.5 evaluation is actually an edge or an illusion. — Sam Copeland.

> Stockfish is the world's strongest chess engine and it is FOSS and available in the AUR. It is just an engine though, you'll need other software to interact with it. I use SCID, which is also in the AUR and has a bunch of useful database functionality for analyzing games. There's also [these](https://wiki.archlinux.org/index.php/List_of_games#Chess_simulators) options.

> If you want to play against a powerful, customizable computer opponent for the purpose of studying chess, you'll want a chess engine, such as **the free and open source** [**Stockfish engine**](https://stockfishchess.org/) or its derivatives. — PC Gamer.

Critter. Free.

> **[Critter](http://www.vlasak.biz/critter/)**’s evaluations are more compatible with human evaluations, and it seems to task my processor a bit less so I tend to use it more often. Both (Stockfish and Critter) are very capable 3000+ ELO engines which are more than suitable for most players. — Sam Copeland.

Komodo.

>  [Komodo](http://komodochess.com/) is also a top level engine that provides a Linux version. Komodo has a reputation for positional insight. The latest version (7) is available for sale, but version 5 is made available for free. — Sam Copeland.

## Servers

[Chess.com](https://www.chess.com/) and [Lichess](https://lichess.org/) are the best browser based chess servers according to many people.

> These days, I prefer browser based chess servers as I don't have to worry about ongoing platform support. More and more chess servers are making the browser the default platform. I personally play on [**Chess.com**](http://www.chess.com/), and I am 95% satisfied with the live server experience. The one feature I really miss is the ability to analyze with an engine after a game is over. I regularly want to review a moment from a blitz game with an engine. It is not difficult to copy the pgn into SCID, but I would really like to be able to analyze it in the browser. [**Chess24**](https://chess24.com/) is a new entrant to the market. They also have an excellent live server experience in the browser, but they have relatively few users at the moment. It will be interesting to see how Chess24 develops over the next year. I have rarely played on **[playchess](http://play.chessbase.com/js/apps/playchess/),** but they also have a good web app.
>
> My absolute favorite chess server which I am sadly not playing on is **[lichess](http://en.lichess.org/)**, recommended. Lichess is a perfect chess server experience. It is a free server driven by an open conception of the internet. The interface is absolutely beautiful, and lichess is filled with great server features including support for Chess960 and pools. There are typically 1500+ players online, but there are not currently many strong GMs. For someone looking for a "full service" chess site, I recommend chess.com because of all the added content and features such as blogs, articles, daily chess, etc. However, if you are simply looking for the best server around, you cannot go wrong with lichess. — Sam Copeland.

> lichess.org is phenomenal. The board editor to set up positions, the analysis board for, well, analyzing, and the Study feature for all of that combined (and more). Besides, lichess now operates with a games collection.

> [**Lichess.org**](https://lichess.org/) is my preferred online chess game. It's free and supports plenty of match styles, including multi-day correspondence. The best thing about it is that you can play anonymously without creating any kind of account, though I find that means I'm more likely to encounter players who resign or request a draw immediately—you never know who you might be paired with. For practice, you can also play against the Stockfish engine (more on what that is in the sections below). — PC Gamer.

> [**Chess.com**](https://www.chess.com/) is a good commercial free alternative. You have to put up with a few ads, and it'll bug you to pay for an optional premium subscription, but as a way to quickly start playing chess online at any skill level, it's one of your best bets. It runs in your browser with a simple, clean board design, and has a ton of players so I've never had a hard time finding a match with someone of a similar skill level (which is to say, not very much skill). — PC Gamer.

## Databases

ICOFY. Free.

> [**ICOFY**](http://icofy-blog.de/) is a great free database with over 5,000,000 games. It is regularly updated, well stocked, and well documented and cleaned. It is available in SCID formats as well as pgn and Chessbase formats. For most players, I would look no further. — Sam Copeland.

OpeningMaster.

> If you want an absolutely top of the line database, I would look at [**OpeningMaster**](http://www.openingmaster.com/). OpeningMaster has over 8.7 million games. This includes 1.3 million correspondence games. OpeningMaster is not free, but it does support SCID and PGN formats. 
>
> For some further thoughts on chess databases, and some recommendations for web based databases, see [this](http://www.chess.com/blog/SamCopeland/databases-tips-tricks-and-recommendations) article. — Sam Copeland.

Others:

> Once you have an engine, you can download a variety of free chess databases. The three best sources I found were:
>
> - Kingbase - A ton of games dating back to the early 90's, organized by opening.
> - PGNMentor - A large number of historical games dating back to at least the 1800s, organized by player, tournament and opening.
> - TWIC (The week in chess) - A weekly chess archive of notable games. It's been running since '94, but the PGN archives only go back to 2012.

## References

1. https://www.reddit.com/r/chess/comments/a5k5ie/best_free_chess_gui/
2. https://www.reddit.com/r/chess/comments/c059rm/what_is_the_best_chess_app_for_linux/
3. https://www.reddit.com/r/chess/comments/9wuiz4/chess_software_recommendation/
6. https://www.reddit.com/r/ComputerChess/comments/2nitqp/finding_the_right_linux_chess_engine_for_me/
7. https://www.reddit.com/r/chess/comments/3i87ys/what_is_the_best_chess_software/
8. https://www.reddit.com/r/archlinux/comments/6awqjc/recommend_a_linux_chess_game/
9. https://linuxhint.com/best_chess_games_ubuntu/
10. https://www.pcgamer.com/best-chess-games/
11. https://awesomeopensource.com/projects/chess
12. https://linuxreviews.org/Chess_games
13. https://www.chess.com/blog/SamCopeland/the-best-linux-apps-for-chess

