###Data Science & Big Data Analytics Chapter 3: Analytics using R
##3.1 Intro to R
#Import data using read.csv(), read.table(), read.delim()
#View first few rows of dataset heaed()
#Description of dataset summary()
#Plot scatterplot using plot() formatted x col, y col, main="insert title"
#linear regression lm()
#details of a model attributes()
#create a histogram hist() formatted col, breaks="desired number"
##3.1.2 Import data
#read.csv2() and read.delim2() allow reading data where numbers use commas
#read.delim() is for tab spaced datasets
#write columns and export to external file using write.table()
#to write columns to SQL db, use squlQuery() in RODBC package
#save plots using jpeg(), png(), pdf()
##3.1.3 Attribute and Data Types
#There are 4 types of attributes: nominal, ordinal, interval, and ratio (NOIR)
#you can use '<-' to create numerical, character, or logical variables
#determine characteristics of variable using class(), typeof()
#detemine data type of variable using is.integer() is.character()
#coerce data into new variable type as.integer() as.character()
#Vectors building block for data in R, can only consist of values in same class
  #can create character or numerical vectors
  #numerical vectors can be incolved in calculations and combined/transformed
  #can create vector of specific length to be filled later
#create matricies (2 dimension array) using array() or matrix()
#data frames provide a structure for storing and accessing several variables and potential data types
#to access specific columns in a data frame, use '$' after df name
#to discover structure of df, use function str()
#combine columns usign cbind()
#combine rows using rbind()
#build table using table() formated row variable, col variable
##3.2 Descriptive Statistics
  #correlation cor()
  #covariance cov()
  #IQR difference between first and third quarters IQR()
  #mean mean()
  #median median()
  #range range()
  #standard deviation sd()
  #variance var()
##Exploratory Data Analysis
#good data viz package is ggplot2
#determine datasets in package with data()
#3.2.2 Dirty Data
#test for missing values using is.na(), returns TRUE when value in set is missing
#to remove missing values from calc, add arguement na.rm=TRUE
#return object with incomplete cases removed na.exclude
#3.2.3 Visualizing a Single Variable
  #low volumne scatter plot plot()
  #vertical or horizonal bar chart barplot()
  #Cleveland dot plot dotchart()
  #histogram hist()
  #Density plot or continuous histogram plot(density())
  #stem and leaf plot stem()
  #rug representation (adds 1d plot to exsisting plot) rug()
#3.2.4 Examining Multiple Variables
#dotchart to visualize cyclinder + car models by MPG
  #sort by mpg cars<- mtcars[order(mtcars$mpg),]
  #group variables using factor cars$cyl<- factor(cars$cyl)
  #assign color to group cars$color[cars$cyl==4]<- "red"
  #dotchart(cars$mpg, labels=row.names(cars),cex=.7, groups= cars$cyl, main="Miles per Gallon (MPG) of Car Models \nGrouped by Cylinder", xlab= "Miles Per Gallon", color=cars$color, gcolor="black")
#barplot to vixualize multiple variables
  #create cylinder and gears table, counts<- table(mtcars$gear, mtcars$cyl)
  #barplot(counts, main="Distribution of Car Cylinder Counts and Gears", xlab="Number of Cylinders", ylab= "Counts", col=c("#0000FFFF", "#0080FFFF", "#00FFFFFF", legend = rownames(counts), beside=TRUE, args.legend=list(x="top", title = "Number of Gears"))
#3.3 Statistical Methods for Evaluation
  
