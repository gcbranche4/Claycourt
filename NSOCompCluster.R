Crank<-NSO_Composer_data
##Name data set
head(Crank)
##Returns first few rows of data set
library(ggplot2)
##loads ggplot library for graphing
ggplot(Crank, aes(Singtix, Substix)) + geom_point()
##creates scatterplot of Singtix on x, Substix on y. geom_point is type of mark
set.seed(5)
##set number of clusters you want
CompCluster <- kmeans(Crank[, 3:4], 5, nstart = 5)
##creates cluster analysis from columns 3 and 4 of Crank data set with 5 clusters
table(CompCluster$cluster, Crank$Composer)
##prints tables showing all occurences of each composer in a given cluster
CompCluster$cluster <- as.factor(CompCluster$cluster)
##transforms cluster classifications into a factor
ggplot(Crank, aes(Singtix, Substix, color = CompCluster$cluster)) + geom_point()
##creates new scatterplot, colorcoded by cluster
getwd()
##tells you where files are read from
