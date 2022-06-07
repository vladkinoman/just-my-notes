# Notes on statistics

> Based on tutorial from [hackerrank](https://hackerrank.com).

## Table of Contents

1. [Mean, median, and mode](#Mean-median-and-mode)
   - [Precision and Scale](#Precision-and-Scale)
2. [Weighted Mean](#Weighted-Mean)
3. [Quartiles](#Quartiles)
   - [Computing the First and Third Quartile](#Computing-the-First-and-Third-Quartile)
4. [Standard Deviation](#Standard-Deviation)

## Mean, median, and mode

### Mean

The average of all the integers in a set of values. Here is the basic formula for calculating the *mean* of a set of **n** values:

$$
\mu = \frac{\sum ^n_{i=1}x_i}{n},\ where\ x_i\ is\ the\ i^{th}\ element\ of\ the\ set.
$$

### Median

The midpoint value of a data set for which an equal number of samples are *less than* and *greater than* the value. For an odd sample size, this is the middle element of the sorted sample; for an even sample size, this is the *average* of the middle elements of the sorted sample.

### Mode

The element(s) that occur most frequently in a data set. For the set **{1, 1, 1, 2, 2, 3, 4, 4}**, the mode is **1** because the number **1** appears three times in the set and every other number in the set has a frequency < **3**. In contrast, the set **{1, 2, 3, 4}** is [multimodal](http://mathworld.wolfram.com/Multimodal.html) because no number in the set appears more than **1** time, so every number in the set is a valid *mode*.

### Precision and Scale

These are important terms to understand when formatting your output:

- *Precision* refers to the number of significant digits in a number. For example, the numbers **123.45** and **0.012345** both have a precision of **5**.
- *Scale* refers to the number of significant digits to the *right* of the decimal point. For example, the number **123.45** has a scale of **2** decimal places. This term is sometimes misrepresented as *precision* in documentation.

## Weighted Mean

Given a discrete set of numbers, **X**, and a corresponding set of weights, **W**, the *weighted mean* is calculated as follows:

$$

m_w = \frac{\sum^n_{i = 1} (x_i w_i)}{\sum^n_{i=1}w_i}
$$

Therefore, data elements with a high weight contribute more to the weighted mean than do elements with a low weight. The weights cannot be negative. Some may be zero, but not all of them (since division by zero is not allowed).

The formulas are simplified when the weights are normalized such that they sum up to **1**.

## Quartiles

The quartiles of an ordered data set are the **3** points that split the data set into **4** equal groups. The **3** quartiles are defined as follows:

1. **Q₁**: The first quartile is the middle number between the smallest number in a data set and its median.

2. **Q₂**: The second quartile is the median (50th percentile) of the data set.

3. **Q₃**: The third quartile is the middle number between a data set's median and  its larger number.
   
   ### Computing the First and Third Quartile

We will use the [first method described in the Wikipedia](https://en.wikipedia.org/wiki/Quartile#Method_1):

We will split the data into two halves, *lower half* and *upper half*:

- If there are an odd number of data points in the original ordered data set, do not include the median (the central value in the ordered list) in either half.
- If there are an even number of data points in the original ordered data set, split this data set exactly in half.

The value of the first quartile (**Q₁**) is the median of the lower half and the value of the third quartile (**Q₃**) is the median of the upper half.

## Standard Deviation

> From Quora:

The main and most important purpose of standard deviation is to understand how spread out a data set is.

If you imagine a cloud of data points, drawing a line through the middle of that cloud will give you the ‘average’ value of a data point in that cloud.

Now that you have the average line, every data point in the cloud is going to be a certain distance from the average line. You could form another data cloud made up of data points derived from the distance every point in the first cloud is from the average line.

With this second data cloud, you could draw a line through the middle and work out the average distance every point is from the average value in the first cloud. This is standard deviation.

A high standard deviation implies that, on average, data points in the first cloud are all pretty far from the average (it looks spread out). A low standard deviation means most points are very close to the average.

> From this [page]( https://www.dummies.com/education/math/statistics/why-standard-deviation-is-an-important-statistic/ ):

The standard deviation is a commonly used statistic, but it doesn’t often get the attention it deserves. Although the mean and median are out there in common sight in the everyday media, you rarely see them accompanied by any measure of how diverse that data set was, and so you are getting only part of the story. In fact, you could be missing the most interesting part of the story.

Without [calculating standard deviation](https://www.dummies.com/education/math/statistics/how-to-calculate-standard-deviation-in-a-statistical-data-set/), you can’t get a handle on **whether the data are close to the average** (as are the diameters of car parts that come off of a conveyor belt when everything is operating correctly) or **whether the data are spread out over a wide range** (as are house prices and income levels in the U.S.).

For example, if you are told that the average starting salary for someone working at Company Statistix is 70,000, you may think, “Wow! That’s great.” But if the standard deviation for starting salaries at Company Statistix is 20,000, that’s a lot of variation in terms of how much money you can make, so the average starting salary of $70,000 isn’t as informative in the end, is it?

On the other hand, if the standard deviation was only $5,000, you would have a much better idea of what to expect for a starting salary at that company. Which is more appealing? That’s a decision each person has to make; however, it’ll be a much more informed decision once you realize standard deviation matters.

Without the standard deviation, you can’t compare two data sets effectively. Suppose two sets of data have the same average; does that mean that the data sets must be exactly the same? Not at all. For example, the data sets 199, 200, 201 and 0, 200, 400 both have the same average (200) yet they have very different standard deviations. The first data set has a *very* small standard deviation (*s*=1) compared to the second data set (*s*=200).

### Expected Values

The expected value of a discrete random variable, **X**, is more or less another way of referring to the mean (**µ** - mu is more population mean than sample mean). We can also refer to this as the mathematical expectation (or just the expectation) of **X**.

### Variance σ²

This is the average magnitude of fluctuations of **X** from its expected value, **µ**. You can also think of it as the expectation of a random variable's squared deviation from its mean. Given a data set, **X**, of size **n**:

$$
\sigma^2 = \frac{\sum_{i=1}^n (x_i - \mu)^2}{n},\\
where\ x_ᵢ\ is\ the\ i^{th}\ element\ of\ the\ data\ set,\\ and\ \mu\ is\ the\ mean\ of\ all\ the\ elements.
$$

### Standard Deviation σ

The standard deviation quantifies the amount of variation in a set of data values. Given a data set, **X**, of size **n**: 

$$
\sigma = \sqrt {\frac{\sum_{i=1}^n (x_i - \mu)^2}{n}}
$$

where $x_i$ is the $i_{th}$ element of the data set and $\mu$ is the *mean* of all the elements.