###Testing E1's comments:####

#library and package
library(lattice)
library(dplyr)

##Load and check data
getwd()
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism/Kruskal-Wallis test")


data <- read.csv("combined.csv")
kruskal.test(BS~Sex+Population, data=data)
kruskal.test(BS~Sex, data=data)

str(data)
model1<- lm(BS~Sex+Population+Sex*Population, data=data)
summary(model1)





CCNR <- read.csv("CCNR.csv")
Ubin <- read.csv("PU.csv")
MYmainland <- read.csv("MYmainland.csv")
Langkawi <- read.csv("Langkawi.csv")

#Shapiro Wilk test to test for normal distribution#
#If the P-Value of the Shapiro Wilk Test is smaller than 0.05, we do not assume a normal distribution#
shapiro.test(CCNR$BS)
shapiro.test(Ubin$BS)
shapiro.test(MYmainland$BS)
shapiro.test(Langkawi$BS)
# CCNR: 0.02927, Ubin: 0.0004719, MY mainland:0.001031, MY island; 2.161e-07), all values < 0.05, hence data is not normal.#

#Shapiro for whole of SG#
data <- read.csv("combined.csv")
SG <- dplyr::filter(combined, Country == "Singapore")
str(SG)
shapiro.test(SG$BS)



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
kruskal.test(BS~Population, data =males)
#as Kruskal wallis for male body size across population is 0.001059, sig
#hence, I conducted post hoc test to see which pop differ from one another
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

