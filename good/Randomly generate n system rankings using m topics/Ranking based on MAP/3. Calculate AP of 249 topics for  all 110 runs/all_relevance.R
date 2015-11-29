#find the number of relevant documents for each topics in qrels
all_relevance<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  df<-read.table("qrels.txt")
    a<-as.data.frame(table(df$V1),stringsAsFactors=F)
    f<-as.numeric(a[[1]])
  df<- subset(df, V4>0)
  df$V4[df$V4>1]<-1
  y<-group_by(df,V1)
  df<-as.data.frame(summarize(y,N=length(V4)))
  x<-data.frame(V1=f)
  df<-sqldf("select * from x left join df using (V1)")
  df$N[is.na(df$N)]<-0
  write.table(df, file="allrelevance", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}