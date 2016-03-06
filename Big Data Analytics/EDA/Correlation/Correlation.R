# Prerequisites
# 
# The rquery.cormat function requires the installation of corrplot package. Before proceeding, install it using he following R code :
#   
install.packages("corrplot")
#To use the rquery.cormat function, you can source it as follow :
  
source("C:/Users/Irene/Documents/GitHub/R-Analytics/Big Data Analytics/EDA/Correlation/rquery_cormat.r")
# Example of data
# 
# The mtcars data is used in the following examples :
  
mydata <- mtcars[, c(1,3,4,5,6,7)]
head(mydata)
#Computing the correlation matrix
rquery.cormat(mydata)
# 
# The result of rquery.cormat function is a list containing the following components :
#   
#   r : The table of correlation coefficients
# p : Table of p-values corresponding to the significance levels of the correlations
# sym : A representation of the correlation matrix in which coefficients are replaced by symbols according to the strength of the dependence. For more description, see this article: Visualize correlation matrix using symnum function
# 
# In the generated graph, negative correlations are in blue and positive ones in red color.

#Upper triangle of the correlation matrix
rquery.cormat(mydata, type="upper")

# Full correlation matrix
rquery.cormat(mydata, type="full")

#Change the colors of the correlogram
col<- colorRampPalette(c("blue", "white", "red"))(20)
cormat<-rquery.cormat(mydata, type="full", col=col)

# Draw a heatmap
cormat<-rquery.cormat(mydata, graphType="heatmap")

# To calculate the correlation matrix without plotting the graph, you can use the following R script :

rquery.cormat(mydata, graph=FALSE)

# Format the correlation table
# 
# The R code below can be used to format the correlation matrix into a table of four columns containing :
#   
#   The names of rows/columns
# The correlation coefficients
# The p-values
# For this end, use the argument : type="flatten"

rquery.cormat(mydata, type="flatten", graph=FALSE)
