#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

output$value1 <- renderValueBox({
    valueBox(value = prettyNum(topup_yearly_tbl$total_amount, big.mark = ",")
             ,icon = icon("stats",lib='glyphicon')
             ,color = "purple")
})



output$value2 <- renderValueBox({
    valueBox(value = scales::comma(200000, big.mark = ","), 
            icon = icon("stats",lib='glyphicon')
             ,color = "yellow")  
})

output$value3 <- renderValueBox({
    valueBox(value = scales::comma(100000,big.mark = ",") , subtitle = "Total Expected Revenue"
              ,icon = icon("stats",lib='glyphicon')
             ,color = "green")  
})


output$plot_out_daily_topup <- renderPlot({
    
    ggplot(data = topup_daily_tbl, aes(x = CREATED_AT, y = total_amount)) +
        geom_line()
})
