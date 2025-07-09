# 1. Install from CRAN (you only need to do this once)
# install.packages("VIM", dependencies = TRUE)

# library(VIM)

# library(tidyverse)
install.packages("naniar", repos = "https://cloud.r-project.org/")
library(naniar)


superstore <- read_csv("Sample - Superstore.csv", show_col_types = FALSE)

# 2. Boxplots for Sales and Profit
# ---------------------------------
ggplot(superstore, aes(x = "", y = Sales)) +
  geom_boxplot() +
  labs(title = "Distribution of Sales", y = "Sales") +
  theme_minimal()

ggplot(superstore, aes(x = "", y = Profit)) +
  geom_boxplot(fill = "steelblue") +
  labs(title = "Distribution of Profit", y = "Profit") +
  theme_minimal()

# 3. Bar plot: Top 10 orders by Sales
# ------------------------------------
top10_orders <- superstore %>%
  arrange(desc(Sales)) %>%
  slice_head(n = 10)

ggplot(top10_orders, aes(x = reorder(`Order ID`, Sales), y = Sales)) +
  geom_col(fill = "darkorange") +
  coord_flip() +
  labs(
    title = "Top 10 Orders by Sales",
    x = "Order ID",
    y = "Sales"
  ) +
  theme_minimal()


# 4. Heatmap of missing data
# ---------------------------
# Using naniar::vis_miss to show missingness pattern
vis_miss(superstore) +
  labs(title = "Missing Data Pattern in Superstore Dataset") +
  theme_minimal()
  
# 1. Histogram of Profit distribution
ggplot(superstore, aes(x = Profit)) +
  geom_histogram(binwidth = 20, boundary = 0, closed = "left") +
  labs(
    title = "Distribution of Profit",
    x     = "Profit",
    y     = "Count"
  ) +
  theme_minimal()

# 2. Bar plot: Total Sales by Category
sales_cat <- superstore %>%
  group_by(Category) %>%
  summarize(total_sales = sum(Sales, na.rm = TRUE), .groups = "drop")

ggplot(sales_cat, aes(x = reorder(Category, total_sales), y = total_sales)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Total Sales by Category",
    x     = "Category",
    y     = "Total Sales"
  ) +
  theme_minimal()

# 3. Bar plot: Total Profit by Category
profit_cat <- superstore %>%
  group_by(Category) %>%
  summarize(total_profit = sum(Profit, na.rm = TRUE), .groups = "drop")

ggplot(profit_cat, aes(x = reorder(Category, total_profit), y = total_profit)) +
  geom_col(fill = "darkgreen") +
  coord_flip() +
  labs(
    title = "Total Profit by Category",
    x     = "Category",
    y     = "Total Profit"
  ) +
  theme_minimal()