library(plyr)
library(dplyr)
library(ggplot2)

createIFS <- function(..., prob_vec) {
  
  func <- list(...)
  if(length(func)!=length(prob_vec)) {
    
    stop("err")
  }
  
  functions <- list(func, prob_vec)
  class(functions) <- "IFS_S3"
  
  return(functions)
}



createPoints <- function(functions, point = c(0,0), n){
  
  if(class(functions) != "IFS_S3"){
    
    stop("err")
  }
  
  no_func <- length( functions[[1]] )
  points <- data.frame(x = point[1],
                     y = point[2], col=1)
  
  
  for(i in 1:n){
    
    new_points <- t(mapply(function(x, y, col){
      
      prob <- runif(1)
      prob_test <- 0
      
      for( j in 1:length( functions[[2]]) ){
        
        prob_test <- prob_test + functions[[2]][[j]]
        
        if(prob<=prob_test){
          
         break()
          
          #return(functions[[1]][[j]](x,y))
        }
      }
      
      return(c(functions[[1]][[j]](x,y), j))
    },
    x = points$x, y = points$y))
    
    new_points <- data.frame(x = new_points[,1], y = new_points[,2], col = new_points[,3])
    
    points <- rbind(points, new_points)
    
  }
  
  return(points)
}

callFunction <- function(x,y){
  
  prob <- runif(1)
  prob_test <- 0
  
  for( j in 1:length( functions[[2]]) ){
    
    prob_test <- prob_test + functions[[2]][[j]]
    
    if(p <= prob_test){
     
       #break()
      
      return(data[[1]][[j]](x,y))
    }
  }
  
  return(data[[1]][[j]](x,y))
}

plot.IFS_S3 <- function(IFS,point=c(0,0), n) {
  
  data <- createPoints(IFS,point,n)
  
  p <- ggplot(data, aes(x,y, color=col, group=col)) + geom_point(size=0.25) +  
    theme(
      panel.background = element_rect(fill='white'),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.minor.y = element_blank(),
      axis.text.x=element_blank(),
      axis.text.y=element_blank(),
      axis.line=element_blank(),
      axis.ticks=element_blank(),
      axis.title.x=element_blank(),
      axis.title.y=element_blank()
    )
  return(p)
  
}


f1<-function(x,y){
  x<-0.5*x - 0.5
  y<-0.5*y + 0.5
  return(c(x,y))
}

f2<-function(x,y){
  x<-0.5*x - 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

f3<-function(x,y){
  x<-0.5*x + 0.5
  y<-0.5*y - 0.5
  return(c(x,y))
}

p<-c(0.3333, 0.3333, 0.3334)

po <- c(0,0)

tmp<-createIFS(f1, f2, f3, prob_vec=p)

tmp

pkty <- createPoints(tmp, n=10)

pkty

plot.IFS_S3(tmp, n=15)

