#Kruskal-Wallis test to determine if body size differs significantly between sexes within population and between populations#
#Kruskal-Wallis test is used because Body Size(dep variable)=continuous + dependent variables (sex,population,country) are categorical = ANOVA BUT data not normal --> non-parametric test equivalent is Kruskal wallis. http://blog.minitab.com/blog/understanding-statistics/data-not-normal-try-letting-it-be-with-a-nonparametric-hypothesis-test

#library and package
library(lattice)
library(dplyr)

##Load and check data
getwd()
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism/Kruskal-Wallis test")
CCNR <- read.csv("CCNR.csv")
Ubin <- read.csv("PU.csv")
MYmainland <- read.csv("MYmainland.csv")
Langkawi <- read.csv("Langkawi.csv")


#Kruskal-Wallis for Body Size~Sex within the population
str(CCNR)
kruskal.test(BS~Sex, data =CCNR)

str(Ubin)
kruskal.test(BS~Sex, data =Ubin)

str(MYmainland)
kruskal.test(BS~Sex, data =MYmainland)

str(Langkawi)
kruskal.test(BS~Sex, data =Langkawi)

#read data for across population comparisons
combined <- read.csv("combined.csv")

#Kruskal-Wallis for between population
kruskal.test(BS~Population, data =combined)

#Kruskal-Wallis for between country
kruskal.test(BS~Country, data =combined)

