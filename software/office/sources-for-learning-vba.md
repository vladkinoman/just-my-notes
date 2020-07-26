# Sources for learning VBA

**What are some good resources to learn VBA for a beginner?** (Oct 13 2016)

Looking into learning VBA, but at a complete loss as where to start. Ideas?

16: 

1. Use the Excel Macro recorder.
2. Do the stuff you're trying to do.
3. Read and try to understand the code it generates.
4. Tweak different parts of the code, rerun the macro, see if it works.

Buy an Excel VBA book to learn more. There might be online courses for free (and definitely paid), but they weren't around when I was learning.

8: I learned by having something I wanted to do and trying to do it. Then googling , slack overflow, and repeat. Macro recorder definitely but it has some "bad" ideas.

> 3: I think number one issue with macro recorder is that it records every action as a separate line when most can be done on one line, also it doesn't address loops, arrays, etc. Which are necessary for most macros. Also copy then paste is bad when you can set range.value to another range.value

4: I believe I found this link elsewhere on Reddit but I've found [www.homeandlearn.org](http://www.homeandlearn.org/) quite useful so far. It lays out the basics and is pretty beginner-friendly.

3: [Chip Pearson's site](http://www.cpearson.com/Excel/topic.aspx) has a ton of great examples for both vba and general excel stuff. Not so much a step by step tutorial but good reference with detailed examples. I don't usually browse the site or go there directly but whenever I'm searching for something it seems like his site shows up.

You could also check out udacity and Coursera. Not sure exactly what their current free offerings are but I think they've had vba stuff in the past.

3: [WiseOwlTutorials](https://www.youtube.com/playlist?list=PLNIs-AWhQzckOzn3l2_VWUicXZvywNSI4)

> How to construct forms.

3: Learn basic programming stuff. It doesn't really matter what language.

Figure out what objects, classes, arrays, functions, etc are, and where and why you'd use them. Try to dig into a little bit of compsci and understand what's going on under the hood. Learn the difference between different styles of programming and try identifying and employing them.

Do this and you'll end up 10x better off than the average "hey it works" VBA jockey, and with skills and an understanding that can be transferred and built upon in most modern languages. Heck, once you figre out how to make sense of the Object Browser and MSDN you should pretty much never need the macro recorder (well..maybe in a really tight pinch).

---

**Best Online Source to Learn VBA?`**

Hey VBA community

I am looking to learn VBA and excel programming as I am graduating next year and would like to get into financial/investment analysis. I have zero knowledge in terms of programming so I would be a beginner. Does anyone have some suggestions regarding online courses? I am planning on dedicating any free time this summer to learning excel programming/financial modelling.

Any help is appreciated!

3: The first thing to understand is that, while they are often intertwined, vba is 100% separate from finance/investments.

In an over simplified way, VBA is simply how you automate things that you do repetitivly for finance/investments.

I can't say that it is the easiest way, but I learned VBA, by starting to look at things I did over and over and asked how can I automate this. Then I literally went to Mr. Excel (or similar boards) and said I do x how do I write a code to do this automaticly and then asked how the code works. After a few weeks, what the code did started making sense and I was able to edit it to make it do different things.

So my advice, and again it may not be the best way to learn, is to just continually Google "how do I do x" then ask how it works until it clicks.

> 1 (OP): I appreciate the advice and it does make sense. With that said, Would it make sense to focus on learning Financial modelling first? Had thoughts of putting together my own model portfolio as a learning tool.
>
> > 1: It's something that can go hand in hand. Personally, I'd focus more on financial modeling and as you are doing so look for repetitive things.
> >
> > As an oversimplified example, say as you are learning to model that you have to continually create a calculation for multiple simple and exponential moving averages. That would be a good start to learn how to implement VBA. You could write a little script that asks what range you want (e.g. 20 sma) and what column you want the results to populate. You can save that to a "master workbook" and then any time you need to calculate the small, you just call the macro and boom you just saves 2 minutes. It may not seem like much at first, but before you know it you will have a whole bunch of stuff automated.

2: Homeandleard.org is how I learned, with lots of supplementary lessons from google! 🙂 it won't take all summer to get the basics by the way!

1: WiseOwl channel on YouTube is great as well.

But as someone who recently graduated from business school and have tons of friends in I banking etc.

Focus more on your actual financial analysis ability and non-VBA excel. Make sure those two are down pat, and then focus on understanding VBA to automate things that you do on a regular basis.

That will also make you learn VBA quicker because you'll be writing code as quickly as possible because you have a goal of automating something you already do.

---

**Where can i best learn how to write VBA starting with the basics? Is it worth it?**

I usually use "Record Macro" and that's covered everything I've needed usually, but can't help but think learning VBA will be more beneficial.

Can anyone with experience show me where to start? And, equally, tell me if it's worth the time investment? Thanks

48: Everyone's style of learning may vary. I learn best when tinkering with pre-existing code to see how it works, then modifying it to make sure I understand what everything is doing. Other people may learn best by reading books or articles, and others still may learn best by videos. You'll have to identify how you learn best and follow that approach.

As for if it's worth the time invested? Let's just do a little bit of math based on my personal experience at my latest position and how much time the things I've automated have saved me.

I have to input a lot of data when I first start out my day, and I used to have to look up all these codes from a report that other people maintained to keep track of things. I've partially automated this part where I can just click on stuff and the values are automatically looked up for me to enter. Though I'm currently in the process of automating things even further so I can just click on what I want to import then generate the import file for them. I'd say this task without my partial automation could take me up to an hour depending on how much stuff needed to get entered into our system each day.

Another large aspect of my job that I've almost fully automated is the reporting and emails that need to get generated each night. It's a handful of reports that need to be formatted and emailed to various distro lists. These if done manually, could take up to a half hour just to format, with maybe 15 minutes afterwards of composing and sending all the emails. So we can say this in particular took about 45 minutes each night to perform.

All in all, before any automation, it's safe to say that manual tasks took me about 1.75 hours each day of the work week. Since I've been at this position for a little over a year, and the macros were created about a month after starting here we can say they have been in effect for a full calendar year. When performing these calculations, we can subtract weekends, and do the math: `365-(52*2)*1.75 = 456.75 hours ~ 19 days`

So the macros that I've created last year have literally saved me 19 days worth of manual tedious work over the course of just the last year alone. I would say this is 100% worth the effort I'd put into created said macros in the first place, and on a day to day basis make my job that much easier and enjoyable.

> 3: Any reason Power Query wouldn't suffice?
>
> > 4: The reports are exported via MS Access, and formatted/distributed in Excel. I'm sure PowerQuery could probably do the job just as well, but I don't feel like reinventing the wheel for this stuff. As for the data entry at the start of each day, PowerQuery wouldn't help me much in that regard.

29: There's a good basic course at homeandlearn.org.
It helps to be able to see what everything does as you can adapt macros to do things that you can't just record. You can also make your macros more elegant (and efficient)
Not that I'm very good but a basic understanding and Google will help you to do stuff you wouldn't have thought of

22: https://www.youtube.com/playlist?list=PLNIs-AWhQzckr8Dgmgb3akx_gFMnpxTN5 - wiseowl. I'm working my way through & making notes. It's taught me a lot.

11: I found that vba for dummies was actually pretty good.

They cover the basics of programming, even explaining binary. They ditch the "for dummies" tone pretty quickly too.

Now in order to really learn, there's nothing like having actual problems to solve. So try to automate something at work or in your life!

8: To be honest using the record macro function and then cannibalizing everything possible off of Google has made my padawan poser ass look like a Sith Lord in most of the companies I've worked in. I have no training in any of this, just an accounting degree and boredom. Mind you, it's been in some pretty complicated finance departments. The willingness to try something new without consent (rough wording) makes you fucking stand out in most situations because 90% of people there are willing to do things status quo without questioning. Challenge the way things are done, make them better. You'd be amazed at the simple processes people do just because the person before them did it that way. Currently they can't fire me because no one knows how my nonsense code works, any reasonable coder would burn it down and say start over but through bullshitting my way through it I've learned a metric fuckton

> 2:
>
> > For most other industries (I think...) learning C# and implementing through visual studio tools for office would be a better time investment.
>
> Can relate to this.

3: As others have mentioned, it's definitely worth the time.

I started by recording small macros and looking at what each line did and from there began creating scripts to automate and address issues much faster than if I were to do it manually.

Two resources I use a lot are [TechOnTheNet](https://www.techonthenet.com/excel/index.php) and also [Chip Parson's site](http://www.cpearson.com/Excel/MainPage.aspx). TechOnTheNet has great explanation of functions and Chip's site helps run through particular problems that might be rather in depth.

Also, forums are a great place to delve into. I've found that Mr. Excel and Excel Forum are quite good; remember, if you've had a problem, most likely a lot of others have too.

3: If you're working/planning to work in high finance VBA can be a very useful tool. A lot of companies still use pretty outdated infrastructure.

For most other industries (I think...) learning C# and implementing through visual studio tools for office would be a better time investment.

As for where to learn, there are many free online courses offered through major universities to learn VBA, .NET, or C#. I wish I had a more specific recommendation but I learned VBA in uni and sort of just use C# by doing.

## Conclusion

Great resources: [homeandlearn.org](https://homeandlearn.org) and [wiseowl](https://www.youtube.com/playlist?list=PLNIs-AWhQzckr8Dgmgb3akx_gFMnpxTN5).

It may not be the best way to learn, is to just continually Google "how do I do x" then ask how it works until it clicks. However, many people recommend this method, as it is more practical.

## References

1. https://www.reddit.com/r/excel/comments/5779ev/what_are_some_good_resources_to_learn_vba_for_a/
2. https://www.reddit.com/r/vba/comments/8eznfq/best_online_source_to_learn_vba/
3. https://www.reddit.com/r/excel/comments/8rt7fy/where_can_i_best_learn_how_to_write_vba_starting/