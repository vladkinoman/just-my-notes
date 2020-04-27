# Choosing RAM

What you need to know when choosing a new (or additional?) module of RAM:

- identify motherboard type (chipset). The best way is to download CPU-Z [1]. After doing this, click the Mainboard bookmark. You need to look at the Southbridge company and the model name on the right.
  This is my chipset: Intel HM76 Express.
- google for that motherboard type and check its characteristics. What is the maximum size it supports?
- you may buy identical RAM in addition to the current one. However, this may not work, work over time, or even work normally. Who knows? I bought Hynix 4 GB SO-DIMM DDR3L 1600 MHz (after the GoodRAM memory block which I refunded). Some people wrote that Hynix's RAM combines well. That's unfortunate. I have the same RAM in my laptop. They only differ in model number - one of them is older, the other is newer. 
  I couldn't start the laptop with them for a long time, constantly pulled them out, put them back in, and the hundredth time it worked. The computer took both of them, but it worked strangely. There's a problem with power when you push the button itself. The computer likes to restart after you press the button, in 5 seconds. It happens in one of five cases. At this point, I don't think it's critical. 
- Ram is sold in kits for a reason. **It is better to buy two RAMs in one kit than to buy additional memory**. A motherboard must manage all the ram using the same specs of voltage, cas and speed. Ram from the same vendor and part number can be made up of differing manufacturing components over time [2].

## If I installed an extra RAM block, but it still doesn't work

- Often you can raise the DRAM voltage - try about +0.05 and they might play, plus it's perfectly safe. This can be done in BIOS. Unfortunately, I can't do this in my BIOS [3].
- You can rearrange it several times and it will work for the twentieth time (as I did it for the second time and tried to verify the correctness of the method by experimenting). It's stupid, but it worked for me.
- **It is better to sell both these sticks and buy a kit with tested sticks**.

## Using 3 identical RAM sticks

It will work; but, if your MB supports dual channel memory (likely), you will pay a performance penalty which may exceed the advantage of the extra RAM [4].

Plus, it would be better to add two with the same total memory as three due to dual channel memory being faster. The third stick won’t be part of dual channel.

## References

1. https://www.quora.com/How-do-I-know-if-my-motherboard-can-support-an-8GB-RAM
2. https://forums.tomshardware.com/threads/combining-two-sets-of-identical-ram-can-i-get-them-to-work.3111096/
   bonus: https://forums.tomshardware.com/threads/can-identical-ram-be-combined.2486322/
3. https://forums.tomshardware.com/threads/identical-ram-sticks.2824448/
4. https://www.quora.com/Will-it-be-ok-to-use-3-identical-ram-sticks