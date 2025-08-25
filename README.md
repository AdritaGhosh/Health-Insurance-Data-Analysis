# Health-Insurance-Data-Analysis

## Features
**1. Data Loading and Inspection**
* Reads the dataset from a CSV file.
* Displays the first and last few records.
* Provides a summary of the dataset and checks the structure of the data.
<br>

**2. Basic Statistical Analysis**
* Calculates the range, summary statistics, and standard deviation for key numerical variables.
* Performs Shapiro-Wilk normality tests on numerical variables.
<br>

**3. Data Visualization**
* Creates histograms for numerical variables (age, BMI, expenses).
* Creates bar plots for categorical variables (children, sex, smoker, region).
* Generates boxplots to visualize the distribution of age, BMI, and expenses.
<br>

**4. Correlation and Association Tests**
* Calculates Spearman correlation coefficients between numerical variables.
* Visualizes correlations using scatter plots and correlation matrices.
* Conducts chi-square tests for independence between categorical variables (sex, smoker, region).
<br>

**5. Linear Regression Modeling**
* Builds a linear regression model to identify factors influencing insurance expenses.
* Evaluates the model and plots diagnostic graphs.
<br>

**6. Group Comparisons**
* Creates a new categorical variable EXPENSES_split based on the median expenses.
* Conducts Wilcoxon tests to compare age, BMI, and children between high and low expense groups.
* Performs chi-square tests to examine associations between EXPENSES_split and categorical variables (sex, smoker, region).
* Visualizes these comparisons using boxplots and bar plots.
<br>

**7. Regional Analysis**
* Conducts Kruskal-Wallis tests to examine regional differences in expenses, age, and BMI.
* Performs post-hoc pairwise comparisons if significant differences are found.

## Dependencies
The script requires the following R packages:
* '*ggplot2*'
* '*corrplot*'
* '*psych*'
* '*tidyverse*'
* '*readr*'
* '*dplyr*'
* '*rstatix*'
* '*PMCMRplus*'

## How to Run
* Set the working directory to the location of the dataset.
* Ensure all required packages are installed.
* Run the script to perform the analysis and visualize the results.

## Dataset
* **File**: [Health-Insurance-Dataset.csv](https://www.kaggle.com/datasets/teertha/ushealthinsurancedataset/data)
* **Variables**: Age, BMI, Children, Expenses, Sex, Smoker, Region
* **Description**: [Analytical report](https://medium.com/@adrita21/statistical-analysis-of-health-insurance-cost-using-r-709d88214b9d)

This script provides a comprehensive analysis of the Health Insurance Dataset, helping to understand the factors that influence insurance expenses and the distributions of various attributes.
