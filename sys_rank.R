#Generate system rankings
sys_rank<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^exp")
  f<-NULL
  for(j in file){
    df<-read.table(j)
    f<-cbind(f,rank(-df$V1,ties.method="first"))
  }
  write.table(f, file='system_rankings',append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}