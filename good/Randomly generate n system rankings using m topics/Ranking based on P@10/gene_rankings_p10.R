# Generate the specified number of rankings and calculate reliability for each system against each rank
generankings<-function(directory,folder,n,m,k){
  for(i in 1:n){
    RTopicextract(directory,folder,m)
    findrelevance(folder)
    p10(folder)
    ap10(folder,i)
  }
  srank(folder)
  reliability(folder,k,n)
}