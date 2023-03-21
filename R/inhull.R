in_hull<-function(Original_Set,Test_Point,print=TRUE){
  if(class(Test_Point) == "list"){
    for (i in 1:length(Test_Point)) {
      if(length(Test_Point[[i]]) != 2){
        stop("Not all test points have length 2")
      }
    }
    list_of_points<-Test_Point
  }else if(class(Test_Point)=="numeric"){
    
    if(length(Test_Point)%%2 != 0){
      stop("Not all test points have length 2")
    }
    
    list_of_points <- list()
    for(i in 1:(length(Test_Point)/2)){
      list_of_points[i] <- list(c(Test_Point[2*i-1],Test_Point[2*i]))
    }
  }else if(class(Test_Point)=="data.frame"){
    
    list_of_points<-list()
    for(i in 1:nrow(Test_Point)){
      list_of_points[i] <- list(c(Test_Point[i,1],Test_Point[i,2]))
    }
  }else{
    stop("Test input not in the class of a list, numeric vector or data frame")
  }
  
  Hull<-jarvis_march_all(Original_Set)
  count<-0
  for( i in 1:length(Hull)){
    for(j in 1:length(list_of_points)){
      if((Hull[[i]][1]==list_of_points[[j]][1]) & ((Hull[[i]][2]==list_of_points[[j]][2]))){
        if(print==TRUE){
          print(paste("Point","(",list_of_points[[j]][1],",",list_of_points[[j]][2],")","is in the hull"))
        }
        count<-count+1
      }
    }
  }
  
  if(length(list_of_points)==count){
    if(print==TRUE){
      print("All tested points are in the Convex Hull")
    }
    return(TRUE)
  }else if((length(list_of_points)>count) & (count>0)){
    if(print==TRUE){
      print("Some tested points are in the Convex Hull")
    }
    return(FALSE)
  }else if(count == 0){
    if(print==TRUE){
      print("No tested points are in the Convex Hull")
    }
    return(FALSE)
  }else{
    print("uhhhhh somethings gone wrong")
  }
}
