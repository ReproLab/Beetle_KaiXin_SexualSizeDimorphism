###Box plot to visualise SSD### 

#load libraries#
library(dplyr)
library(ggplot2)
library(plotrix)

##Load and check data
getwd()
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism")
data <- read.csv("SSDData2020.csv")

#Check Data
head(data)
glimpse(data)
str(data)


#Box Plot, median
ggplot(data, aes(x=Population, y=BodySize), col) + geom_boxplot() + ylab("Pronotum width (mm)") + theme_bw()

#Boxplot, mean and sd
#pch is shape of point
BSmean <- by(data$BodySize, data$Population, mean)
BSsd <- by(data$BodySize, data$Population, sd)
BSn <- summary(data$Population) # Sample sizes
BSSE <- BSsd / sqrt(BSn)
t.crit <- qt(0.95, BSn-1)
int.width <- BSSE * t.crit
library(plotrix)
plotCI(x=1:8, y=BSmean, xaxt="n", uiw=int.width, err='y',xlab="", ylab="Average protonum width (in mm) (mean ± S.E.M.)", pch=0)
axis(1, at=1:8, labels=levels(data$Population), las=1)
title(main="Sexual Size Dimorphism")
