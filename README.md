# Law of Large Numbers on Forex
It is a study in which I try to prove the law of large numbers, one of the basic principles of probability in the forex market.

## What is Law of Large Numbers?
The Law of Large Numbers is a fundamental principle in probability and statistics that describes the behavior of the average of a large number of independent, identically distributed random variables. In simpler terms, it states that as the sample size increases, the average of the sample will tend to get closer to the expected value or true population mean.

The Law of Large Numbers is based on the idea that random fluctuations tend to cancel out as the sample size becomes larger, resulting in a more stable and predictable average. This principle is essential for making inferences and drawing conclusions from data.

There are two main versions of the Law of Large Numbers:

1. Weak Law of Large Numbers: This version states that as the sample size increases, the sample mean will converge in probability to the true population mean. In other words, as you take larger and larger random samples from a population, the sample means will get closer to the actual population mean, but there will still be some random variation around it.

2. Strong Law of Large Numbers: This version is more powerful and asserts that as the sample size approaches infinity, the sample mean will almost surely converge to the true population mean. This means that with certainty, the sample mean will eventually become equal to the population mean as the sample size becomes infinitely large.

### Example
For example, a single roll of a fair, six-sided die produces one of the numbers 1, 2, 3, 4, 5, or 6, each with equal probability. Therefore, the expected value of the average of the rolls is: 

                                                                1+2+3+4+5+6
                                                              ______________  = 3.5
                                                                      6

According to the law of large numbers, if a large number of six-sided dice are rolled, the average of their values (sometimes called the sample mean) will approach 3.5, with the precision increasing as more dice are rolled. 

## What have we used in this Study?

-- To obtain the data in the values.csv file, the equal.mq4 expert, which I wrote using MQL4, the programming language written for the Metatrader4 platform, was used.

-- We used the python libraries pandas and matplotlib to visualize the data in the .csv file.


## Study results

** For the purpose of the study, column 1 of the .csv file shows the percentage of buy trades and column 2 shows the percentage of sell trades from the start date at 15.30 every day until that time. 

** Our expectation is that the expected ratio of Buy and Sell trades is 50%.

** As you can see in the picture, at the end of the 136th day, the ratio of buy and sell trades is equal to 50.00 and 50.00.
