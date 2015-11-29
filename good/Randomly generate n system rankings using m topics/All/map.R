# Calculate MAP for each system where n denotes the number of topics,k is the order of experiment
map<-function(directory,n,k){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^[inp]")
  map<-NULL
  for(i in file){
    df <- read.table(i)
    m<-sum(df$V4)/n
    map<-c(map,m)
  }
  write.table(map, file=paste('experiment',k), append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}