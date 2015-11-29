# calculate average p@10 for each system
average_p10<-function(directory,i){
    cur<-getwd()
    setwd(file.path(getwd(),directory))
    file<-list.files(pattern="^[inp]")
    ap10<-NULL
    for(j in file){
        df<-read.table(j)
        ap10<-c(ap10,sum(df$V3)/nrow(df))
    }
    write.table(ap10, file=paste('experiment',i),append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    setwd(cur)
}