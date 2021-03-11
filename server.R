
library(shiny)
library(shinythemes)
library(readxl)
library(ggplot2)
library(viridis)
data3 <- read_excel("data3.xlsx")

sexdata <- read_excel("sexdata.xlsx")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Plot <- renderPlot({
 
        b= input$var2
        
        if (b=="sex"){
            ggplot(sexdata, aes_string(x=b,y= "mortality_sex"))+
                geom_bar(stat = "identity",position = "dodge",aes(fill=(Data_Source2)))+
                scale_fill_brewer(palette = "Pastel2")
             
            
            
            
        }else if (b=="division"){
            ggplot(sexdata, aes_string(x=b,y= "mortality_division"))+
                geom_bar(stat = "identity",position = "dodge",aes(fill=factor(Data_Source)))+
                scale_color_viridis(discrete = TRUE, begin = 0, end = 1, direction = 1,option = "A")+
                scale_fill_viridis(discrete = TRUE,begin = 0, end = 1, direction = 1,option = "D")
        }else {
            ggplot(sexdata, aes_string(x=b,y= "mortality_residence"))+
                geom_bar(stat = "identity",position = "dodge",aes(fill=(Data_Source2)))+
                scale_fill_brewer(palette = "Pastel1")
        }
        
        

    })
    
    
    output$plot1 <- renderPlot({
        a = input$var1
        # b = input$var2

        # ggplot(data3, aes_string(x=a,y=b))+
        #     geom_bar(stat = "identity",position = "dodge",aes(fill = Data_source))
        
        # For making condional plot
        
        if(a=="infant_type"){
            # ggplot(data3, aes_string(x=a,y= "moratality_rate"))+
            #     geom_path(size=1.4,aes(col = Data_source,group =Data_source ))
            
            ggplot(data3, mapping = aes(x=factor(Data_source), y=mortality_rate,group=factor(infant_type), col=factor(infant_type)))+
                geom_line(size=2)+geom_point(size=5)+
                scale_color_viridis(discrete = TRUE, option = "D")+
                scale_fill_viridis(discrete = TRUE) 
        }

        else if (a=="economic_status") {
         ggplot(data3, aes_string(x=a,y= "mortality_eco"))+
                    geom_bar(stat = "identity",position = "dodge",aes(fill = Data_source))+
                scale_fill_brewer(palette = "BuGn")+theme_dark()
            
            }
        else if (a=="mothers_age"){
            p =ggplot(data3, aes_string(x=a,y= "mortality_age"))+
                geom_bar(stat = "identity",position = "dodge",aes(fill = Data_source))+
                scale_fill_brewer(palette = "YlGnBu")
            p+theme_gray()
           
            }
        else if (a=="birth_order"){
            ggplot(data3, aes_string(x=a,y= "mortality_birth_order"))+
                geom_bar(stat = "identity",position = "dodge",aes(fill = Data_source))}+
            scale_fill_brewer(palette = "Set3")
    
        else{
           g<- ggplot(data3, aes_string(x=a,y="mortality_edu"))+
                geom_point(size=4)+
                geom_path(size=1.5,aes(col = Data_source,group=Data_source))
           g+scale_color_brewer(palette="Set1")+theme(legend.position="top")
        }
        
        
    })
    
    

})
