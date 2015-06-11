# load packages 
# Step 1 
install.packages(c("devtools", "rjson", "bit64", "httr"))
#Make sure to restart your R session at this point
library(devtools)
install_github("geoffjentry/twitteR")
library(twitteR)
library(igraph) 
library(stringr)

# Step 2 
# Search for tweets containing net neutrality
# O_Auth Connection. Twitter. 
api_key <- 'k5yDi7fqxVBZ1mhmEGx2eynuY'
api_secret <- 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
access_token <- '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
access_token_secret <- '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# Search for tweets containing net neutrality
dm_tweets = searchTwitter("netneutrality", n=5000, lang="en") 
# get the tweets. 
dm_txt = sapply(dm_tweets, function(x) x$getText())

# Step 3 
# regular expressions to find retweets
grep("(RT|via)((?:\\b\\W*@\\w+)+)", dm_tweets, ignore.case=TRUE, value=TRUE)
# which tweets are retweets
rt_patterns = grep("(RT|via)((?:\\b\\W*@\\w+)+)",dm_txt, ignore.case=TRUE)
# show retweets (these are the ones we want to focus on)
dm_txt[rt_patterns] 

# Step 4 
# create list to store user names
who_retweet = as.list(1:length(rt_patterns))
who_post = as.list(1:length(rt_patterns))
# for loop
for (i in 1:length(rt_patterns))
{ 
  # get tweet with retweet entity
  twit = dm_tweets[[rt_patterns[i]]]
  # get retweet source 
  poster = str_extract_all(twit$getText(),
                           "(RT|via)((?:\\b\\W*@\\w+)+)") 
  #remove ':'
  poster = gsub(":", "", unlist(poster)) 
  # name of retweeted user
  who_post[[i]] = gsub("(RT @|via @)", "", poster, ignore.case=TRUE) 
  # name of retweeting user 
  who_retweet[[i]] = rep(twit$getScreenName(), length(poster)) 
}
# unlist
who_post = unlist(who_post)
who_retweet = unlist(who_retweet)

#Step 5
# two column matrix of edges
retweeter_poster = cbind(who_retweet, who_post)
write.csv(retweeter_poster, file = "Retweeters.csv")
# generate graph
rt_graph = graph.edgelist(retweeter_poster)
# get vertex names
ver_labs = get.vertex.attribute(rt_graph, "name", index=V(rt_graph))

#Step 6 
# choose some layout
glay = layout.fruchterman.reingold(rt_graph)
# plot
par(bg="gray15", mar=c(1,1,1,1))
plot(rt_graph, layout=glay,
     vertex.color="gray25",
     vertex.size=20,
     vertex.label=ver_labs,
     vertex.label.family="sans",
     vertex.shape="none",
     vertex.label.color=hsv(h=0, s=0, v=.95, alpha=0.5),
     vertex.label.cex=0.85,
     edge.arrow.size=0.8,
     edge.arrow.width=0.5,
     edge.width=3,
     edge.color=hsv(h=.95, s=1, v=.7, alpha=0.5))
# add title
title("\nRetweet Network for Net Neutrality",
      cex.main=1, col.main="gray95") 

# Step 7 
# another plot
par(bg="gray15", mar=c(1,1,1,1))
plot(rt_graph, layout=glay,
     vertex.color=hsv(h=.35, s=1, v=.7, alpha=0.1),
     vertex.frame.color=hsv(h=.35, s=1, v=.7, alpha=0.1),
     vertex.size=5,
     vertex.label=ver_labs,
     vertex.label.family="mono",
     vertex.label.color=hsv(h=0, s=0, v=.95, alpha=0.5),
     vertex.label.cex=0.85,
     edge.arrow.size=0.8,
     edge.arrow.width=0.5,
     edge.width=3,
     edge.color=hsv(h=.35, s=1, v=.7, alpha=0.4))
# add title
title("\nRetweet Network for Net Neutrality",
      cex.main=1, col.main="gray95", family="mono")

