#Kruskal-Wallis test to determine if body size differs significantly between sexes within population and between populations#
#Kruskal-Wallis test is used because Body Size(dep variable)=continuous + dependent variables (sex,population,country) are categorical = ANOVA BUT data not normal --> non-parametric test equivalent is Kruskal wallis. http://blog.minitab.com/blog/understanding-statistics/data-not-normal-try-letting-it-be-with-a-nonparametric-hypothesis-test

#library and package
library(lattice)
library(dplyr)

##Load and check data
getwd()
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism")
Mandai <- read.csv("Mandai.csv")
Ubin <- read.csv("Ubin.csv")
Kenyir <- read.csv("KenyirGombakPerak.csv")
Langkawi <- read.csv("Langkawi+NEW.csv")


#Kruskal-Wallis for Body Size~Sex within the population
str(Mandai)
kruskal.test(BodySize~Sex, data =Mandai)

str(Ubin)
kruskal.test(BodySize~Sex, data =Ubin)

str(Kenyir)
kruskal.test(BodySize~Sex, data =Kenyir)

str(Langkawi)
kruskal.test(BodySize~Sex, data =Langkawi)

#Kruskal-Wallis for between population
kruskal.test(BodySize~Population, data =SSD)

#Kruskal-Wallis for between country
kruskal.test(BodySize~Country, data =SSD)

