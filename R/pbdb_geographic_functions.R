#' functions to read the shapefiles and project them to winkel tripel projection
.cache_wmap<- function (){  
wmap <- readOGR(dsn="maps/ne_110m_land.shp", layer="ne_110m_land")
wmap_wintri <- spTransform(wmap, CRS("+proj=wintri"))
wmap_wintri
}

.cache_bbox<- function (){  
bbox <- readOGR("maps/ne_110m_wgs84_bounding_box.shp", layer="ne_110m_wgs84_bounding_box")
bbox_wintri <- spTransform(bbox, CRS("+proj=wintri"))
}

.cache_countries<- function (){  
countries <- readOGR("maps/ne_110m_admin_0_countries.shp", layer="ne_110m_admin_0_countries")
countries_wintri <- spTransform(countries, CRS("+proj=wintri"))
countries_wintri
}

#'Funciton to set the general parameters for the plot
#' @details Part of this funtion uses modified code from Kristoffer Magnnuson
#' http://rpsychologist.com/working-with-shapefiles-projections-and-world-maps-in-ggplot/
#' 
#' 
.cache_theme_plot<- function (){  
# create a blank ggplot theme
theme_opts <- list(theme(panel.grid.minor = element_blank(),
                         panel.grid.major = element_blank(),
                         panel.background = element_blank(),
                         plot.background = element_rect(fill="white"),
                         panel.border = element_blank(),
                         axis.line = element_blank(),
                         axis.text.x = element_blank(),
                         axis.text.y = element_blank(),
                         axis.ticks = element_blank(),
                         axis.title.x = element_blank(),
                         axis.title.y = element_blank(), 
                         plot.title = element_text(size=22)))

p<- ggplot(bbox_wintri, aes(long,lat, group=group)) +
  
  geom_polygon(fill="black") +
  
  geom_polygon(data=countries_wintri, 
               aes(long,lat, group=group, fill=hole)) +
  
  geom_path(data=countries_wintri, 
            aes(long,lat, group=group, fill=hole), 
            color="grey50", size=0.3) +
  
  # geom_path(data=grat_wintri, aes(long, lat, group=group, fill=NULL), linetype=3, color="grey60") +
  
  coord_equal(ratio=1) +
  theme_opts +
  scale_fill_manual(values=c("white", "white"), guide="none") # remove legend
  p
}


#' 
#' 
#' read data and project using winkel tripel projection
.project_points<- function (query){
  
  latlong <- project(cbind(query$lng, query$lat), proj="+proj=wintri")
  latlong<- as.data.frame (latlong)
  names (latlong)<- c("lng", "lat")
  counts<- ddply(latlong,.(lng,lat),nrow)
  names (counts)<- c("lng", "lat", "Occurrences")
  counts
}


#' add the points to the ggplot map
.add_points<- function (points_wt, name, col="turquoise1", dir){
  
  p2<- p +  geom_point(data=points_wt, 
                     aes(lng, lat, 
                         group=NULL, fill=NULL, 
                         size=Occurrences), 
                     color=col, alpha=0.5) +
                     labs(title=name)
  p2
}



#' plot_pbdb
#' 
#' returns a global map for our query. The size of the points indicate the number of fossil records
#' @usage plot_pbdb (query, title, colour, dir)
#' 
#' @param query a query to the PBDB database, it should have lng
#' e.g. query<- pbdb_query_occurrences (limit="all", base_name="Canis", show="coords")
#' @param title it sets the title of the map and the name of the png file 
#' @param colour colour of the points in the map. Turquoise by default. 
#' @param dir directory to save the plot
#' 
#' @export 
#' @examples \dontrun{
#' ccanis<- pbdb_query_occurrences (limit="all", vocab= "pbdb", base_name="Canis", show="coords")
#' plot_pbdb (canis, "Canis",colour="red", dir="C:/Users/sara/Documents/_CIENCIAS/pbdb_paper")
#'}
#'
#'


plot_pbdb<- function (query, title, colour="turquoise1", dir){
    if (exists ("bbox_wintri")==FALSE){
      wmap_wintri<- .cache_wmap()
      bbox_wintri<- .cache_bbox ()
      countries_wintri<- .cache_countries ()
      p<- .cache_theme_plot () 
    }
    
    points_wt<- .project_points (query)
    p2<- .add_points (points_wt, title, col= colour)+
    theme(legend.key = element_rect(fill = "white"))
    
    #plot (the size of the points is the number of records in the site) 
    ggsave(plot=p2, paste (dir,"/", title, ".png", sep=""), width=12.5, height=8.25, dpi=300)
    plot (p2)
}

