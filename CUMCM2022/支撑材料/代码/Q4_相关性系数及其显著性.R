QB1111[is.na(QB1111)] <- 0
mydata <- GJ1111
mydata

pic01<-cor(mydata)
corrplot(pic01)
corrplot(pic01,col = COLOR01)
corrplot(pic01, type = "upper", order = "hclust", 
         tl.col = "black", tl.srt = 45,col=brewer.pal(n=8, name="PuOr"))

cor.mtest <- function(mat, ...) {
  mat <- as.matrix(mat)
  n <- ncol(mat)
  p.mat<- matrix(NA, n, n)
  diag(p.mat) <- 0
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      tmp <- cor.test(mat[, i], mat[, j], ...)
      p.mat[i, j] <- p.mat[j, i] <- tmp$p.value
    }
  }
  colnames(p.mat) <- rownames(p.mat) <- colnames(mat)
  p.mat
}

mydatap<- cor.mtest(mydata) 

corrplot(pic01,type = "upper", order = "hclust",tl.col = "black", tl.srt = 45,col=brewer.pal(n=8, name="PuOr"),
         p.mat=mydatap, sig.level = 0.05)
corrplot(pic01, type="upper", order="hclust", p.mat = mydatap, sig.level = 0.05)

corrplot(pic01,method="color", type="upper", order="hclust", 
         p.mat = mydatap, sig.level = 0.01)




