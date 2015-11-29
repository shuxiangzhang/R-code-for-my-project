# Get the most reliable position for each system to generate a new rank,where i is the number of systems
   new_rank<-function(directory,i){
       cur<-getwd()
       setwd(file.path(getwd(),directory))
       df<-read.table('sysrel')
       Position<-apply(df,1,which.max)
       SystemID<-1:i
       f<-data.frame(SystemID,Position)
       write.table(f, file="newrank", append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
       setwd(cur)
    }