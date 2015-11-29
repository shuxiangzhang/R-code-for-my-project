#Remove the topics which has less than 1000 documents for qrels file
topic_remove_for_qrels<-function(directory){
    cur<-getwd()
    setwd(file.path(getwd(),directory))
    invalidtopics<-read.table('removed topics')
    invalidtopics<-invalidtopics$V1
    df <- read.table('qrels.txt')
    df<-df[!df$V1%in%invalidtopics,]
    write.table(df, file='qrels', append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    setwd(cur)
}


