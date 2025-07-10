# Step 1: Load necessary libraries
library(ggplot2)
library(readr)

# Step 2: Load the dataset
superstore_data <- read_csv("dataset\\Sample - Superstore.csv")

# Step 3: Create the histogram of Profit

profit_hist <- ggplot(superstore_data, aes(x = Profit)) +
  geom_histogram(binwidth = 1000, fill = "steelblue", color = "black") +
  labs(title = "Distribution of Profit",
       x = "Profit",
       y = "Frequency") +
  theme_minimal(base_size = 18)

# Step 4: Print the plot
print(profit_hist)


