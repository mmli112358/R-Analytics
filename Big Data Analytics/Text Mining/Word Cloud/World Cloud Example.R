######################
# Required R packages#
######################
# The following packages are required for the rquery.wordcloud() function :
#   
#   tm for text mining
# SnowballC for text stemming
# wordcloud for generating word cloud images
# RCurl and XML packages to download and parse web pages
# RColorBrewer for color palettes
# Install these packages, before using the function rquery.wordcloud, as follow :
  
install.packages(c("tm", "SnowballC", "wordcloud", "RColorBrewer", "RCurl", "XML"))

#############################################
# Create a word cloud from a plain text file#
#############################################
# Plain text file can be easily created using your favorite text editor (e.g : Word). "I have a dream speech" (from Martin Luther King) is processed in the following example but you can use any text you want :
#   
#   Copy and paste your text in a plain text file
# Save the file (e.g : ml.txt)
# Generate the word cloud using the R code below :


source('C:/Users/Irene/Documents/GitHub/R-Analytics/Big Data Analytics/Text Mining/Word Cloud/rquery_wordcloud.r')
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
res<-rquery.wordcloud(filePath, type ="file", lang = "english")

# Change the arguments max.words and min.freq to plot more words :
#   
#   max.words : maximum number of words to be plotted.
# min.freq : words with frequency below min.freq will not be plotted

res<-rquery.wordcloud(filePath, type ="file", lang = "english",min.freq = 1,  max.words = 200)

#####################################
# Change the color of the word cloud#
#####################################
# The color of the word cloud can be changed using the argument colorPalette.
# 
# Allowed values for colorPalete :
#   
#   a color name (e.g.: colorPalette = "blue")
# a color code (e.g.: colorPalette = "#FF1425")
#               a name of a color palette taken from RColorBrewer package (e.g.: colorPalette = "Dark2")
#               The color palettes associated to RColorBrewer package are shown below :

# Reds color palette
res<-rquery.wordcloud(filePath, type ="file", lang = "english",colorPalette = "Reds")

# RdBu color palette
res<-rquery.wordcloud(filePath, type ="file", lang = "english",colorPalette = "RdBu")

# use unique color
res<-rquery.wordcloud(filePath, type ="file", lang = "english",colorPalette = "black")


##########################################################
# Operations on the result of rquery.wordcloud() function#
##########################################################

# As mentioned above, the result of rquery.wordcloud() is a list containing two objects :
#   
#   tdm : term-document matrix
# freqTable : frequency table

tdm <- res$tdm
freqTable <- res$freqTable

# Frequency table of words
# 
# The frequency of the first top10 words can be displayed and plotted as follow :

# Show the top10 words and their frequency
head(freqTable, 10)

# Bar plot of the frequency for the top10
barplot(freqTable[1:10,]$freq, las = 2, 
        names.arg = freqTable[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")

# Operations on term-document matrix
# 
# You can explore the frequent terms and their associations. In the following example, we want to identify words that occur at least four times :
findFreqTerms(tdm, lowfreq = 4)
# You could also analyze the correlation (or association) between frequent terms. The R code below identifies which words are associated with "freedom" in I have a dream speech :
findAssocs(tdm, terms = "freedom", corlimit = 0.3)

###################################
#Create a word cloud of a web page#
###################################

# In this section we'll make a tag cloud of the following web page :
#   
#   http://www.sthda.com/english/wiki/create-and-format-powerpoint-documents-from-r-software

url = "http://www.sthda.com/english/wiki/create-and-format-powerpoint-documents-from-r-software"
rquery.wordcloud(x=url, type="url")
