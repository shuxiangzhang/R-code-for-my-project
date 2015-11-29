# 1 Sort each run
  sorting<-function(directory){
      cur<-getwd()
      setwd(file.path(getwd(),directory))
# Or we can use setwd(paste(getwd(),directory,sep="/"))
      file<-list.files(pattern="^[inp]")
      for(i in file){
          df <- read.table(i)
# Sort the run according to V1,V5,V3
          sorted <- arrange(df,V1,desc(V5), desc(V3))
# To make column V4 start at 1    
          m<-NULL
  # (sorted<-split(sorted,sorted$V1)
  # for(j in 1:length(sorted)){
  # sorted[[j]]['V4']<-1:nrow(sorted[[j]])
  # m<-rbind(m,sorted[[j]])
  #  }) This method is inefficient
          t<-as.vector(table(sorted$V1))
          for(j in t){
              m<-c(m,1:j)
    }
          sorted['V4']<-m
          write.table(sorted, file=i, append=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)
  }
      setwd(cur)
}
