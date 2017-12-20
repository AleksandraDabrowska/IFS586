
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

plot(tmp, n=15)



#-----------------
# sierpinski differences
#http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.403.2843&rep=rep1&type=pdf
f1<-function(x,y){
  x <- 175*x/500*x/500 + 75*x/500 + 100
  y <- 175*y/500*y/500 + 75*y/500 + 220
  return(c(x,y))
}

f2<-function(x,y){
  x <- 175*x/500*x/500 + 75*x/500 + 200
  y <- 175*y/500*y/500 + 75*y/500 + 50
  return(c(x,y))
}

f3<-function(x,y){
  x <- 175*x/500*x/500 + 75*x/500 + 50
  y <- 175*y/500*y/500 + 75*y/500 + 50
  return(c(x,y))
}

p<-c(0.3333, 0.3333, 0.3334)



tmp<-createIFS(f1, f2, f3, prob_vec=p)
plot_IFS_S3(tmp, n=15)


#

f1<-function(x,y){
  x <- 1/sqrt(2)*(cos(45)*x - sin(45)*y)
  y <- 1/sqrt(2)*(sin(45)*x + cos(45)*y)
  return(c(x,y))
}

f2<-function(x,y){
  x <- 1/sqrt(2)*(cos(135)*x - sin(135)*y) + 1
  y <- 1/sqrt(2)*(sin(135)*x + cos(135)*y)
  return(c(x,y))
}

p<-c(0.5, 0.5)



tmp<-createIFS(f1, f2, prob_vec=p)
plot_IFS_S3(tmp, n=15, point = c(0,1))


#=====================

f1 <- function(x,y) {
  x <- 0.08*x + 0.11*y + 0.075
  y <- 0.02*x - 0.59*y - 0.6
  return(c(x,y))
}
f2 <- function(x,y) {
  x <- 0.308*x + 0.312*y + 0.043
  y <- -0.29*x + 0.31*y - 0.26
  return(c(x,y))
}
f3 <- function(x,y) {
  x <- -0.29*x + 0.3*y + 0.05
  y <- -0.29*x + 0.3*y - 0.34
  return(c(x,y))
}
f4 <- function(x,y) {
  x <- 0.764*x + 0.197*y + 0.077
  y <- -0.38*x + 0.401*y - 0.48
  return(c(x,y))
}
f5 <- function(x,y) {
  x <- 0.201*x + 0.25*y - 0.02
  y <- -0.24*x + 0.25*y - 0.74
  return(c(x,y))
}

p <-c(0.24, 0.18, 0.18, 0.24, 0.16)
tmp<-createIFS(f1, f2, f3, f4, f5, prob_vec=p)
plot_IFS_S3(tmp, n=15 )



