#Calculate the P@10 score for each topic of each system
p10<-function(directory){
    cur<-getwd()
    setwd(file.path(getwd(),directory))
    file<-list.files(pattern="^[inp]")
    for(j in file){
        df<-read.table(j)
        df<-cbind(df,p10=df$V2/10)
        write.table(df, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    }
    setwd(cur)
}