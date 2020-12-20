##############################################################
### server.R
##############################################################

    
    #some data manipulation to derive the values of KPI boxes
    total.revenue <- sum(topup_dat$AMOUNT)
    sales.account <- topup_dat %>% group_by(CREATED_AT) %>% summarise(value = sum(QYT)) %>% filter(value==max(value))

    prof.prod <- topup_dat %>% group_by(format(CREATED_AT, "%m")) %>% summarise(value = sum(AMOUNT)) %>% filter(value==max(value))

    day.rec <- topup_dat %>% group_by(format(CREATED_AT, "%m")) %>% summarise(value = sum(AMOUNT)) %>% filter(value==max(value))
    
    
    #creating the valueBoxOutput content
    output$value1 <- renderValueBox({
        valueBox(
            formatC(sales.account$value, format="d", big.mark=',')
            ,paste('Quantidade de Recargas Vendidas',sales.account$Account)
            ,icon = icon("stats",lib='glyphicon')
            ,color = "purple")
        
        
    })
    
    
    
    output$value2 <- renderValueBox({
        
        valueBox(
            formatC(total.revenue, format="d", big.mark=',')
            ,'Valor Total das Recargas Vendidas'
            ,icon = icon("gbp",lib='glyphicon')
            ,color = "red")
        
    })
    
    
    
    output$value3 <- renderValueBox({
        
        valueBox(
            formatC(prof.prod$value, format="d", big.mark=',')
            ,paste('Valor de Recargas Mensais',prof.prod$Product)
            ,icon = icon("menu-hamburger",lib='glyphicon')
            ,color = "yellow")
        
    })
    
    #creating the plotOutput content
    
    output$revenuebyPrd <- renderPlot({
        ggplot(data = topup_dat, 
               aes(x=CREATED_AT, y=AMOUNT, fill=factor(SEGMENTATION_ID))) + 
            geom_bar(position = "dodge", stat = "identity") + ylab("Valor (em Meticais)") + 
            xlab("Data") + theme(legend.position="bottom" 
                                    ,plot.title = element_text(size=15, face="bold")) + 
            ggtitle("Valor das Vendas por data") + labs(fill = "Tipo")
    })
    
    
    output$revenuebyRegion <- renderPlot({
        ggplot(data = topup_dat, 
               aes(x=SEGMENTATION_ID, y=AMOUNT, fill=factor(SEGMENTATION_ID))) + 
            geom_bar(position = "dodge", stat = "identity") + ylab("Valor (em Meticais)") + 
            xlab("Tipo de Recarga") + theme(legend.position="bottom" 
                                    ,plot.title = element_text(size=15, face="bold")) + 
            ggtitle("Valor das Vendas por tipo") + labs(fill = "Tipo")
    })
    
    