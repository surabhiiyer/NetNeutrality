install.packages("plyr")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("sentiment")
install.packages("ggplot2")

# Installing Sentiment Package can be hard. Here is what I did:
# Download the Packages from the website. 
# Install R stem first
# install.packages("/Users/surabhiravishankar/Downloads/Rstem_0.4-1.tar", repos = NULL, type="source")
# install.packages("/Users/surabhiravishankar/Downloads/sentiment_0.2.tar", repos = NULL, type="source")
# Installing Sentiment Plugin 
# install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org")

#install.packages("devtools")
#library("devtools")
#install_github("sentiment", "andrie")

library(twitteR)
library(sentiment)
library(plyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)


# O_Auth Connection. Twitter. 
api_key <- 'k5yDi7fqxVBZ1mhmEGx2eynuY'
api_secret <- 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
access_token <- '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
access_token_secret <- '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# Collect Tweets about Net Neutrality 
some_tweets = searchTwitter("netneutrality", n=5000, lang="en")
some_txt = sapply(some_tweets, function(x) x$getText())

# Sentiment Analysis 
# Preprocess the Tweets To perform sentiment analysis. 
# This consists of the following: 
# 1. Remove Retweets 
# 2. Remove People 
# 3. Remove Punctuation 
# 4. Remove Numbers 
# 5. Removing html links 
# 6. Removing spaces. 
# 7. Convert everything to a lower case. 
# 8. Replace missing values with NA
# remove retweet entities
some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
# remove at people
some_txt = gsub("@\\w+", "", some_txt)
# remove punctuation
some_txt = gsub("[[:punct:]]", "", some_txt)
# remove numbers
some_txt = gsub("[[:digit:]]", "", some_txt)
# remove html links
some_txt = gsub("http\\w+", "", some_txt)
# remove unnecessary spaces
some_txt = gsub("[ \t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)
# define "tolower error handling" function 
try.error = function(x)
{
  # create missing value
  y = NA
  # tryCatch error
  try_error = tryCatch(tolower(x), error=function(e) e)
  # if not an error
  if (!inherits(try_error, "error"))
    y = tolower(x)
  # result
  return(y)
}
# lower case using try.error with sapply 
some_txt = sapply(some_txt, try.error)
# remove NAs in some_txt
some_txt = some_txt[!is.na(some_txt)]
names(some_txt) = NULL

# Sentiment Analysis Phase
# classify emotion
class_emo = classify_emotion(some_txt, algorithm="bayes", prior=1.0)
# get emotion best fit
emotion = class_emo[,7]
# substitute NA's by "unknown"
emotion[is.na(emotion)] = "unknown"
# classify polarity
class_pol = classify_polarity(some_txt, algorithm="bayes")
# get polarity best fit
polarity = class_pol[,4]

# Create a Dataframe and obtain statistics. 
# data frame with results
sent_df = data.frame(text=some_txt, emotion=emotion, polarity=polarity, stringsAsFactors=FALSE)
# sort data frame
sent_df = within(sent_df, emotion <- factor(emotion, levels=names(sort(table(emotion), decreasing=TRUE))))

# Plot the distribution of emotions 
# plot distribution of emotions
ggplot(sent_df, aes(x=emotion)) +
  geom_bar(aes(y=..count.., fill=emotion)) +
  scale_fill_brewer(palette="Dark2") +
  labs(x="emotion categories", y="number of tweets") +
  labs(title = "Tweets about NetNeutrality: \n(classification by emotion)",plot.title = element_text(size = 12))

# plot distribution of polarity
ggplot(sent_df, aes(x=polarity)) +
  geom_bar(aes(y=..count.., fill=polarity)) +
  scale_fill_brewer(palette="RdGy") +
  labs(x="polarity categories", y="number of tweets") +
  labs(title = "Sentiment Analysis on Tweets about Net Neutrality \n ",
       plot.title = element_text(size=12))

# Seperating Tweets by Emotions and Showing a Word Cloud. 
# separating text by emotion
emos = levels(factor(sent_df$emotion))
nemo = length(emos)
emo.docs = rep("", nemo)
for (i in 1:nemo)
{
  tmp = some_txt[emotion == emos[i]]
  emo.docs[i] = paste(tmp, collapse=" ")
}

# remove stopwords
emo.docs = removeWords(emo.docs, stopwords("english"))
# create corpus
corpus = Corpus(VectorSource(emo.docs))
tdm = TermDocumentMatrix(corpus)
tdm = as.matrix(tdm)
colnames(tdm) = emos

# comparison word cloud
comparison.cloud(tdm, colors = brewer.pal(nemo, "Dark2"),
                 scale = c(3,.5), random.order = FALSE, title.size = 1.5)