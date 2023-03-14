jarvis_march_all<-function(input){
  if(class(input) == "list"){
  
	for (i in 1:length(input)) {
		if(length(input[[i]]) != 2){
			stop("Not all points have length 2")
		}
	}
	jarvis_march(input)
	
  }else if(class(input)=="numeric"){
  
  	list_of_points <- list()
  	for(i in 1:(length(input)/2)){
  	  list_of_points[i] <- list(c(input[2*i-1],input[2*i]))
  	}
  	
  	jarvis_march(list_of_points)
	
  }else if(class(input)=="data.frame"){
  
    list_of_points<-list()
    for(i in 1:nrow(input)){
      list_of_points[i] <- list(c(input[i,1],input[i,2]))
    }
	
    jarvis_march(list_of_points)
	
  }else{
	print(paste("Input was of the type", class(input),". Please input in the form of a list, vector or data.frame") )
  }
}
