

library(dplyr)
library(ggplot2)

head(superstore)


superstore <- read.csv("C:\\Users\\fee10\\Ironhack\\Module2\\Labs\\lab-r-dataframes\\dataset\\Sample - Superstore.csv")

ggplot(superstore, aes(x=as.factor(Segment), y=Sales)) +
  geom_boxplot()+
  labs(title = "Sales by Segement", x="Segment", y="Sales")

ggplot(superstore, aes(x=as.factor(Segment), y=Profit)) +
  geom_boxplot()+
  labs(title = "Sales by Segement", x="Segment", y="Sales")


## Bar Plots: Create a bar plot to show the top 10 orders with highest value of sales.

top_orders <- superstore %>%
  arrange(desc(Sales)) %>%
  slice(1:10)


ggplot(top_orders, aes(x=reorder(Order.ID, -Sales), y=Sales, fill=Order.ID)) +
  geom_bar(stat="identity") +
  labs(title = "Top 10 highest orders in sales", x = "Order ID", y = "Sales")
  theme_minimal() +
  coord_flip() 

## Heatmap: Use a heatmap to visualize the pattern of missing data.
  

# Install and load the VIM package if not already installed
install.packages("VIM")
library(VIM)

# Visualize missing data pattern
missing_pattern <- aggr(superstore, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(superstore), cex.axis=.7, gap=3, ylab=c("Missing data","Pattern"))

## Histogram : Generate a histogram that can show the distribution of the Profit column.

ggplot(superstore, aes(x=Profit)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black", alpha = 10) + 
  labs(title = "Histogram of Profit", x = "Profit", y = "Frequency") +  
  theme_minimal()

## Bar Plots for Aggregated Data: Generate a bar plot that shows Total Sales by Category and a barplot that shows Profit by Category.

total_sales_category <- superstore %>%
  group_by(Category) %>%
  summarize(
    Total_Sales = sum(Sales)
    )

total_profit_category <- superstore %>%
  group_by(Category) %>%
  summarize(
    Total_Profit = sum(Profit)
  )

ggplot(total_sales_category, aes(x = Category, y=Total_Sales)) +
  geom_bar(stat="identity") +
  labs(title = "Total Sales by Category", x = "Category", y = "Total Sales") +
  scale_y_continuous(labels = scales::comma_format(scale = 1)) +
  theme_minimal() 

ggplot(total_profit_category, aes(x = Category, y=Total_Profit)) +
  geom_bar(stat="identity") +
  labs(title = "Total Profit by Category", x = "Category", y = "Total Profit") +
  scale_y_continuous(labels = scales::comma_format(scale = 1)) +
  theme_minimal() 


