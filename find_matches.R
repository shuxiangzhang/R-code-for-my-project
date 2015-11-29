# Match the input files with qrels
find_matches<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^[inp]")
  qrels<-read.table("qrels.txt")
  for(j in file){
    df <- read.table(j)
    tmp <- sqldf("select * from df left join qrels using (V1, V3)")
    tmp<-tmp[,-7]
    names(tmp)[7]<-'V7'
    tmp[is.na(tmp)] <-0
    tmp$V7[tmp$V7>1]<-1
    write.table(tmp, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  }
  setwd(cur)
}


