# coding: utf-8
get_ipython().magic(u'run t.py')
get_ipython().magic(u'run t.py')
get_ipython().magic(u'run parse_json.py')
f = open("bhavita.txt","r+")
str = f.read()
print str
json_string = str
value = json.loads(json_string)
value = json.loads(json.loads(s.replace("\'", '"'));)
value = (json.loads(str.replace("\'", '"')))
ast.literal_eval(str)
get_ipython().magic(u'run bhavita_search.py')
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import tweepy
import time
ckey ='k5yDi7fqxVBZ1mhmEGx2eynuY'
csecret = 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
atoken = '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
asecret = '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
auth = tweepy.OAuthHandler(ckey, csecret)
auth.set_access_token(atoken, asecret)
api = tweepy.API(auth, parser=tweepy.parsers.JSONParser())
results = api.search(q='netneutrality',since='2015-05-15',until='2015-05-25', count=20)
print results.keys()
print results[statuses][1]
print results["statuses"][1]
print results["statuses"][2]
print results["statuses"][1]["name"]
print results["statuses"][1].text
print results["statuses"][1]
ast.literal_eval
import ast
NameError: name 'ast' is not defined
ast.literal_eval(str)
import twitter
def find_popular_tweets(twitter_api, statuses, retweet_threshold=3):
    return [ status
                    for status in statuses 
                        if status['retweet_count'] > retweet_threshold ]
def oauth_login():
    CONSUMER_KEY = 'k5yDi7fqxVBZ1mhmEGx2eynuY'
    CONSUMER_SECRET = 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
    OAUTH_TOKEN = '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
    OAUTH_TOKEN_SECRET = '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
    auth = twitter.oauth.OAuth(OAUTH_TOKEN, OAUTH_TOKEN_SECRET,
                                   CONSUMER_KEY, CONSUMER_SECRET)
      twitter_api = twitter.Twitter(auth=auth)
    return twitter_api
def oauth_login():
    CONSUMER_KEY = 'k5yDi7fqxVBZ1mhmEGx2eynuY'
    CONSUMER_SECRET = 'IEHDeKR5RovxhAucdoC95XkglFGD3S3eoJ85ihsUFqasylVGiZ'
    OAUTH_TOKEN = '3025925741-NQKmfOWpc03jjwa7iOJUEd2vwlg6X72UN3Qh6q7'
    OAUTH_TOKEN_SECRET = '1Hy1401FdKTJ3ZbYlEArBjLSGlesw6PklgbBgmsQFk58I'
    auth = twitter.oauth.OAuth(OAUTH_TOKEN, OAUTH_TOKEN_SECRET,
                                   CONSUMER_KEY, CONSUMER_SECRET)
    twitter_api = twitter.Twitter(auth=auth)
    return twitter_api
q = "netneutrality"
twitter_api = oauth_login()
import json
import pandas as pd
import matplotlib.pyplot as plt
tweets_data_path = 'tweet_results.json'
tweets_data = []
tweets_file = open(tweets_data_path, "r")
for line in tweets_file:
        try:
                tweet = json.loads(line)
                tweets_data.append(tweet)
            except:
                    continue
        print len(tweets_data)
        
tweets = pd.DataFrame()
len(tweets)
len(tweets_data)
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'cd ')
vim tweet_parser.py
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'run tweet_parser.py')
get_ipython().magic(u'run tweet_parser.py')
new_df = pd.DataFrame(tweets_data)
new_df.to_csv('tweet_results.csv')
new_df.to_csv('tweet_results.csv',sep='\t', encoding='utf-8')
tweets = pd.DataFrame()
tweets['text'] = map(lambda tweet: tweet['text'], tweets_data)
tweets.to_csv('tweet_results_text.csv',sep='\t', encoding='utf-8')
tweets['source'] = map(lambda tweet: tweet['source'], tweets_data)
tweets
tweets['source'].mode
tweets.mode
tweets[1]
tweets['created-at'] = map(lambda tweet: tweet['created-at'], tweets_data)
tweets['created_at'] = map(lambda tweet: tweet['created_at'], tweets_data)
tweets['created_at']
tweets['hashtags'] = map(lambda tweet: tweet['entities']['hashtags'], tweets_data)
tweets['hastags']
tweets['hashtags'] 
tweets['hashtags'][0]
tweets['hashtags'] = map(lambda tweet: tweet['entities']['hashtags']['text'], tweets_data)
tweets[1]
print tweets[1]
print tweets[:1]
tweets['favorite_count'] = map(lambda tweet: tweet['favorite_count'], tweets_data)
tweets['in_reply_to_status_id'] = map(lambda tweet: tweet['in_reply_to_status_id'], tweets_data)
tweets['in_reply_to_user_id'] = map(lambda tweet: tweet['in_reply_to_user_id'], tweets_data)
tweets['lang'] = map(lambda tweet: tweet['lang'], tweets_data)
tweets['retweet_count'] = map(lambda tweet: tweet['retweet_count'], tweets_data)
tweets['withheld_in_countries'] = map(lambda tweet: tweet['withheld_in_countries'], tweets_data)
tweets[:1]
df.to_csv(file_name, sep='\t', encoding='utf-8')
tweets.to_csv(tweets_results_relevent.csv, sep='\t', encoding='utf-8')
tweets.to_csv('tweets_results_relevent.csv', sep='\t', encoding='utf-8')
get_ipython().magic(u'save tweets_my_useful_session.py 1-94')
