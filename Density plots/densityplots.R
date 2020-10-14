#data sheet in Kruskal-wallis folder, hence:
setwd("/Users/kaixin/Beetle_KaiXin_SexualSizeDimorphism/Kruskal-Wallis test")

library(ggplot2)
library(dplyr)

################################For CCNR########################################
CCNR <- read.csv("CCNR.csv")
males <- dplyr::filter(CCNR, Sex == "M")
malesBS <- as.numeric(males$BS)
str(malesBS)
females <- dplyr::filter(CCNR, Sex == "F")
femalesBS <- as.numeric(females$BS)
str(femalesBS)

#nicer histogram
#for females:
hist(femalesBS,col="#F8766D",ylim=c(0,15),xlim=c(2,4.5),main=NULL, xlab="Female body size (mm)", cex.lab=1.5,cex.axis=1.5)
#males:
hist(malesBS,col="#00BFC4",ylim=c(0,20),main=NULL,xlab="Male body size (mm)", cex.lab=1.5,cex.axis=1.5)

#density
ccnr<-ddply(CCNR,"Sex",summarise, BodySize.mean=mean(BS))
ggplot(CCNR, aes(x=BS, colour=Sex)) + xlab("Body size (mm)")+ geom_density()+geom_vline(data=ccnr, aes(xintercept=BodySize.mean,  colour=Sex),linetype="dashed", size=1)+ theme_classic() + theme(text=element_text(size=20))

################################For Ubin########################################
Ubin <- read.csv("PU.csv")
males <- dplyr::filter(Ubin, Sex == "M")
malesBS <- as.numeric(males$BS)
str(malesBS)
females <- dplyr::filter(Ubin, Sex == "F")
femalesBS <- as.numeric(females$BS)
str(femalesBS)

#nicer histogram
#for females:
hist(femalesBS,col="#F8766D",ylim=c(0,15),xlim=c(2,4.5),main=NULL, xlab="Female body size (mm)", cex.lab=1.5,cex.axis=1.5)
#males:
hist(malesBS,col="#00BFC4",ylim=c(0,20),xlim=c(3.2,4.4),main=NULL,xlab="Male body size (mm)", cex.lab=1.5,cex.axis=1.5)

#density
pu<-ddply(Ubin,"Sex",summarise, BodySize.mean=mean(BS))
ggplot(Ubin, aes(x=BS, colour=Sex)) + xlab("Body size (mm)")+ geom_density()+geom_vline(data=pu, aes(xintercept=BodySize.mean,  colour=Sex),linetype="dashed", size=1)+ theme_classic() + theme(text=element_text(size=20))

################################For CPM########################################
CPM <- read.csv("MYmainland.csv")
males <- dplyr::filter(CPM, Sex == "M")
malesBS <- as.numeric(males$BS)
str(malesBS)
females <- dplyr::filter(CPM, Sex == "F")
femalesBS <- as.numeric(females$BS)
str(femalesBS)

#nicer histogram
#for females:
hist(femalesBS,col="#F8766D",ylim=c(0,20),xlim=c(2.5,4.5),main=NULL, xlab="Female body size (mm)", cex.lab=1.5,cex.axis=1.5)
#males:
hist(malesBS,col="#00BFC4",ylim=c(0,20),main=NULL,xlab="Male body size (mm)", cex.lab=1.5,cex.axis=1.5)

#density
cpm<-ddply(CPM,"Sex",summarise, BodySize.mean=mean(BS))
ggplot(CPM, aes(x=BS, colour=Sex)) + xlab("Body size (mm)")+ geom_density()+geom_vline(data=cpm, aes(xintercept=BodySize.mean,  colour=Sex),linetype="dashed", size=1)+ theme_classic() + theme(text=element_text(size=20))


################################For Langkawi########################################
Langkawi <- read.csv("Langkawi.csv")
males <- dplyr::filter(Langkawi, Sex == "M")
malesBS <- as.numeric(males$BS)
str(malesBS)
females <- dplyr::filter(Langkawi, Sex == "F")
femalesBS <- as.numeric(females$BS)
str(femalesBS)

#nicer histogram
#for females:
hist(femalesBS,col="#F8766D",ylim=c(0,60),xlim=c(2.5,4.5),main=NULL, xlab="Female body size (mm)", cex.lab=1.5,cex.axis=1.5)
#males:
hist(malesBS,col="#00BFC4",ylim=c(0,30),xlim=c(3.25,4.6),main=NULL,xlab="Male body size (mm)", cex.lab=1.5,cex.axis=1.5)

#density
langkawi<-ddply(Langkawi,"Sex",summarise, BodySize.mean=mean(BS))
ggplot(Langkawi, aes(x=BS, colour=Sex)) + xlab("Body size (mm)")+ geom_density()+geom_vline(data=langkawi, aes(xintercept=BodySize.mean,  colour=Sex),linetype="dashed", size=1)+ theme_classic() + theme(text=element_text(size=20))




