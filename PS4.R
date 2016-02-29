##Initial setup
##In order to use the rvest package, I had to install it.
install.packages("rvest")
library(rvest)

##This link specifies which webpage is going to be scraped. I used the read_html command to ensure
wikiURL <- read_html("https://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_popular_vote_margin")

## Grab the tables from the page and use the html_table function to extract the tables.
## You need to subset temp to find the data you're interested in (HINT: html_table())

##This code subsets my_table to find the data I'm interested in (NEED BETTER EXPLANATION)
my_table <- wikiURL %>% 
  html_nodes("table") %>%
  .[[2]] %>%
  html_table()

my_table

#Here I am cleaning up how I'll read my_table to make it more manageable.
names(my_table) #This gives me the column names


