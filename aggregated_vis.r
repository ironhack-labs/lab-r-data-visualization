# Step 1: Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

# Step 2: Load the dataset
superstore_data <- read_csv("dataset\\Sample - Superstore.csv")

# Step 3: Summarize total Sales and Profit by Category
category_summary <- superstore_data %>%
  group_by(Category) %>%
  summarise(
    Total_Sales = sum(Sales, na.rm = TRUE),
    Total_Profit = sum(Profit, na.rm = TRUE)
  )

# Step 4: Create bar plot for Sales by Category
sales_plot <- ggplot(category_summary, aes(x = Category, y = Total_Sales, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Sales by Category", x = "Category", y = "Sales") +
  theme_minimal()

# Step 5: Create bar plot for Profit by Category
profit_plot <- ggplot(category_summary, aes(x = Category, y = Total_Profit, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Profit by Category", x = "Category", y = "Profit") +
  theme_minimal()

# Step 6: Print the plots
print(sales_plot)
print(profit_plot)
