getwd()
setwd("C:/Users/....")
getwd()
dataset <- read.csv('Health-Insurance-Dataset.csv', stringsAsFactors = TRUE)
head(dataset)
tail(dataset)
str(dataset)
range(dataset$age)
range(dataset$bmi)
range(dataset$children)
range(dataset$expenses)
summary(dataset)
sd(dataset$age)
sd(dataset$bmi)
sd(dataset$children)
sd(dataset$expenses)
shapiro.test(dataset$age)
shapiro.test(dataset$bmi)
shapiro.test(dataset$expenses)
shapiro.test(dataset$children)

# Visualization of distributions

install.packages("ggplot2")
library(ggplot2)

# For Numerical variables, histograms are used
ggplot(dataset, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")
ggplot(dataset, aes(x = bmi)) +
  geom_histogram(binwidth = 2, fill = "salmon", color = "black") +
  labs(title = "Distribution of BMI", x = "BMI", y = "Frequency")
ggplot(dataset, aes(x = expenses)) +
  geom_histogram(binwidth = 1000, fill = "lightgreen", color = "black") +
  labs(title = "Distribution of expenses", x = "expenses", y = "Frequency")

# For the 'children' variable, a bar plot is used
ggplot(dataset, aes(x = children)) +
  geom_bar() +
  labs(title = "Distribution of Children", x = "Number of Children", y = "Count")

# For categorical variables, bar plots are used
ggplot(dataset, aes(x = sex, fill = sex)) +
  geom_bar() +
  labs(title = "Gender Distribution", x = "Gender", y = "Count")
ggplot(dataset, aes(x = smoker, fill = smoker)) +
  geom_bar() +
  labs(title = "Smoking Habits Distribution", x = "Smoker", y = "Count")
ggplot(dataset, aes(x = region, fill = region)) +
  geom_bar() +
  labs(title = "Geographic Region Distribution", x = "Region", y = "Count")

ggplot(dataset, aes(y = age)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Age", y = "Age")
ggplot(dataset, aes(y = bmi)) +
  geom_boxplot(fill = "salmon", color = "black") +
  labs(title = "Boxplot of BMI", y = "BMI")
ggplot(dataset, aes(y = expenses)) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  labs(title = "Boxplot of expenses", y = "expenses")

install.packages("corrplot")
library(corrplot)

cor(dataset$age, dataset$bmi, method = "spearman")
cor(dataset$age, dataset$children, method = "spearman")
cor(dataset$age, dataset$expenses, method = "spearman")
cor(dataset$bmi, dataset$children, method = "spearman")
cor(dataset$bmi, dataset$expenses, method = "spearman")
cor(dataset$children, dataset$expenses, method = "spearman")

cor(dataset[c("age", "bmi", "children", "expenses")], method = "spearman")
pairs(dataset[c("age", "bmi", "children", "expenses")], method = "spearman")


install.packages('psych')
library(psych)
pairs.panels(dataset[c("age", "bmi", "children", "expenses")], 
             method = "spearman", hist.col = "pink")

#Chi-square test sex with smoker
sex_smoker_table <- table(dataset$sex, dataset$smoker)
chi_square_sex_smoker <- chisq.test(sex_smoker_table)
print(chi_square_sex_smoker)
#Chi-square test sex with region
sex_region_table <- table(dataset$sex, dataset$region)
chi_square_sex_region <- chisq.test(sex_region_table)
print(chi_square_sex_region)
#Chi-square test region with smoker
region_smoker_table <- table(dataset$smoker, dataset$region)
chi_square_region_smoker <- chisq.test(region_smoker_table)
print(chi_square_region_smoker)

install.packages("tidyverse")
library(tidyverse)

model <- lm(expenses ~ ., data = dataset)
model
summary(model)
plot(model)
model

threshold <- median(dataset$expenses)
dataset$EXPENSE_split <- ifelse(dataset$expenses > threshold, "High", "Low")

"EXPENSE_split" %in% names(dataset)

Utest_for_age <- wilcox.test(age ~ EXPENSE_split, data = dataset)
Utest_for_age
Utest_for_bmi <- wilcox.test(bmi ~ EXPENSE_split, data = dataset)
Utest_for_bmi
Utest_for_children <- wilcox.test(children ~ EXPENSE_split, data = dataset)
Utest_for_children

ggplot(dataset, aes(x = EXPENSE_split, y = age, fill = EXPENSE_split)) +
  geom_boxplot() +
  labs(x = "EXPENSE_split", y = "Age") +
  ggtitle("Comparison of Age Between EXPENSE_split Groups")

ggplot(dataset, aes(x = EXPENSE_split, y = bmi, fill = EXPENSE_split)) +
  geom_boxplot() +
  labs(x = "EXPENSE_split", y = "BMI") +
  ggtitle("Comparison of BMI Between EXPENSE_split Groups")

ggplot(dataset, aes(x = EXPENSE_split, y = children, fill = EXPENSE_split)) +
  geom_boxplot() +
  labs(title = "Comparison of children Between EXPENSE_split Groups")

# Chi-square test for Sex
sex_table <- table(dataset$sex, dataset$EXPENSE_split)
chi_square_sex <- chisq.test(sex_table)
print(chi_square_sex)

# Chi-square test for Smoker
smoker_table <- table(dataset$smoker, dataset$EXPENSE_split)
chi_square_smoker <- chisq.test(smoker_table)
print(chi_square_smoker)

# Chi-square test for Region
region_table <- table(dataset$region, dataset$EXPENSE_split)
chi_square_region <- chisq.test(region_table)
print(chi_square_region)

# Bar plot for categorical variables (e.g., Sex, Smoker, Region)
ggplot(dataset, aes(x = sex, fill = EXPENSE_split)) + 
  geom_bar(position = "dodge", stat = "count") +
  labs(title = "Association of Insurance expenses by Sex", x = "Sex", y = "Count") +
  scale_fill_manual(values = c("Low" = "grey", "High" = "brown"))
ggplot(dataset, aes(x = smoker, fill = EXPENSE_split)) + 
  geom_bar(position = "dodge", stat = "count") +
  labs(title = "Association of Insurance expenses by Smoker", x = "Sex", y = "Count") +
  scale_fill_manual(values = c("Low" = "grey", "High" = "brown"))
ggplot(dataset, aes(x = region, fill = EXPENSE_split)) + 
  geom_bar(position = "dodge", stat = "count") +
  labs(title = "Association of Insurance expenses by Region", x = "Sex", y = "Count") +
  scale_fill_manual(values = c("Low" = "grey", "High" = "brown"))

install.packages("readr")
install.packages("dplyr")
install.packages("purrr")
install.packages("rstatix")
install.packages("PMCMRplus")

library(readr)
library(dplyr)
library(rstatix)
library(PMCMRplus)

kruskal_test_result_expenses_region <- dataset %>%
  kruskal_test(expenses ~ region)
kruskal_test_result_expenses_region

kruskal_test_result_age_region <- dataset %>% 
  kruskal_test(age ~ region)
kruskal_test_result_age_region

kruskal_test_result_bmi_region <- dataset %>%
  kruskal_test(bmi ~ region)
kruskal_test_result_bmi_region
if(kruskal_test_result_bmi_region$p < 0.05) {
  pairwise_results <- list()
  pairwise_results <- pairwise.wilcox.test(dataset$bmi, dataset$region, p.adjust.method = "bonferroni")
  print(pairwise_results)
}  
