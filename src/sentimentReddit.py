from textblob import TextBlob
import numpy as np
import pandas as pd
from IPython import display
import csv
import sys
reload(sys)
sys.setdefaultencoding("utf-8")

# data=[]
# a=0
# with open('RedditData.csv', 'r') as csvfile:
# 	reader = csv.DictReader(csvfile)

# 	for row in reader:
# 		line=row["Title"]
# 		# unicode(line, 'utf-8')
# 		testimonial=TextBlob(line)
# 		data.append(testimonial.sentiment.polarity)
		
# # print d
data=[]
polarity=[]
# tags=[]
# phrases=[]
classify=[]
with open('TwitterData_R.csv','r') as csvinput:
    for row in csv.DictReader(csvinput):
        print row["x"]
        line=row["x"]
       	data.append(line)
       	blob=TextBlob(line)
       	# tags.append(blob.tags)
       	# phrases.append(blob.noun_phrases)
       	# classify.append(blob.classify)
       	polarity.append(blob.sentiment.polarity)
        	

with open('TwitterData_polarity.csv', 'w') as csvoutput:
        writer = csv.writer(csvoutput)
        writer.writerows(zip(data,polarity))






