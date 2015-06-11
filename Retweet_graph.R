# Create a data frame from the sender-receiver information
ats.df <- data.frame(a, at.receiver);
rts.df <- data.frame(retweeter_poster);

# Transform data frame into a graph
ats.g <- graph.data.frame(ats.df, directed=T);
rts.g <- graph.data.frame(rts.df, directed=T);

# Write sender -> receiver information to a GraphML file
print("Write sender -> receiver table to GraphML file...");
write.graph(ats.g, file="ats.graphml", format="graphml");
write.graph(rts.g, file="rts.graphml", format="graphml");


