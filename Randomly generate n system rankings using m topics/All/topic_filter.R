# Retrun the names of the topics which has less than 1000 documents in any runs
topic_filter<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^[inp]")
  invalidtopics<-NULL
  for(j in file){
    df <- read.table(j)
    a<-df$V1
    a<-table(a)
    x<-as.numeric(names(a))
    y<-as.numeric(a)
    m<-data.frame(x,y)
    m<-subset(m,y!=1000)
    invalidtopics<-c(invalidtopics,m$x)
  }
  invalidtopics<-invalidtopics[!duplicated(invalidtopics)]
  write.table(invalidtopics, file='removed topics', append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}


