# Calculate each system's reliability against each position，where n is the number of systems, m is the number of experiment
reliability<-function(directory,n,m){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  df<-read.table('sysrank')
  fn<-NULL
  for(i in 1:n){
    x<-as.numeric(df[i,])
    r<-NULL
    for(j in 1:n){
      occ<-length(x[x==j])
      dfsum<-sum(abs(x-j))
      r<-c(r,(occ+1)/(m+dfsum))
    }
    fn<-rbind(fn,r)
  }
  write.table(fn, file="sysrel", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}
