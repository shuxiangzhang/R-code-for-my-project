rep_exp<-function(directory,folder,number_of_topic,number_of_experiment){
  for(i in 1:number_of_experiment){
    random_topic_extract(directory,folder,number_of_topic)
    map(folder,number_of_topic,i)
  }
}