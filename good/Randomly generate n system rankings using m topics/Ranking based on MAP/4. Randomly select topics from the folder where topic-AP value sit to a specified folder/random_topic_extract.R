#Random extract n topics from all the topics
random_topic_extract<-function(directory,folder,n){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^[inp]")
  q<-read.table('qrels.txt')
  a<-as.data.frame(table(q$V1),stringsAsFactors=F)
  f<-as.numeric(a[[1]])
  tp<-sample(f,n)
  for(j in file){
    df <- read.table(j)
    d<-NULL
    for(i in tp){
      d<-rbind(d,subset(df,V1==i))
    }
    setwd(file.path(cur,folder))
    write.table(d, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    setwd(file.path(cur,directory))  
  }
  setwd(cur)
}