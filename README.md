# Beetle_KaiXin_SexualSizeDimorphism

Hi welcome!

This repo is created by Toh Kai Xin, MSc student during AY2019/20 - AY2020/21, who is working on Condition dependent expression of sexual size dimorphism in Onthophagus cf. babirussa.

In the main folder:
1. Box plot to compare female and male body size to determine SSD in O. cf. babirussa across Malaysian (MY) populations: Langkawi, Central Peninsula MY and Singapore(SG) population: Pulau Ubin and CCNR.
Codes are named "boxplot_SSD.R"
Output/graph is named "plot_SSD.pdf"

In the "Kruskal-Wallis test" folder:
2. Kruskal-Wallis test to determine if there is a significant difference between male and female body sizes for the populations. I'm using this test because Body Size is a continuous variable and my other variables (sex,population,country) are categorical = ANOVA BUT my data is not normal --> therefore, the non-parametric test equivalent is Kruskal wallis. http://blog.minitab.com/blog/understanding-statistics/data-not-normal-try-letting-it-be-with-a-nonparametric-hypothesis-test
I also conducted the post hoc test: Dunn test with referecne to: https://rcompanion.org/handbook/F_08.html to determine which population differ with one another.
The file is name "KruskalWallis_SSD.R"


In the "Density plots" folder:
3. Density plots and histograms for body size for males and females of each  population. (included in my thesis' Appendix) 