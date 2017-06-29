#Hierarchical Dendrogram for Agglomerative CLustering

require(ggdendro)
require(ggplot2)

theme_set(theme_classic())

#Hierarichiral Clustering in a form of Dendrogram used in Agglomerative Clustering

#dist() function used to compute distance matrix-default is 'euclidean' distance
hc <- hclust(dist(USArrests), "ave") #Agglomerative CLustering using Euclidean Distance as
#a Similarity Metric to cluster(group) data 

ggdendrogram(hc,rotate = T, size=2)
#Cities which are situated closer are clustered together
