#Remove the topics which has less than i documents for each run
Topicremove<-function(directory){
    cur<-getwd()
    setwd(file.path(getwd(),directory))
    invalidtopics<-read.table('invalid topics')
    invalidtopics<-invalidtopics$V1
    df <- read.table('qrels.txt')
    df<-df[!df$V1%in%invalidtopics,]
    write.table(df, file='qrels', append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    setwd(cur)
}


