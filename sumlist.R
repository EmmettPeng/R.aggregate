rm(list=ls())

setwd("/Users/emmett/Desktop/")

data = read.csv("test.txt", header = T, sep = "\t")

sum_list =  aggregate(data[,colnames(data)[5]] ~ Phylum, data, FUN = sum)
#sum_list = t(sum_list)

for (i in 6:126){
  sum_list_new =  aggregate(data[,colnames(data)[i]] ~ Phylum, data, FUN = sum)
  #sum_list_new = t(sum_list_new)
  sum_list = merge(sum_list, sum_list_new, by = "Phylum")
}

colnames(sum_list)[2:123] = colnames(data)[5:126]

sum_list

