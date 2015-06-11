library(devtools)
install_github("twitteR", username="geoffjentry")
library(twitteR)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)
api_key <- 'k5yDi7fqxVBZ1mhmEGx2eynuY'
api_secret <- 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
access_token <- '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
access_token_secret <- '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
mach_tweets = searchTwitter("Net Neutrality", n=1500, lang="en")
match_texts = sapply(mach_tweets, function(x) x$getTexts())
# create a corpus
mach_corpus = Corpus(VectorSource(mach_text))
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
