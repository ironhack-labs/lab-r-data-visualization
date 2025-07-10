# Step 1: Load necessary libraries
library(ggplot2)
library(readr)  # for read_csv

# Step 2: Load the dataset
superstore_data <- read.csv("dataset\\Sample - Superstore.csv")

# Step 3: Create a boxplot for Sales
p <- ggplot(superstore_data, aes(y = Sales)) +
  geom_boxplot(fill = "steelblue", outlier.color = "red", outlier.shape = 16) +
  labs(title = "Boxplot of Sales", y = "Sales") +
  theme_minimal()
# print(p)

# # Step 4: Create a boxplot for Profit
p <- ggplot(superstore_data, aes(y = Profit)) +
  geom_boxplot(fill = "darkgreen", outlier.color = "orange", outlier.shape = 16) +
  labs(title = "Boxplot of Profit", y = "Profit") +
  theme_minimal()
# print(p)

# part 2 - bar plot

# Step 2: Load the dataset
superstore_data <- read_csv("dataset\\Sample - Superstore.csv")

# Step 3: Get top 10 orders by Sales
top_orders <- superstore_data %>%
  arrange(desc(Sales)) %>%
  slice(1:10)

# Optional: make Order.ID a factor for better axis labeling
top_orders$Order.ID <- factor(top_orders$Order.ID, levels = top_orders$Order.ID[order(top_orders$Sales)])

# Step 4: Create the bar plot
top_sales_plot <- ggplot(top_orders, aes(x = Order.ID, y = Sales)) +
  geom_bar(stat = "identity", fill = "tomato") +
  coord_flip() +  # horizontal bars for readability
  labs(title = "Top 10 Orders by Sales",
       x = "Order ID",
       y = "Sales") +
  theme_minimal()

# Step 5: Display the plot
# print(top_sales_plot) (COMMENTED OUT in order to print sep. pngs)

# VIM and Heatmap
# Step 1: Load necessary libraries

library(dplyr)

# Step 2: Load the dataset
dataset <- read_csv("dataset\\Sample - Superstore.csv")

# Then run your code
top_orders <- superstore_data %>%
  arrange(desc(Sales)) %>%
  slice(1:10)

# Step 3: Visualize missing data pattern
missing_pattern <- aggr(dataset,
                        col = c('navyblue', 'red'),
                        numbers = TRUE,
                        sortVars = TRUE,
                        labels = names(dataset),
                        cex.axis = 0.7,
                        gap = 3,
                        ylab = c("Missing data", "Pattern"))

# Step 4: Print the visualization
print(missing_pattern)
