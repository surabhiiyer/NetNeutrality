
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)


mydata = read.csv("data/RedditData.csv")
df <- data.frame(mydata)
mach_corpus = Corpus(VectorSource(df$Title))
# create document term matrix applying some transformations
tdm = TermDocumentMatrix(mach_corpus,
                         control = list(removePunctuation = TRUE,
                                        stopwords = c("machine", "learning", stopwords("english")),
                                        removeNumbers = TRUE, tolower = TRUE))
# define tdm as matrix
m = as.matrix(tdm)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)
# plot wordcloud
wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))
