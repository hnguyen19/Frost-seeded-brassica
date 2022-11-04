library(readxl) #for read_excel
library(tidyverse)
library(purrr)
library(dplyr)
library(stringr)
library(magrittr) # for %<>%

FSB <- read_excel("2-Data/Raw/Rawdata_FSBrassica_RA.team.xlsx",  sheet = 1)

#View(FSB)

FSB.clean <- FSB %>%
  select(1:3)%>%
  rename(dried.wt.bagged = "Dry Weight w Bag (grams)",
         bag.type = "Bag Type") %>%
  mutate(bag.wt = ifelse(bag.type == "20", 21,
                           ifelse(bag.type == "NL", 27, 29.25)),
         block = substr(Barcode, 5,5),
         treatment = substr(Barcode, 7,7),
         species = str_to_sentence(str_sub(Barcode, start=9), locale = "en"), # species names to sentence case 
#         group = ifelse(species %in% c("Alfalfa", "Red Clover", "Control"), "C", "B"), # C for control, B for brassicas | # controls are alfalfa, red clover, and no cover crop
         dried.wt = dried.wt.bagged - bag.wt,
         sampled.area.m.sq = 0.25,
         biomass.g.per.m.sq = dried.wt/sampled.area.m.sq)  %>% 
  filter(!treatment %in% c("J", "M")) %>% #Winter camelina did not survive and alfalfa (treatment M) was not supposed to be frost-seeded a
  mutate(treatment = ifelse(treatment %in% LETTERS[1:12], treatment, "N")) %>% #rename O and P as N for grouping in the next step  
  select(block, treatment, species, dried.wt.bagged, sampled.area.m.sq, biomass.g.per.m.sq) %>%
  group_by(block, treatment, species) %>%
  mutate(dried.wt.bagged = mean(dried.wt.bagged), 
         sampled.area.m.sq = mean(sampled.area.m.sq), 
         biomass.g.per.m.sq = mean(biomass.g.per.m.sq))  ## Treat all the controls as subsamples and average over them 

    
write.csv(FSB.clean , "2-Data/Clean/fsb_long.csv", row.names = FALSE)  

# https://stackoverflow.com/questions/5831794/opposite-of-in-exclude-rows-with-values-specified-in-a-vector 


fsb.crops <- FSB.clean %>% 
  filter(!species %in% c("Weeds", "Control")) %>%
  rename(crop.biomass.g.per.sq.m = "biomass.g.per.m.sq") %>%
  dplyr::arrange(species)
  
fsb.weeds <- FSB.clean %>% 
  filter(species %in% c("Weeds", "Control")) %>%
  rename(weed.biomass.g.per.sq.m = "biomass.g.per.m.sq") %>%
  dplyr::arrange(species)

fsb.wide <- fsb.weeds  %>% 
  left_join(fsb.crops, by = c("block", "treatment")) %>%
  select(block, treatment, species.x, species.y, crop.biomass.g.per.sq.m, weed.biomass.g.per.sq.m) %>%
  mutate(crop.biomass.g.per.sq.m = replace_na(crop.biomass.g.per.sq.m, 0),
         species.y = replace_na(species.y, "None")) %>%
  dplyr::arrange(species.y)

write.csv(fsb.wide, "2-Data/Clean/fsb_wide.csv", row.names = FALSE)  
