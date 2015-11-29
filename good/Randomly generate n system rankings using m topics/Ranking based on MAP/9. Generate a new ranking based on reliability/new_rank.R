# Get the most reliable position for each system to generate a new rank,where i is the number of systems
new_rank<-function(directory,i){
  cur<-getwd()
  setwd(file.path(getwd(),directory))
  df<-read.table('system_reliability')
  Position<-apply(df,1,which.max)
  SystemID<-1:i
  f<-data.frame(SystemID,Position)
  # Check for the systems with duplicate rankings
  # Rerank the systems with duplicate rankings using their relative reliability values
  # To deal with the ties in reliability values we assume that the values which come first have higher ranking
  for( p in f$Position){
    n<-which(p==f$Position)
    if (length(n)>1){
         m<-NULL
         for(x in n){
            m<-c(m,df[x,p])
         }
        r=data.frame(n,m)
        r1=r[order(r$m,decreasing=TRUE),]
        q<-0
        for(x in r1$n){
          f[x,2]=p+q
          q<-q+1
        }
     }
  }
  write.table(f, file="new_rank", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  setwd(cur)
}