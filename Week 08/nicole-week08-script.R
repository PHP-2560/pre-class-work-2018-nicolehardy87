#-------------------------------------------------------------------------------------
#Loading Packages
#-------------------------------------------------------------------------------------
library(rvest)
library(httr)
#-------------------------------------------------------------------------------------
#Assignment
#------------------------------------------------------------------------------------
#Question 1: reads html content
url = "https://money.cnn.com/data/us_markets/"
webpage = read_html(url)
print(webpage)

#Question 2: gets status, type, size of url
session_details = GET(url)
print(session_details)

#Question 3: extract all sector names of "Stock Sectors"
#xpath from selector gadget
webpage %>%
html_nodes(xpath = '//*[(@id = "wsod_sectorPerformance")]//*[contains(concat( " ", @class, " " ), concat( " ", "wsod_firstCol", " " ))]') %>%
html_text

#Question 4: "Extract 3 Month % Change" values
#xpath from selector gadget
webpage %>%
  html_nodes(xpath = '//*[(@id = "wsod_sectorPerformance")]//td[contains(concat( " ", @class, " " ), concat( " ", "wsod_aRight", " " ))]') %>%
  html_text()

#Question 5: Extracts table "What's Moving"
#xpath from inspect
webpage %>%
html_nodes(xpath = '//*[@id="wsod_marketMoversContainer"]/table') %>%
html_table()

#Question 6: Builds links from first col of "What's Moving" Table
#xpath from selector gadget
base_url = "https://money.cnn.com"
stock_url = 
webpage %>%
html_nodes(xpath = '//*[(@id = "wsod_marketMoversContainer")]//*[contains(concat( " ", @class, " " ), concat( " ", "wsod_symbol", " " ))]') %>%
html_attr("href")
                    
#Reconstructs the links
paste(base_url, stock_url, sep = "")  

#Question 7: Extracts titles under "Latest News"
#xpath from selector gadget
webpage %>%
  html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "HeadlineList", " " ))]//a') %>%
  html_text()    

#Question 8: Extract attributes of the timestamp underneath the "what's Moving Table"
#xpath from inspect
webpage %>%
  html_nodes(xpath = '//*[@id="wsod_marketMoversContainer"]/div/div/span') %>% 
  html_attrs()

# Question 9: Extract percentage values of "Trending Tickers"  
webpage %>% 
  html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "bars", " " ))]') %>%
  html_attr(name = "class")

#Question 10: Get links of svg images
svg_url = 
webpage %>%
  html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "logo-cnn", " " ))]') %>%
  html_attr(name = "src")

#Builds links
paste(base_url, svg_url, sep = "")
