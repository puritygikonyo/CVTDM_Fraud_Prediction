setwd("D:/Dokumente/Studium/Master/Université de Genève/Kurse/Creating Value Through Data Mining/Project")

# Import
fraud <- fread("onlinefraud.csv")

# Missing values analysis
gg_miss_var(fraud)

print("test")
# Random sampling
set.seed(1)
simpleSample1 <- sample(c(TRUE, FALSE), nrow(fraud), replace=TRUE, prob=c(0.05,0.95))
simpleSample1 <- fraud[simpleSample1, ]

set.seed(2)
simpleSample2 <- sample(c(TRUE, FALSE), nrow(fraud), replace=TRUE, prob=c(0.05,0.95))
simpleSample2 <- fraud[simpleSample2, ]

# Systematic sampling
sysSample <- vector(length = nrow(fraud))
for (i in seq(3,nrow(fraud),20)){
  sysSample[i] <- TRUE
}
sysSample <- fraud[sysSample,]

# Stratified sampling
stratSample1 <- fraud %>%
  group_by(type) %>%
  sample_frac(size=0.05)

stratSample2 <- fraud %>%
  group_by(isFraud) %>%
  sample_n(size=sum(fraud[,"isFraud"])/2)
