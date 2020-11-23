#MUMBA modelling results analysis
#Loading libraries
pacman::p_load(dplyr,lubridate,ggplot2,reshape,tidyverse, 
               ggplot2,readxl,zoo,openair,grid,ggplotify,
               ggpmisc,ggnewscale,ggsci,cowplot,gridExtra,
               egg,scales,broom, cluster, factoextra,dgof, ggthemes)

options(scipen=999,digits=2)#options for signif. figures

setwd(paste0("E:/One Drive/OneDrive - University of Wollongong/R Scripts/Modelling/Mumba_modelling/"))


#Importing CSIRO-CTM output 25x25km

#version 1. 
#Regarding the regional averages, I have removed the boxes containing sea for the emission averages 
#(to avoid lots of boxes with 0 emissions diluting the average), but did not remove the sea boxes for the mixing ratio averages, 
#as the concentrations transport out over the sea.


wollongong_s4<- read_csv('input/CSIRO_CTM/mzrt_timeseries.csv') #regional emissions and mixing ratios starting Jan 1st at 00 UTC
# terpE and terpC are the summed monoterpene emissions and concs respectively.  Emissions are in g/km2/h .concs in ppb.

mumba_ctm_v1 <- read_xlsx('input/CSIRO_CTM/Wollongong_s4.xlsx')#time series at MUMBa site
#APIN, BPIN, MYRC and LIMN are the monoterpenes. Gas phase are in ppb, aerosol phase in ug/m3

#version 2 I have now run the model with the biogenic emissions calculated directly from the PFTs, not the emissions factor maps.

wollongong_s5<- read_csv('input/CSIRO_CTM/mzrt_timeseries_sc5.csv') #regional emissions and mixing ratios starting Jan 1st at 00 UTC

mumba_ctm_v2 <- read_csv('input/CSIRO_CTM/Wollongong_sc5.csv')#time series at MUMBa site
