# Best chess games

## Chess clients

*GUIs that can do pretty much anything*:

[Scidvspc](https://sourceforge.net/projects/scidvspc/) (multi-platform compatibility)

[Arena](http://www.playwitharena.com/?Download) (Windows/Linux only)



*Decent GUIs*

[Tarrasch](https://www.triplehappy.com/downloads.html) (Windows only)

[Lucas Chess](https://github.com/lukasmonk/lucaschess) (Windows only)

[CuteChess](https://github.com/cutechess/cutechess/releases) (Linux Mostly)



*Simple GUIs*

[Jerry Chess](https://github.com/asdfjkl/jerry) (Cross Platform)

---

What is the best chess app for Linux?

lichess.org is phenomenal. The board editor to set up positions, the analysis board for, well, analyzing, and the Study feature for all of that combined (and more).

If you want a standalone application that does not run in a browser, get "Scid vs PC", it's in the AUR, if your distro is Arch-based. For Debian-based I think you need to add a repo, not sure, but you can google your way through the installation, I'm sure.

---

Get SCID and Stockfish

---

I run lichess or arch. Too used to it to leave

---

The comments below recommend (as I would also) [SCIDvsPC](http://scidvspc.sourceforge.net/). This is an excellent freeware chess database program. You can have a couple of engines (eg. Stockfish) accessible by it to play against the computer.

The advantage of this is that you can have the game(s) stored by SCIDvsPC as database for a permanent record and for later analysis. In any event, getting to know any one of the SCID variants ([SCID](http://scid.sourceforge.net/), [SCIDvsPC](http://scidvspc.sourceforge.net/),[ChessX](http://chessx.sourceforge.net/) or [SCIDb](https://sourceforge.net/projects/scidb)) will be well worth your time.

---

Chessbase is the industry standard and it's good. Some of my colleagues settled to Arena. This is free and highly adjustable. Maybe worth a shot? You will need a database as well. I don't know if there is some free database online, but also here Chessbase is the industry standard commercial solution.

Besides, lichess now operates with a games collection.

---

ChessX is a variant of SCID (Shane's Chess Information Database), as is SCIDvsPC (which is what I use, on Linux). Likely one or more of them will have a Windows version freely available. There are lots of tutorial [YouTube videos](https://www.youtube.com/results?search_query=scid+chess) on the SCIDs and many folks on [r/chess](https://www.reddit.com/r/chess/) use one of the SCIDs so you can always ask here for help.

For a reference database, there's [Caissabase](http://caissabase.co.uk/) which has 3.8 million games. And you can find lots of other types of data (eg. tactics, openings, etc) available on the net as PGN files which the SCIDs can import.

If you want games annotated by grandmasters or instructional databases made by granmasters (eg. "Karsten Müller - Endgame Strategy - The Power of the Bishops"), the commercial program [ChessBase](https://shop.chessbase.com/en/categories/chessbase) is your choice. Chessbase.com publishes a truly massive amount of chess information, much of which can be used with their free Chess Reader (castrated version of Chessbase).

One of the main ways I use SCIDvsPC is to enter the diagrams for a chess book, with all the moves and variations. Each book gets its own database. Then when I go back through the book, I play it out in SCIDvsPC, which is much quicker and less tedious than using a physical board & pieces. Currently I'm working on "Silman's Complete Endgame Course".

ChessBase is a more mature and feature-full database program (they've just released version 15 this week) than SCIDvsPC. My suggestion would be to use one of the SCIDs (SCID, SCIDvsPC, ChessX) until you decide that the cost of ChessBase is worth it to you. You can always export your SCID etc. data as PGN and import it into ChessBase.

---

You have three obvious options that I'm aware of (though maybe others for Windows):

- 
  1. SCID or SCIDvPC. This is an open source chess database, available for free. SCIDvPC is a later version of SCID with more features afaik. Upside: it's free, and let's you plug in UCI-compatible engines. Downside: the UI is a bit clunky imho.
- 2) Chessbase - this is the obvious commercial option on the PC, and it's what many people use. Base version is $99, and goes up substantially from there as you add features.
- 3) Hiarcs Chess Explorer - this is a pretty under-rated chess database imho. I use this one because I'm on a Mac and it's the only commercial database available for Mac that runs natively, but it is quite good, has a lot of great features, and I like it a lot. Base version is $50. The "Deep" version with endgame tables is $100, and you can also subscribe to their opening book (which I have tried, and is pretty good).

Once you have a database, whichever you choose, there are a number of freely available engines.

Three obvious free options:

- Stockfish
- Critter
- Older versions of Komodo

That's kind of where it ends on the Mac, but there are other free engines (and commercial ones) available for the PC. But honestly, even just stockfish will probably give you most of what you need unless you want to get into engine vs. engine matches. Stockfish is the strongest engine in the world after all, so it's not like you're sacrificing playing strength.

Also, once you have a database, you can download a variety of free chess databases. The three best sources I found were:

- Kingbase - A ton of games dating back to the early 90's, organized by opening.
- PGNMentor - A large number of historical games dating back to at least the 1800s, organized by player, tournament and opening.
- TWIC (The week in chess) - A weekly chess archive of notable games. It's been running since '94, but the PGN archives only go back to 2012.

If you download the 3 collections I mentioned, you now have millions of games at your disposal. Chessbase has their Megabase product which only works with Chessbase and has a lot more games, but I honestly haven't yet felt like I'm missing anything critical from the free set that I have. For what I'm using it for, the free ones have been more than enough so far.

I did this entire re-tooling project over the summer, and I feel I have a very complete tool set now. There's only one thing I wish Hiarcs did that it doesn't, which is search across multiple files. I have a number of other little "nice to have" features, but this one would be a game changer for how it can be used.

Other than that, I've been very happy with it. You won't get *exactly* what you see in lichess analysis with any of these, because it seems like lichess has leapfrogged pretty much everyone on UI design.

But you will get a complete analysis out of the engines using any of these systems. And adding comments, multiple lines, etc is standard functionality for all of these as well. I think anyone who is striving to be a serious chess student should have at least one of these.

---

On debian you can just `apt-get install chessx stockfish` and you should be set.

---

There is also number of GUIs for chess databases and running engines. Scid and Scid vs. PC being the most popular and ChessX being my personal favourite. Those run on Linux.

> What I like about the Chessmaster games is that they have a really good engine for creating players that aren't world class. Most engines designed for performance scale really quickly from stupid to crazy good, because the only thing that they change is move depth that the engine will look through. This isn't bad if the goal of the engine is to win tournaments, but if I want to play against a computer that feels realistic and has different play styles depending on what "character" I'm playing against, then it is very limiting.
>
> > Ok, I will give you that.
> >
> > But honestly, I use Stockfish to help me analyse my own games against human players. Playing against a computer, even one that is "throttled" becomes boring very quickly. Psychology is really important part of chess.

---

I recommend Lucas Chess: https://lucaschess.pythonanywhere.com/index?lang=en Here's a brief tutorial on how to run on linux: https://github.com/lukasmonk/lucaschess/blob/master/Linux/LinuxInstallation.md

---

Try this: http://scidvspc.sourceforge.net/ together with any UCI-engine, e.g. Stockfish 7 https://stockfishchess.org/download/ Both are open source.

---

There is Jerry, which you can check here: https://github.com/asdfjkl/jerry

---

I use and like [SCID](http://scid.sourceforge.net/), which is free (as are its various forks/cousins like [Scid vs. PC](http://scidvspc.sourceforge.net/), [ChessDB](http://chessdb.sourceforge.net/), and [ChessX](http://chessx.sourceforge.net/node/5)).

Since you are willing to pay, [Chessbase](http://chessbase.com/) has a popular product. I suspect its interface and feature set are more polished than the free alternatives.

> Another vote for SCIDvsPC combined with Stockfish 6, both fully open source and free. I like supporting projects like this, and both products are top notch - you would never need more below a professional level.

> I would recommend you compare Fritz/Chessbase interface with SCID and see what you prefer. Fritz can be gotten quite inexpensively, don't have to get the full Chessbase.
>
> Chessbase is the pro standard, but you might not need all the features.
>
> Basically you have 3 components to worry about: Interface(SCID vs Fritz style), DBs(again free/self curated and/or paid collections) and Engines(super strong Stockfish is free for all UCI interfaces, and many other paid and free engines).
>
> Pick the interface that you like and you can add the other components later

---

`stockfish` is the world's strongest chess engine and it is FOSS and available in the AUR. It is just an engine though, you'll need other software to interact with it. I use SCID, which is also in the AUR and has a bunch of useful database functionality for analyzing games. There's also [these](https://wiki.archlinux.org/index.php/List_of_games#Chess_simulators) options.

> Most engines do support settings for adjusting strengths. However sometimes reducing strengths of very strong engines can feel awkward. Like it may play strongly for a while, and then play a bad move to balance things. So an engine that's actually closer to your strength might feel more realistic. Other way to make an even match is to give it much smaller time to think, that's how I play against gnu chess on xboard.

---

What about GNOME Chess? :)

---

Xboard > *

---

Knights already supports any computer opponent using the Xboard protocol. Just find a good computer opponent and stick to what you're used to.

---

pychess as frontend for fics and stockfish. SCID vs. PC (AUR) is probably the best free database. On line: lichess.org.

---

In case you want the whole list of the chess open source projects: [link](https://awesomeopensource.com/projects/chess).

Analyze next articles:

- https://linuxhint.com/best_chess_games_ubuntu/
- https://linuxreviews.org/Chess_games
- https://www.lifewire.com/the-best-free-chess-games-for-linux-4088113
- https://www.linuxlinks.com/chess/ - **12 of the Best Free Linux Chess Apps (Updated 2018)**
- https://www.chess.com/blog/SamCopeland/the-best-linux-apps-for-chess

Projects:

- https://www.reddit.com/r/linux/comments/jt4dan/linux_terminal_chess_with_source/
- https://www.reddit.com/r/linux_programming/comments/kg08pr/linux_terminal_chess_with_source/

## Chess engines

Houdini 6 is the strongest of that list.

I just ran a huge 1500-game tourney (took 2+ months to run) between Houdini, Komodo and Stockfish 8 --- Houdini was clearly the strongest.

Stockfish 9 comes out next month and I will run it again.

1 Houdini 6: http://www.cruxis.com/chess/houdini.htm

2 Komodo 11: http://komodochess.com/

3 Stockfish 8: https://stockfishchess.org/

All very close to each other in rating, but clearly in that order. I'll be re-running the competition once Stockfish 9 comes out. I'm also going to do some sort of "qualifying" tournament for the new Fritz 16 to see if it should be included.

btw, I do all of this on a Windows PC with Arena. I can't help you with Gnome, sorry!

---

Stockfish 9 is now out.

It seems to be back at the top of the rating list: http://www.computerchess.org.uk/ccrl/404FRC/

Well, from what I've heard in post-game analysis (a.k.a. postmortems) a lot of top over-the-board players use Stockfish. I've heard them make Stockfish references probably 6-to-1 over Houdini or Komodo. But over-the-board is different than corr chess, so it depends on what you're looking to do. At this point, for a non-professional, I can't see why the free Stockfish 9 isn't enough. It's my main engine (with Komodo a distant second).

---

Try pychess (should be in the repos). You can set the level it plays at. You may also want to get scid vs pc. Phalanx and Stockfish work with both of those.

---

If you are a newbie this is what you should do:

Get a proper chess course/book/video/whatever that explains well the basic tactics, positional game and most importantly the endgame. Back in the 90s I loved Karpov's introductory book but I don't think what's out there now, I read it in a different language and I cannot find it in English anywhere. In chess.com I think there's plenty of material including introductory material, although I haven't gone through it.

Don't just play the computer on easy levels too much, this is mostly a waste of time and won't improve your game at the beginner level. It's a common mistake. It will actually stall you big time if you get used to play back moves, have no discipline to continue in disadvantage and play for the draw, etc. Keep it real against even a poor computer opponent. Play it no more than a few times a day.

Don't try to memorize a lot of opening lines. Memorize the basic ideas from a good generic introductory source. Don't go reading opening books as a beginner, that can wait. Definitely the endgame must be mastered before going into that.

This is how you effectively use a computer as a beginner:

- easy level games, no more than a few.
- set up endgame drills on an editable board against a strong opponent. No matter how strong the opponent is a strongly winning endgame must be won. I don't recommend specialized books on openings to beginners but you can get endgame books that cover basically any level up to International Master or even Grandmaster. For instance you can peek inside this one (Amazon lets you) and set up positions and finish off Stockfish on them: http://www.amazon.co.uk/Fundamental-Chess-Endings-One-Encyclopaedia/dp/1901983536/ref=pd_sim_b_3?ie=UTF8&refRID=01WPWY9AXZMEJ2TKK5VT
- with solid endgame play you will be able to beat many engines on easy levels, you can try upping the level but beware of that, because the kind of play and errors engines make are rarely human-like. This can twist your game and hurt your progress. Eventually you want to face humans to progress, get beaten in humanly ways, win in humanly ways with blunders on both ends, the psychological aspect, etc.

EDIT: another book you can peek inside for classic endgame positions and tactics [http://www.amazon.co.uk/Pandolfinis-Endgame-Course-Concepts-Explained/dp/0671656880/ref=sr_1_1?s=books&ie=UTF8&qid=1418228655&sr=1-1&keywords=pandolfini%27s+endgame+course](http://www.amazon.co.uk/Pandolfinis-Endgame-Course-Concepts-Explained/dp/0671656880/ref=sr_1_1?s=books&ie=UTF8&qid=1418228655&sr=1-1&keywords=pandolfini's+endgame+course)

All that should keep you busy for a while. Then, calculation and tactical + positional theory. Maybe best with a coach because it will be hard to keep motivation on your own with just books.

EDIT2: as a beginner, you should not spend more than 15-20 minutes trying to figure out one single position. If you find yourself doing that, you are aiming too high. Your learning will be a lot more effective if it's incremental. As a higher-intermediate maybe studying a position from a book 20 minutes is just fine. But by then you will know.

---

Try this:

https://github.com/thomasahle/sunfish

---



## References

1. https://www.reddit.com/r/chess/comments/a5k5ie/best_free_chess_gui/
2. https://www.reddit.com/r/chess/comments/c059rm/what_is_the_best_chess_app_for_linux/
3. https://www.reddit.com/r/chess/comments/9wuiz4/chess_software_recommendation/
4. https://www.reddit.com/r/LinuxActionShow/comments/270u9l/the_strongest_chess_engine_is_free_and_open/ (too old?)
5. https://www.reddit.com/r/ComputerChess/comments/7oou8q/best_chess_engine_for_linux_2018/
6. https://www.reddit.com/r/ComputerChess/comments/2nitqp/finding_the_right_linux_chess_engine_for_me/
7. https://www.reddit.com/r/chess/comments/3i87ys/what_is_the_best_chess_software/
8. https://www.reddit.com/r/archlinux/comments/6awqjc/recommend_a_linux_chess_game/

