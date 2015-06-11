import json
import pandas as pd
import matplotlib.pyplot as plt

tweets_data_path = 'tweet_results.json'
outfile = open('tweet_results2.json',"w") 

tweets_data = []
tweets_file = open(tweets_data_path, "r")
for line in tweets_file:
    try:
        tweet = json.loads(line)
        json.dump(line, outfile, sort_keys = True, indent = 4,
ensure_ascii=False)
        tweets_data.append(tweet)
    except:
        continue
print len(tweets_data)

# Write to a file 

# with open('tweet_results2.json', 'w') as outfile:
#      json.dump(tweet, outfile, sort_keys = True, indent = 4,
# ensure_ascii=False)

print "done writing" 