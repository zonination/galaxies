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
    theme(plot.subtitle=element_text(size=12,color="#BDBDBD", vjust=0)) +
    theme(plot.caption=element_text(size=12,color="#BDBDBD", vjust=0)) +
    theme(axis.ticks=element_blank()) +
    theme(axis.text.x=element_text(size=14,color="#BDBDBD")) +
    theme(axis.text.y=element_text(size=14,color="#BDBDBD")) +
    theme(axis.title.x=element_text(size=16,color="#BDBDBD", vjust=0)) +
    theme(axis.title.y=element_text(size=16,color="#BDBDBD", vjust=1.25))
}
