#Set working directory, open files, fire up the libraries
# setwd("~/Dropbox/R/Star Catalog")
galaxies <- read.csv("galaxies.csv")
source("z_theme.R")
library(ggplot2)

# Convert Distance Modulus to MegaParsecs
galaxies$distmpc<-10^(1+galaxies$mod0/5)/1e6
# Convert Parsecs to Kilometers
galaxies$dist<-galaxies$distmpc*3.085678e+13*1e6

# Use close galaxies for our estimation
# galaxies2<-subset(galaxies,vgsr<=15000)
galaxies2<-subset(galaxies,distmpc<=250&vgsr<=15000)

ggplot(galaxies2,aes(distmpc,vgsr))+
  geom_point(shape=".",aes(color=vgsr))+
  scale_color_gradientn(colours=c("white","orange","red","darkred"))+
  geom_smooth(method=lm,formula=y~x+0,linetype=4,size=.5,se=F)+
  # scale_x_continuous(limits=c(0,6.15e21))+
  # scale_y_continuous(limits=c(-500,15000))+
  labs(title="The Expanding Universe",
       subtitle="The slope of this line is equal to 13.77 billion years",
       x="Distance from Earth (MPc)",
       y="Velocity Away from Earth (km/s)",
       caption="created by /u/zonination")+
  z_theme()
ggsave("galaxies.png",dpi=100, height=6, width=9, type="cairo-png")

# Accepted value for Age of Universe:
accage<-13.799e9 # Years

# Calculate the age of the universe:
calcage<-lm(dist~vgsr+0,data=galaxies2)$coefficients[1]/60/60/24/365.24
paste("Age of Universe:",signif(calcage,5),"years")
paste("Relative Error from accepted Age: ",
            signif(100*(calcage-accage)/accage,5)
            ,"%",sep="")