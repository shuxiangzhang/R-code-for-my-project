# Get the most reliable position for each system to generate a new rank,where i is the number of systems
newrank<-function(directory,i){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  df<-read.table('sysrel')
  SystemID<-apply(df,2,which.max)
  Position<-1:i
  f<-data.frame(SystemID,Position)
  write.table(f, file="newrank1", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}