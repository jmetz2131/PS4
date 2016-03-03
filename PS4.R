##Initial setup
##In order to use the rvest package, I had to install it.
install.packages("rvest")
library(rvest)

##This link specifies which webpage is going to be scraped. I used the read_html command to ensure
wikiURL <- read_html("https://en.wikipedia.org/wiki/List_of_United_States_presidential_elections_by_popular_vote_margin")
attach(wikiURL)

## Grab the tables from the page and use the html_table function to extract the tables.
## You need to subset temp to find the data you're interested in (HINT: html_table())

##This code subsets my_table to find the data I'm interested in (NEED BETTER EXPLANATION)
my_table <- wikiURL %>% 
  html_nodes("table") %>%
  .[[2]] %>%
  html_table()

my_table

#Here I am cleaning up how I'll read my_table to make it more manageable. I need to order the data by chronologically by year.
names(my_table) #This gives me the column names

#I ordered everything in the table to follow the chronologically ordered election years.
#Election years will be my x-variable on both plots, so this code applies to both.
my_table <- my_table[order(my_table$Year),]

#Setting up the space in which the plots will be returned
par(mfrow=c(1,2))

##The two trends I will be looking at look at Turnout and Popular Vote won by the winner

#My first plot will look at how Voter Turnout over time. Overall turnout changed dramatically across these years and I think
percentage_voted <- my_table$Turnout
percentage_voted

#I changed the data into numerics and removed the % sign to make it usable in a table
percentage_voted <- as.numeric(sub("%", "", percentage_voted))
percentage_voted
percentage_voted <- na.omit(percentage_voted)
percentage_voted

#Here I am setting up the election years to make it usable in a plot
election_year <- my_table$Year
election_year
election_year <- na.omit(election_year)
election_year

##Setting up the template for my first plot
plot(NULL, NULL,
     xlab = "Election Year",
     ylab = "Turnout by Percentage",
     xlim = c(1800, 2020),
     ylim = c(20,90),
     main = "Voter Turnout in Presidential Elections from 1824-2012",
     pch=19,
     col = c("dark green")
     )

#Now that I've set up the plot space, I now will add the data points.
points(x = election_year, y = percentage_voted, type = "p")

#Voter turnout clearly declined across our history. I think it would be impactful
#to delineate different turnout amongst the three centuries.
#Here I am changing the color of the 19th century election data points.


##My second plot
#Here I will turn the winner's popular vote count data into a usable form
pop_vote <- my_table$'Popular vote (%)'
pop_vote

#I changed the data into numerics and removed the % sign to make it usable in a plot
#I also removed the NAs from the table
pop_vote <- as.numeric(sub("%", "", pop_vote))
pop_vote <- na.omit(pop_vote)
pop_vote

##Setting up the template for my first plot
plot(NULL, NULL,
     xlab = "Election Year",
     ylab = "Winner's Popular Vote Percentage",
     xlim = c(1800, 2020),
     ylim = c(20,90),
     main = "Election Winner's Vote Percentage from 1824-2012",
     pch=19,
     col = c("dark green")
)

#Now that I've set up the plot space, I now will add the data points.
points(x = election_year, y = pop_vote, type = "p")






