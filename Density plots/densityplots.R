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
hist(femalesBS,col="#F8766D",ylim=c(0,15),xlim=c(2,4.5))
#males:
hist(malesBS,col="#00BFC4",ylim=c(0,20))

#density
ccnr<-ddply(CCNR,"Sex",summarise, BodySize.mean=mean(BS))
ggplot(CCNR, aes(x=BS, colour=Sex)) + xlab("Body size (mm)")+ geom_density()+geom_vline(data=ccnr, aes(xintercept=BodySize.mean,  colour=Sex),linetype="dashed", size=1)+ theme_classic() + theme(text=element_text(size=20))


