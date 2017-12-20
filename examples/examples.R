
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

plot_IFS_S3(tmp, n=15)
