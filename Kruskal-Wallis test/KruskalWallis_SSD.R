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
str(combined)
#Kruskal-Wallis for body size between population
kruskal.test(BS~Population, data =combined)

#Kruskal-Wallis for body size between country
kruskal.test(BS~Country, data =combined)

#Kruskal-Wallis for body size between males across population
males <- dplyr::filter(combined, Sex == "M")
males$Country <- as.factor(males$Country)
males$Population <- as.factor(males$Population)
str(males)
kruskal.test(BS~Population, data = males)
##p-value = 0.001059 --> conduct post hoc test: Dunn test
#https://rcompanion.org/handbook/F_08.html
library("FSA")
DT = dunnTest(BS ~ Population,
              data=males,
              method="bh")  
DT
PT = DT$res
PT
library(rcompanion)
cldList(P.adj ~ Comparison,
        data = PT,
        threshold = 0.05)
#Groups sharing a letter not signficantly different (alpha = 0.05).
##CCNR n Ubin and CPM no sig diff. 

#lang vs SG population sig. diff, removed cpm from dataset, test country cuz testing lang vs sg
nocpm<-read.csv("combined_noCPM.csv")
Mnocpm<-dplyr::filter(nocpm, Sex == "M")
str(nocpm)
str(Mnocpm)
kruskal.test(BS~Country, data =Mnocpm)

#CPM vs langkawi males
MY<-read.csv("combined_malesMY.csv")
str(MY)
kruskal.test(BS~Population, data =MY)


#Kruskal-Wallis for body size between Females across country
females <- dplyr::filter(combined, Sex == "F")
str(females)
kruskal.test(BS~Population, data =females)
DT = dunnTest(BS ~ Population,
              data=females,
              method="bh")  
DT
PT = DT$res
PT
library(rcompanion)
cldList(P.adj ~ Comparison,
        data = PT,
        threshold = 0.05)
#from dunn test MY pop same and SG diff --> so conduct kruskal for country
kruskal.test(BS~Country, data =females)

