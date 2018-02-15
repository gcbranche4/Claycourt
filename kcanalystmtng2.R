###Getting Data into R
CSP<-`X17_Season_prices`
#view first 5 rows of data set
head(CSP)



###Initial Exploration of Data
#load library ggplot for graphing
library(ggplot2)
#creates scatterplot of Price on x, NumSeats on y. geom_point is type of mark
ggplot(CSP, aes(Price, NumSeats)) + geom_point()
#creates new scatterplot, colorcoded by Genre
ggplot(CSP, aes(Price, NumSeats, color = Genre)) + geom_point()
#set number of clusters you want
set.seed(5)
#creates cluster analysis from columns 6 and 5 of CSP data set with 5 clusters
PriceCluster <- kmeans(CSP[, 6:5], 5, nstart = 5)
##prints tables showing all occurences of each price in a given cluster
table(PriceCluster$cluster, CSP$Price)
#transforms cluster classifications into a factor
PriceCluster$cluster <- as.factor(PriceCluster$cluster)
#creates new scatterplot, colorcoded by cluster
ggplot(CSP, aes(Price, NumSeats, color = PriceCluster$cluster)) + geom_point()
#create basic scatter object (makes mods easier)
prfq<- ggplot(CSP, aes (x= Price, y= NumSeats))
#group plots by Genre
prfq + geom_point(aes(color = Genre)) + facet_wrap(~Genre)



###Focused Exploration of Data
library(plyr)
#Sum NumSeats in a Genre to create an total NumSeats sold per price in a Genre
aggregate(NumSeats ~ Price + Genre, CSP, sum)
#create object which contains aggregated price level NumSeats
TSAP<- aggregate(NumSeats ~ Price + Genre, CSP, sum) 
Aggprfq<- ggplot(TSAP, aes(x= Price, y= NumSeats))
Aggprfq + geom_point(aes(color = Genre)) + facet_wrap(~Genre)
#create trendline overlaid on scatterplot
Aggprfq + geom_smooth(aes(color = Genre)) + facet_wrap(~Genre)
Aggprfq + geom_point(aes(color = Genre))
#Sum NumSeats to create an total NumSeats sold per price across Genres
aggregate(NumSeats ~ Price, TSAP, sum)
MGSAP<-aggregate(NumSeats ~ Price, TSAP, sum)
set.seed(5)
GPCluster <- kmeans(MGSAP[, 1:2], 5, nstart = 5)
table(GPCluster$cluster, MGSAP$Price)
GPCluster$cluster <- as.factor(GPCluster$cluster)
ggplot(MGSAP, aes(Price, NumSeats, color = GPCluster$cluster)) + geom_point()
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line()



###Getting Desired Visualizations
#adds title to graph
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line() + ggtitle("Frequency of Prices Across Major Genres")
#alters scales on graph by how many ticks you want on each axis
ggplot(MGSAP, aes(Price, NumSeats)) + geom_line() + ggtitle("Frequency of Prices Across Major Genres") + scale_x_continuous(breaks = pretty(MGSAP$Price, n = 20)) + scale_y_continuous(breaks = pretty(MGSAP$NumSeats, n = 10))
#create Ballet only Price frequency
DB <- ggplot(TSAP[TSAP$Genre == "Ballet", ], aes(Price, NumSeats)) + geom_line(color="red", size=1.5)
DB + ggtitle("Frequency of Ballet Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 50))
CM <- ggplot(TSAP[TSAP$Genre == "Comedy", ], aes(Price, NumSeats)) + geom_line(color="orange", size=1.5)
CM + ggtitle("Frequency of Comedy Prices") + scale_x_continuous(breaks = pretty(TSAP$Price, n = 100)) + scale_y_continuous(breaks = pretty(TSAP$NumSeats, n = 100))
