setwd("c:/Users/User/Desktop/Ironhack DS AI/week-8/lab-r-data-visualization")
print('Load dataset and libraries')
print(strrep('-', 50))
df <- read.csv("./dataset/Sample - Superstore.csv")
library(ggplot2)
library(dplyr)
# Display the first few rows of the dataframe
print(head(df))
print(strrep('-', 50))
print('Boxplot')
print(strrep('-', 50))
# Calculate total sales by category
sales <- df %>%
    group_by(Category) %>% # Group data by product category
    summarize(Total_Sales = sum(Sales, na.rm = TRUE)) # Sum sales per category, ignoring missing values

print("Total sales by category:")
print(sales)

# Visualize
p <- ggplot(sales, aes(x = factor(Category), y = Total_Sales, fill = factor(Category))) +
    geom_col() +                        # Create a bar chart ("col" for categorical x-axis)
    labs(title = "Total Sales by Category", x = "Category", y = "Total Sales") +  # Add labels
        theme(
        plot.title = element_text(size = 36),
        axis.title = element_text(size = 28),
        axis.text = element_text(size = 24)
    ) +                 # Apply a pre-defined theme from ggthemes
    scale_fill_brewer(palette = "Set2") # Use a color palette from RColorBrewer
print(p)  # Display the plot

# Calculate total profit by category
profit <- df %>%
    group_by(Category) %>% # Group data by product category
    summarize(Total_Profit = sum(Profit, na.rm = TRUE)) # Sum profit per category, ignoring missing values

print("Total profit by category:")
print(profit)

# Visualize
p <- ggplot(profit, aes(x = factor(Category), y = Total_Profit, fill = factor(Category))) +
    geom_col() +                        # Create a bar chart ("col" for categorical x-axis)
    labs(title = "Total Profit by Category", x = "Category", y = "Total Profit") +  # Add labels
        theme(
        plot.title = element_text(size = 36),
        axis.title = element_text(size = 28),
        axis.text = element_text(size = 24)
    ) +                 # Apply a pre-defined theme from ggthemes
    scale_fill_brewer(palette = "Set2") # Use a color palette from RColorBrewer
print(p)  # Display the plot

print(strrep('-', 50))
print('Bar Plots')
print(strrep('-', 50))
# Create a bar plot to show the top 10 orders with the highest sales
top_orders <- df %>%
    arrange(desc(Sales)) %>%  # Sort orders by sales in descending order
    head(10)                  # Select the top 10 orders
print("Top 10 orders by sales:")
print(top_orders)
p <- ggplot(top_orders, aes(x = reorder(Order.ID, -Sales), y = Sales, fill = Category)) +
    geom_col() +  # Create a bar chart
    labs(title = "Top 10 Orders by Sales", x = "Order ID", y = "Sales") +  # Add labels
    theme(
        plot.title = element_text(size = 36),
        axis.title = element_text(size = 28),
        axis.text = element_text(size = 24)
    ) +
    scale_fill_brewer(palette = "Set2") +  # Use a color palette from RColorBrewer
    coord_flip()  # Flip the axes for better readability
print(p)  # Display the plot

print(strrep('-', 50))
print('Heatmap')
print(strrep('-', 50))
# Use a heatmap to visualize the pattern of missing data
library(VIM)

# Visualize missing data pattern
missing_pattern <- aggr(df, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(df), cex.axis=.7, gap=3, ylab=c("Missing data","Pattern"))

print(strrep('-', 50))
print('Histogram')
print(strrep('-', 50))
# Generate a histogram that can show the distribution of the Profit column 
p <- ggplot(df, aes(x = Profit)) +
    geom_histogram(binwidth = 100, fill = "blue", color = "black", alpha = 0.7) +
    labs(title = "Distribution of Profit", x = "Profit", y = "Frequency") +
    theme(
        plot.title = element_text(size = 36),
        axis.title = element_text(size = 28),
        axis.text = element_text(size = 24)
    )
print(p)  # Display the histogram

print(strrep('-', 50))
print('Bar Plots for Aggregated Data')
print(strrep('-', 50))
# Generate a bar plot that shows Total Sales by Category and a barplot that shows Profit by Category
p <- ggplot(df, aes(x = Category, y = Sales, fill = Category)) +
    geom_bar(stat = "summary", fun = "sum") +
    labs(title = "Total Sales by Category", x = "Category", y = "Total Sales") +
    theme(
        plot.title = element_text(size = 36),
        axis.title = element_text(size = 28),
        axis.text = element_text(size = 24)
    ) +
    scale_fill_brewer(palette = "Set2")
print(p)  # Display the bar plot for Total Sales by Category