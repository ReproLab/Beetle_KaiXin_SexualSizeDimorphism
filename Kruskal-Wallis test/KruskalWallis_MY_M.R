#Kruskal-Wallis test to determine if body size differs significantly between sexes within population and between populations#
#Kruskal-Wallis test is used because Body Size(dep variable)=continuous + dependent variables (sex,population,country) are categorical = ANOVA BUT data not normal --> non-parametric test equivalent is Kruskal wallis. http://blog.minitab.com/blog/understanding-statistics/data-not-normal-try-letting-it-be-with-a-nonparametric-hypothesis-test

#library and package
library(lattice)
library(dplyr)

##Load and check data
getwd()
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism/Kruskal-Wallis test")
MYmales <- read.csv("MYmaleBS.csv")


#Kruskal-Wallis for Body Size~Location within Malaysia Males
str(MYmales)
kruskal.test(BS~Location, data =MYmales)


