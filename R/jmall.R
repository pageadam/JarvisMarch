jarvis_march_all<-function(input,plot=FALSE){
  if(class(input) == "list"){
    
    for (i in 1:length(input)) {
      if(length(input[[i]]) != 2){
        stop("Not all points have length 2")
      }
    }
    output<-jarvis_march(input)
    if(plot==TRUE){
      require(rlang)
      require(ggplot2)
      X=c()
      Y=c()
      for (i in 1:length(input)) {
        X[i] = input[[i]][1]
        Y[i] = input[[i]][2]
      }
      df=data.frame(X, Y)
      p = ggplot(df,aes(x=X,y=Y)) + geom_point()
      hullX=c()
      hullY=c()
      for (i in 1:length(output)) {
        hullX[i] = output[[i]][1]
        hullY[i] = output[[i]][2]
      }
      hullX[length(output)+1] = output[[length(output)]][3] ; hullY[length(output)+1] = output[[length(output)]][4]
      df2 = data.frame(hullX, hullY)
      hullplot = p + geom_point(df2,mapping=aes(x=hullX,y=hullY),color="red") + geom_path(df2,mapping=aes(x=hullX,y=hullY),colour="red")    
      print(hullplot)
    }
    output
  }else if(class(input)=="numeric" | class(input)=="integer"){
    
    if(length(input)%%2 != 0){
      stop("Not all points have length 2")
    }
    
    list_of_points <- list()
    for(i in 1:(length(input)/2)){
      list_of_points[i] <- list(c(input[2*i-1],input[2*i]))
    }
    
    output<-jarvis_march(list_of_points)
    if(plot==TRUE){
      require(rlang)
      require(ggplot2)
      X=c()
      Y=c()
      for (i in 1:length(list_of_points)) {
        X[i] = list_of_points[[i]][1]
        Y[i] = list_of_points[[i]][2]
      }
      df=data.frame(X, Y)
      p = ggplot(df,aes(x=X,y=Y)) + geom_point()
      hullX=c()
      hullY=c()
      for (i in 1:length(output)) {
        hullX[i] = output[[i]][1]
        hullY[i] = output[[i]][2]
      }
      hullX[length(output)+1] = output[[length(output)]][3] ; hullY[length(output)+1] = output[[length(output)]][4]
      df2 = data.frame(hullX, hullY)
      hullplot = p + geom_point(df2,mapping=aes(x=hullX,y=hullY),color="red") + geom_path(df2,mapping=aes(x=hullX,y=hullY),colour="red")    
      print(hullplot)
    }
    output
    
    
  }else if(class(input)=="data.frame"){
    
    list_of_points<-list()
    for(i in 1:nrow(input)){
      list_of_points[i] <- list(c(input[i,1],input[i,2]))
    }
    
    output<-jarvis_march(list_of_points)
    if(plot==TRUE){
      require(rlang)
      require(ggplot2)
      X=c()
      Y=c()
      for (i in 1:length(list_of_points)) {
        X[i] = list_of_points[[i]][1]
        Y[i] = list_of_points[[i]][2]
      }
      df=data.frame(X, Y)
      p = ggplot(df,aes(x=X,y=Y)) + geom_point()
      hullX=c()
      hullY=c()
      for (i in 1:length(output)) {
        hullX[i] = output[[i]][1]
        hullY[i] = output[[i]][2]
      }
      hullX[length(output)+1] = output[[length(output)]][3] ; hullY[length(output)+1] = output[[length(output)]][4]
      df2 = data.frame(hullX, hullY)
      hullplot = p + geom_point(df2,mapping=aes(x=hullX,y=hullY),color="red") + geom_path(df2,mapping=aes(x=hullX,y=hullY),colour="red")    
      print(hullplot)
    }
    output
    
  }else{
    stop("Input not in the class of a list, numeric vector or data frame")
  }
}
