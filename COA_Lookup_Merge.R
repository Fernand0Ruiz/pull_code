library(tidyverse) 

#read in Exports
BI_export <- read.csv("./COA/BI_PULL.csv")
cult_export <- read.csv("./COA/Cultivation.csv")
downtown_export <- read.csv("./COA/Downtown.csv")
wholesale_export <- read.csv("./COA/Wholesale.csv")

#selects predicate(pack ID) and the observation(man. Dates)
cult_table <- cult_export %>% select(Package.ID,Date.of.manufacture)
names(cult_table) <- c("package_ID","Manufacture Date from Cult")

downtown_table <- downtown_export %>% select(Package.ID,Date.of.manufacture)
names(downtown_table) <- c("package_ID","Manufacture Date from Downtown")

wholesale_table <- wholesale_export %>% select(Package.ID,Date.of.manufacture)
names(wholesale_table) <- c("package_ID","Manufacture Date from Wholesale")

#JOIN
temp <- full_join(cult_table, downtown_table, by="package_ID")
all_loc_table <- full_join(wholesale_table, temp, by="package_ID")

#Append the observation from the secondary table Y(all_loc_table) to the primary table X(BI_export).(left join)
Final_WebExport <- left_join(BI_export, all_loc_table, by="package_ID")

#here we output the final result into a csv - it saves into our R Project Folder.
write.csv(Final_WebExport, "Final_WebExport.csv")
