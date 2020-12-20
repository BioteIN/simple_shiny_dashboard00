######################################################
### global.R
######################################################

library(readxl)
library(tidyverse)
library(highcharter)

library(lubridate) # for date

# load the required packages
library(shiny)
require(shinydashboard)
library(ggplot2)
library(dplyr)

recommendation <- read.csv('recommendation.csv',stringsAsFactors = F,header=T)





# 1.1 Carregar os dados ---------------------------------------------------

topup_dat <- read.csv(file = "00_data/topup_daily.csv")

topup_dat %>% glimpse()

# converter o tipo de dados
topup_dat$CREATED_AT <- as.Date(topup_dat$CREATED_AT, "%m/%d/%Y")

topup_dat %>% glimpse()


# calcular o montante total de recarregamentos por dia
topup_daily_tbl <- 
    topup_dat %>% 
    group_by(CREATED_AT) %>% 
    summarise(total_amount = sum(AMOUNT))

# calcular a quantidade de recargas vendidas
topup_vendidas_tbl <- 
    topup_dat %>% 
    group_by(CREATED_AT) %>% 
    summarise(total_qyt = sum(QYT))


# montante anual
topup_yearly_tbl <- 
topup_dat %>% 
    group_by(Year = lubridate::year(CREATED_AT)) %>% 
    summarise(total_amount = sum(AMOUNT))


