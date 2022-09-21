wilcox_test <- wilcox.test(value~group, SrO, paired = FALSE, alternative = 'two.sided')
wilcox_test
wilcox_test$p.value
i=12
p_value[i] <- wilcox_test$p.value
W[i] <-wilcox_test$statistic

library(ggpubr)

ggpaired(SiO2, cond1 = "铅钡", cond2 = "高钾",
         fill = "condition", palette = "jco")

colnames(SiO2) <- c("铅钡","高钾")

