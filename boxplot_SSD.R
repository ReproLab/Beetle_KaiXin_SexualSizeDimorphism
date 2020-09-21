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



#Boxplot, mean and sd
#pch is shape of point
BSmean <- by(data$BodySize, data$Population, mean)
BSsd <- by(data$BodySize, data$Population, sd)
BSn <- summary(data$Population) # Sample sizes
BSSE <- BSsd / sqrt(BSn)
t.crit <- qt(0.95, BSn-1)
int.width <- BSSE * t.crit
plotCI(x=1:8, y=BSmean, xaxt="n", uiw=int.width, err='y',xlab="Population",ylim = c(3.2,4.2),
       ylab="Average protonum width (mm)\n(mean ± S.E.M.)", pch=15,
       col=rep(c("#D55E00","#F0E442","black","#0072B2"), each=2), lty=rep(1:2, each=n))


