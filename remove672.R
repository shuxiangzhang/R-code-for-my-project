#Remove the topic 672 for each run
remove672<-function(directory){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  file<-list.files(pattern="^[inp]")
  for(j in file){
    df <- read.table(j)
    df<-subset(df,df$V1!=672)
    write.table(df, file=j, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  }
  setwd(cur)
}
