#extract top n documents for each topic
doc_extract<-function(directory,n){
    cur<-getwd()
    setwd(file.path(getwd(),directory))
    file<-list.files(pattern="^[inp]")
    q<-read.table('qrels')
    a<-as.data.frame(table(q$V1),stringsAsFactors=F)
    f<-as.numeric(a[[1]])
    for(j in file){
      df <- read.table(j)
      t<-NULL
      for(i in f){
        x<-df[df$V1==i,][1:n,]
        t<-rbind(t,x)
      }
      write.table(t, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
    }
    setwd(cur)
}