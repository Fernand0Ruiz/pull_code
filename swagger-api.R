library(jsonlite)
library(httr)
library(rvest)


#clear environment
rm(list=ls())

#API key that was authorized from Dutchie Swagger UI.
token <- "Basic NTA5MDg4NzljYTY0NGVhYWI5NzE5NmU3ZTJiNDZiMzE="

#Pulls data from API URL that was generated on Swagger UI. 
#Anything added in the query list will be CONCATONATE to the URL. 
res <- GET("https://api.pos.dutchie.com/reporting/inventory", 
           add_headers(Authorization=token),
           query = list(
           ))

#converts data from JSON API call to readable characters in R
data = fromJSON(rawToChar(res$content))

#prints response from API call, 200 is Success code. 
print(res)

#makes data visible in another tab. 
View(data)

#Experimenting with subsets. 
#newData <- subset(data,vendorName=="Forever 46, LLC - 00000057DCHF00477864")


# D2 Dispensary |
#   f9f1ee961a054da2a6ad5b5297ada3c9 
# 
# Downtown Cultivation| e9732211acf543c8be331430fec513e2 
# 
# Downtown Dispensary| 68789ed5d0d44cc0a56cb77346dc34c2 
# 
# Downtown-CULT-Distribution (Wholesale) | 50908879ca644eaab97196e7e2b46b31 
# 
# Downtown Processing-D2| 9a06cdc17c1b4a8b8677f4e5ee592a58 <-NEED
#https://west.backoffice.dutchie.com/



# Response body
# Download

  #1SELECT api KEY FOR LOCATIION OF INTREST
  #2-in swagger -= auth the selected key under Util menu
  #paste API into field - execute
  # paste into R code unbder troken
  #3Select table of intrest in Swagger
  
  
  
#  InventoryItem 
# {
#   unitWeightUnit	string
#   productId	integer($int32)
#   sku	string
#   productName	string
#   description	string
#   categoryId	integer($int32)
#   category	string
#   imageUrl	string
#   quantityAvailable	number($double)
#   quantityUnits	string
#   unitWeight	number($double)
#   flowerEquivalent	number($double)
#   recFlowerEquivalent	number($double)
#   flowerEquivalentUnits	string
#   readOnly: true
#   batchId	integer($int32)
#   batchName	string
#   packageId	string
#   packageStatus	string
#   unitPrice	number($double)
#   medUnitPrice	number($double)
#   recUnitPrice	number($double)
#   strainId	integer($int32)
#   strain	string
#   strainType	string
#   Hybrid; Indica; Sativa; CBD
#   
#   size	string
#   labResults	[...]
#   testedDate	string($date-time)
#   sampleDate	string($date-time)
#   packagedDate	string($date-time)
#   manufacturingDate	string($date-time)
#   lastModifiedDateUtc	string($date-time)
#   labTestStatus	string
#   vendorId	integer($int32)
#   vendor	string
#   expirationDate	string($date-time)
#   roomQuantities	[...]
#   pricingTierName	string
#   alternateName	string
#   tags	[...]
#   brandId	integer($int32)
#   brandName	string
#   medicalOnly	boolean
#   externalPackageId	string
#   METRC or BioTrack ID when using LeafLogix assigned Package IDs
#   
#   producer	string
#   producerId	integer($int32)
#   lineage	[...]
#   potencyIndicator	string
#   masterCategory	string
#   effectivePotencyMg	number($double)
#   isCannabis	boolean
#   packageNDC	string
#   labResultUrl	string
# }



#Webscrpe dutchie
library('xml2')
url<-read_html("https://west.backoffice.dutchie.com/products/inventory?hideZeroQty=false&pageSize=1000&sortFields=batch.batchLotNumber&sortDirections=asc")

 
