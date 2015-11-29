#Calculate AP for each topic
ap<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  # Or we can use setwd(paste(getwd(),directory,sep="/"))
  rel<-read.table('allrelevance')
  file<-list.files(pattern="^[inp]")
  for(i in file){
    df <- read.table(i)
    alltopics<-as.numeric(names(table(alltopics<-df$V1)))
    alltopics<-data.frame(V1=alltopics)
    tmp<- subset(df,df$V7>0)
    tmp["V8"]<-sequence(rle(tmp$V1)$lengths)
    tmp['V9']<-tmp$V8/tmp$V4
    dt<- data.table(tmp)
    test<-dt[,list(P=sum(V9)), by=V1]
    p<-arrange(as.data.frame(test),V1)
    p<-sqldf("select * from alltopics left join p using (V1)")
    p$P[is.na(p$P)]<-0
    relevance<-subset(rel,rel$V1%in%p$V1)    
    p['rel']<-relevance$V2
    p['ap']<-p$P/p$rel
    write.table(p, file=i, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  }
  setwd(cur)
}