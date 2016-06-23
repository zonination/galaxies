#Set working directory, open files, fire up the libraries
setwd("~/Dropbox/R/Star Catalog")
galaxies <- read.csv("galaxies.csv", na.strings="-")
library(ggplot2)

z_theme <- function() {
  theme_bw(base_size=9) +
    #Background and Grid formatting
    theme(panel.background=element_rect(fill="#000000", color="#000000")) +
    theme(plot.background=element_rect(fill="#000000", color="#000000")) +
    theme(panel.border=element_rect(color="#252525")) +
    theme(panel.grid.major=element_blank()) +
    theme(panel.grid.minor=element_blank()) +
    #Legend formatting
    theme(legend.background = element_rect(fill="#000000")) +
    theme(legend.text = element_blank()) +
    theme(legend.title= element_blank())+
    theme(legend.position="none")+
    #Axis & Title Formatting
    theme(plot.title=element_text(color="#D9D9D9", size=20, vjust=1.25)) +
    theme(axis.ticks=element_blank()) +
    theme(axis.text.x=element_text(size=14,color="#BDBDBD")) +
    theme(axis.text.y=element_text(size=14,color="#BDBDBD")) +
    theme(axis.title.x=element_text(size=16,color="#BDBDBD", vjust=0)) +
    theme(axis.title.y=element_text(size=16,color="#BDBDBD", vjust=1.25))
}

#Calculate the hubble constant. Set the Y intercept to 0.
print(lm(velocitykms~0+distancempc,data=galaxies))
# Hubble constant = 72.65 (km/sec)/Mpc
# The reciprocal of the Hubble Constant is the age of the universe:
# print((72.65/3.086e19)^-1 /(60*60*24*365.25))
# 13.46 billion years as the universe's age, not terribly far off.

# Final Plot
# Recommended Size = 900 x 600
galaxies$randomseed<-runif(nrow(galaxies),min=0,max=2*pi)
  ggplot(galaxies,aes(distancempc,velocitykms))+
  geom_point(size=.5,shape=".",aes(color=velocitykms))+
  geom_smooth(method="lm",se=F,color="blue",linetype=3,formula=y~0+x)+
  scale_color_gradientn(colours=c("white","orange","red","darkred"))+
  ylab("Velocity (km/sec)")+
  xlab("Distance (Mpc)")+
  ggtitle("Galaxy Redshift")+
  scale_y_continuous(limits=c(0,15000))+
  scale_x_continuous(limits=c(0,200))+
  z_theme()
