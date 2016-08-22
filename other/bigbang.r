# Simulate some kind of explosion.
# This program will generate two plots.

# Load the only necessary library to complete this simulation:
library(ggplot2)

# Number of particles to simulate
n=200

# Simulates a vector explosion
bigbang<-data.frame("x"=rnorm(n),"y"=rnorm(n))
bigbang$dx<-bigbang$x*.1+.05*rnorm(n)
bigbang$dy<-bigbang$y*.1+.05*rnorm(n)
bigbang$speed=sqrt(bigbang$dx^2+bigbang$dy^2)
bigbang$dist=sqrt(bigbang$x^2+bigbang$y^2)

ggplot(bigbang)+
  geom_point(aes(x=x,y=y),size=1)+
  geom_segment(color="steelblue",aes(x=x,y=y,xend=x+dx,yend=y+dy),arrow=arrow(length=unit(.1,"cm")))+
  geom_point(aes(x=0,y=0),color="red",shape=3)+
  ggtitle("Particle Speeds after an Explosion")

ggplot(bigbang,aes(dist,speed))+
  geom_point(size=1)+
  geom_smooth(method=lm,se=F,formula=y~x+0,linetype=4,size=1)+
  ylab("Speed of Particle")+
  xlab("Distance of Particle from Center")+
  ggtitle("Particle Speeds after an Explosion")
