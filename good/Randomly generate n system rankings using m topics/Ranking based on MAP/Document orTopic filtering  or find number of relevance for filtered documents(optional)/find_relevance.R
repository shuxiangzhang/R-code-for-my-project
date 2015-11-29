#find the number of relevant documents for each topic
find_relevance<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
file<-list.files(pattern="^[inp]")
for(j in file){
  df <- read.table(j)
  a<-as.data.frame(table(df$V1),stringsAsFactors=F)
  f<-as.numeric(a[[1]])
  df<- subset(df, V7>0)
  y<-group_by(df,V1)
  R.count<-as.data.frame(summarize(y,n=length(V7)))
  # Add the missing topic id for which there is no relevant document
  x<-data.frame(V1=f)
  # Note that I put R.count in single quote,otherwise error will 
  # occur, This is because Dot is an operator in SQL, not a legal 
  # character in a name,or (rename it to some name that has no dot in it)
  test<-sqldf("select * from x left join 'R.count' using (V1)")
  test$n[is.na(test$n)]<-0
  write.table(test, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
   }
setwd(cur)
}
