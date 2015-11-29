# Calculate each system's reliability against each position，where n is the number of systems, m is the number of experiment
sys_reliability<-function(directory,n,m){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  df<-read.table('system_rankings')
  fn<-NULL
  for(i in 1:n){
    x<-as.numeric(df[i,])
    r<-NULL
    k<-0.5
    for(j in 1:n){
      occ<-length(x[x==j])
      dfsum<-sum(abs(x-j))
      r<-c(r,(occ+k)/((m+dfsum)+k))
    }
    fn<-rbind(fn,r)
  }
  write.table(fn, file="system_reliability", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}
