
# IFS586

Tools for creating fractas method IFS

Install with 
```
devtools::install_github("sgorka/IFS586")
```


## Examples

Pakcage contaons varius examples of fractals constructed by method IFS. 
 
First define contractions functions and probability vector
```{r, include=FALSE}
library(IFS586)
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
sierpisnki <- createIFS(f1, f2, f3, prob_vec=p)
```
The you can use overloaded function plot:
```{r}
plot(sierpisnki, n=15)

```
