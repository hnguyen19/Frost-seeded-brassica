library(readxl) #for read_excel
library(tidyverse)
library(purrr)
library(dplyr)
library(stringr)
library(magrittr) # for %<>%

FSB <- read_excel("2-Data/Raw/Rawdata_FSBrassica_RA.team.xlsx",  sheet = 1)

View(FSB)

FSB.clean <- FSB %>%
  select(1:3) %>%
  rename(dried.wt.bagged = "Dry Weight w Bag (grams)",
         bag.type = "Bag Type") %>%
  mutate(bag.wt = ifelse(bag.type == "20", 21,
                           ifelse(bag.type == "NL", 27, 29.25))) %>%
  mutate(Block = substr(Barcode, 5,5),
         Treatment = substr(Barcode, 7,7),
         Species = str_sub(Barcode, start=9)) %>%
  mutate(dried.wt = dried.wt.bagged - bag.wt)

write.csv(FSB.clean, "2-Data/Clean/fsb_clean.csv", row.names = FALSE)  
