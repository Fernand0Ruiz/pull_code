library(tidyverse) 

#read in files
#extract of inv from Dutchie
exp <- read.csv("2024-03-18-Inventory (1).csv") #4645
#extracxt of COA sheet
COA <- read.csv("COA_Lookup - Web_Export.csv") #2832


#make sub-setted (sub) files select cols and filter rows for both files - stand. names across files
pak_id_export <- exp %>% select(Package.ID,Available ,Date.of.manufacture,Batch,Harvest.date)
names(pak_id_export) <- c("package_ID","available","man_date_Dexp","batch_Dexp","har_date_Dexp")

coa_id_export <- COA %>% select(package_ID,Manufacturing.Date,Batch.Harvest.Date,Batch.Lab.Results.Lab.Result.URL)
names(coa_id_export) <- c("package_ID","man_date_coa","bch_date_coa","URL_coa")


#using an "inner join" I merge  the sub COA filet to the sub Dutchie file 
dates <- merge(coa_id_export,pak_id_export,by="package_ID") #5466

# then I do a second inner join using the combined file in the last step
#and subjoin it to the main COA file
dates_comb <- merge(COA,dates,by="package_ID") #5466

#here we output the final result into a csv - it saves into our R Project Folder.
write.csv(dates_comb, "parse_dutchie_inv.csv")






















