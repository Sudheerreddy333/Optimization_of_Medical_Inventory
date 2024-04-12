# -*- coding: utf-8 -*-
"""
Created on Thu Nov 16 07:50:37 2023

@author: admin
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats

#Load the Dataset 
dataset = pd.read_excel(r"C:\Users\admin\OneDrive\Desktop\MEDICAL PROJECT FOLDERS\Dataset\Medical Inventory Optimaization Dataset.xlsx")
dataset.head()

## Check no of unique values for each column in the dataset
dataset.nunique()

# data dimension
dataset.shape
## It gives no of rows and columns in the dataset
#(14218, 14)

#data types
dataset.dtypes
## It gives the datatypes of the columns in the dataset
            
#converting patient_id to object
dataset.Patient_ID = dataset['Patient_ID'].astype('str')

##checking the converted dtypes
dataset.dtypes

dataset.info()
## The info gives datatypes of the columns, nulls in the each column and also gives how many categorical and numeric data

# EXPLORATARY DATA ANALYSIS (EDA)
#First Moment Business Decision or Measures of Central Tendency.
#It gives the mean, median and mode values of the dataset.
#Mean is the average of the data and it easily gets influenced by the outliers.
#Median is the middle most value of the dataset.
#Mode is the most repeated value of the dataset.
#If the mean, median & mode are same then the data has normal distribution otherwise the distribution is not normal.

dataset.mean()

#Quantity            2.231748
#ReturnQuantity      0.291954
#Final_Cost        124.823957
#Final_Sales       234.038300
#RtnMRP             29.126755

dataset.median()

#Patient_ID        1.201809e+10
#Quantity          1.000000e+00
#ReturnQuantity    0.000000e+00
#Final_Cost        5.365000e+01
#Final_Sales       8.642400e+01
#RtnMRP            0.000000e+00

dataset.mode() 
stats.mode(dataset)

#Patient_ID        12018071649
#Quantity               1
#ReturnQuantity         0
#Final_Cost          49.352
#Final_Sales            0
#RtnMRP                 0

#Second Moment Business Decision or Measures of Dispersion
#It contains Variance, Standard Deviation & Range.
#It gives a general idea about the spread of data in the dataset.
#Variance is the average squared distance of each data point from the mean.
#Standard deviation is the root of the variance.
#Range is the difference between the max and min data point of the dataset.

## Variance
dataset.var()

#Quantity              26.337862
#ReturnQuantity         2.700506
#Final_Cost        216023.045394
#Final_Sales       450592.097666
#RtnMRP             33219.558938

# Standard variance
dataset.std()

#Quantity            5.132043
#ReturnQuantity      1.643322
#Final_Cost        464.782794
#Final_Sales       671.261572
#RtnMRP            182.262335

# Range
dataset.Quantity.max()-dataset.Quantity.min()
# Range ofQuantity = 150
dataset.ReturnQuantity.max()-dataset.ReturnQuantity.min()
# Range ofQuantity = 50
dataset.Final_Cost.max()-dataset.Final_Cost.min()
# Range ofQuantity = 33138.0
dataset.Final_Sales.max()-dataset.Final_Sales.min()
# Range ofQuantity = 39490.0
dataset.RtnMRP.max()-dataset.RtnMRP.min()
# Range ofQuantity =  8014.0


#THIRD MOMENT BUSINESS DECISION OR SKEWNESS
#Skewness gives the measure of asymmetry in a data.
#The types of skewness are as follows:
#Negative skewness or left skewed.
#Positive skewness or right skewed.
#If skewness = 0 then it is normally distributed.
dataset.skew()

#Quantity          11.341034
#ReturnQuantity    17.172365
#Final_Cost        34.508215
#Final_Sales       21.006722
#RtnMRP            15.797853

#FOURTH MOMENT BUSINESS DECISION OR KURTOSIS
#Kurtosis is the peakedness of the distribution.
#Negative kurtosis implies a wider peak and thinner tails.
#Positive kurtosis implies a narrow peak and wider tails.
dataset.kurt()

#Quantity           180.153858
#ReturnQuantity     409.416914
#Final_Cost        2025.866475
#Final_Sales        948.522711
#RtnMRP             403.524941

###### GRAPHICAL REPRESENTATION ##########
import pandas as pd
import matplotlib.pyplot as plt


######## BOX PLOT ##############
dataset.plot(kind="box",subplots=True,sharey=False,figsize=(15,15))
# With the help of box plot we find the median,quantiles and potential outliers

######## HISTOGRAM PLOT ##############
plt.hist(dataset.Quantity,color='green', bins=100 , alpha = 1)
plt.hist(dataset.ReturnQuantity,color='orange', bins=100 , alpha = 1)
plt.hist(dataset.Final_Cost,color='blue', bins=100, alpha = 1)
plt.hist(dataset.Final_Sales,color='red', bins=100, alpha = 1)
plt.hist(dataset.RtnMRP,color='grey', bins=100, alpha = 1)
# This graph visually represents the distribution of the dataset by dividing into intervals(bins)
# and displaying the frquency or count of values within each bin.

########### DENSITY PLOT ############
sns.kdeplot(dataset.Quantity)
sns.kdeplot(dataset.ReturnQuantity)
sns.kdeplot(dataset.Final_Cost)
sns.kdeplot(dataset.Final_Sales)
sns.kdeplot(dataset.RtnMRP)
# It helps visualize the probability density of a continuous variable, 
#offering insights into the shape and features of the underlying data distribution,
#similar to a histogram but with a focus on the continuous nature of the data.

########## SCATTER PLOT #############
sns.pairplot(dataset)
###### AND ########
plt.scatter(x=dataset.Quantity, y=dataset.ReturnQuantity)
plt.scatter(x=dataset.Quantity, y=dataset.Final_Cost)
plt.scatter(x=dataset.Quantity, y=dataset.Final_Sales)
plt.scatter(x=dataset.Quantity, y=dataset.RtnMRP)

plt.scatter(x=dataset.ReturnQuantity, y=dataset.Quantity)
plt.scatter(x=dataset.ReturnQuantity, y=dataset.Final_Cost)
plt.scatter(x=dataset.ReturnQuantity, y=dataset.Final_Sales)
plt.scatter(x=dataset.ReturnQuantity, y=dataset.RtnMRP)

plt.scatter(x=dataset.Final_Cost, y=dataset.Quantity)
plt.scatter(x=dataset.Final_Cost, y=dataset.ReturnQuantity)
plt.scatter(x=dataset.Final_Cost, y=dataset.Final_Sales)
plt.scatter(x=dataset.Final_Cost, y=dataset.RtnMRP)

plt.scatter(x=dataset.Final_Sales, y=dataset.Quantity)
plt.scatter(x=dataset.Final_Sales, y=dataset.ReturnQuantity)
plt.scatter(x=dataset.Final_Sales, y=dataset.Final_Cost)
plt.scatter(x=dataset.Final_Sales, y=dataset.RtnMRP)

plt.scatter(x=dataset.RtnMRP, y=dataset.Quantity)
plt.scatter(x=dataset.RtnMRP, y=dataset.ReturnQuantity)
plt.scatter(x=dataset.RtnMRP, y=dataset.Final_Cost)
plt.scatter(x=dataset.RtnMRP, y=dataset.Final_Sales)
#displays individual data points on a two-dimensional graph, allowing the examination of the relationship between two numerical variables
# It helps identify patterns, trends, and potential correlations or outliers in the data by visualizing the pairwise interaction between the variables.

############# DISTRIBUTION PLOT ###############
sns.distplot(dataset.Quantity)
sns.distplot(dataset.ReturnQuantity)
sns.distplot(dataset.Final_Cost)
sns.distplot(dataset.Final_Sales)
sns.distplot(dataset.RtnMRP)
#provides a comprehensive visualization of the univariate distribution of a variable.
# it is particularly useful for understanding the probability density across different values of a continuous variable.

#################### DATA PREPROCESSING #######################

############### TYPE CASTING ##################
dataset.Patient_ID = dataset['Patient_ID'].astype('str')

############ HANDLING DUPLICATES ###############

#Checking the Number of Duplicates in the Dataset.
number_of_duplicates = dataset.duplicated(subset = None,keep='first').sum()
print('number of duplicates', number_of_duplicates)

## no of duplicates = 26 

#Removing the duplicates from the dataset
dataset.drop_duplicates(keep = 'first', inplace = True)

#Again checking no of duplicates in the Dataset
number_of_duplicates = dataset.duplicated(subset = None,keep='first').sum()
print('number of duplicates', number_of_duplicates)

## no of duplicates = 0 (After Removing)

################# MISSING VALUES ##################
# Checking the Number of Missing Values in the Dataset
missing = dataset.isna().sum().sort_values(ascending = False)
print(missing)

## no of missing values for each column in the dataset
#SubCat1           1682
#DrugName          1659
#SubCat            1659
#Formulation        650


#seperating numeric and categorical columns
numeric_features = dataset.select_dtypes(exclude='object')
categorical_features = dataset.select_dtypes(include='object')

#imputation
from sklearn.impute import SimpleImputer
imputer = SimpleImputer(strategy='mean')
imputed_data_num = pd.DataFrame(imputer.fit_transform(numeric_features),columns=numeric_features.columns)
imputed_data_num

imputer2 = SimpleImputer(strategy='most_frequent')
imputed_data_cat = pd.DataFrame(imputer2.fit_transform(categorical_features),columns=categorical_features.columns)
imputed_data_cat

imputed_data = pd.concat([imputed_data_cat,imputed_data_num],axis=1)

#Again checking missing values in the dataset
missing = imputed_data.isna().sum().sort_values(ascending = False)
print(missing)

## no of missing values after removing from dataset
#SubCat1           0
#DrugName          0
#SubCat            0
#Formulation       0

imputed_data.isnull().sum()


########## OUTLIERS TREATMENT ##############
from feature_engine.outliers import Winsorizer

imputed_data.plot(kind="box",subplots=True,sharey=False,figsize=(15,15)) 


winsor1=Winsorizer(capping_method='iqr',
                  tail='both',
                  fold=1.5,
                  variables=['Quantity'])

winsor2=Winsorizer(capping_method='quantiles',
                  tail='both',
                  fold=0.05,
                  variables=['ReturnQuantity'])

winsor3=Winsorizer(capping_method='iqr',
                  tail='both',
                  fold=1.5,
                  variables=['Final_Cost'])

winsor4=Winsorizer(capping_method='iqr',
                  tail='both',
                  fold=1.5,
                  variables=['Final_Sales'])

winsor5=Winsorizer(capping_method='quantiles',
                  tail='both',
                  fold=0.05,
                  variables=['RtnMRP'])

df=winsor1.fit_transform(imputed_data)
df=winsor2.fit_transform(df)
df=winsor3.fit_transform(df)
df=winsor4.fit_transform(df)
df=winsor5.fit_transform(df)
df.plot(kind="box",subplots=True,sharey=False,figsize=(15,15))



#Checking the number of unique values in each column
df.nunique()

############## ZERO & NEAR ZERO VARIANCE ################

variance = df.var()
near_zero_var_features = variance[variance < 0.01]
print(near_zero_var_features)

## There is no zero and Near zero variance in the dataset


############# Transformations ###############
import scipy.stats as stats
from feature_engine import transformation
import pylab
stats.probplot(df.Quantity,dist='norm',plot=pylab)
stats.probplot(np.sqrt(df.Quantity),dist='norm',plot=pylab)

stats.probplot(df.ReturnQuantity,dist='norm',plot=pylab)
stats.probplot(np.sqrt(df.ReturnQuantity),dist='norm',plot=pylab)

stats.probplot(df.Final_Cost,dist='norm',plot=pylab)
stats.probplot(np.sqrt(df.Final_Cost),dist='norm',plot=pylab)

stats.probplot(df.Final_Sales,dist='norm',plot=pylab)
stats.probplot(np.sqrt(df.Final_Sales),dist='norm',plot=pylab)

stats.probplot(df.RtnMRP,dist='norm',plot=pylab)
stats.probplot(np.sqrt(df.RtnMRP),dist='norm',plot=pylab)


############# Normalization ###############
from sklearn.preprocessing import MinMaxScaler

scaler = MinMaxScaler()
df['Quantity'] = scaler.fit_transform(df[['Quantity']])
df['ReturnQuantity'] = scaler.fit_transform(df[['ReturnQuantity']])
df['Final_Cost'] = scaler.fit_transform(df[['Final_Cost']])
df['Final_Sales'] = scaler.fit_transform(df[['Final_Sales']])
df['RtnMRP'] = scaler.fit_transform(df[['RtnMRP']])
print(df)
###################### OR ####################
#seperating numeric and categorical columns
numeric_features = df.select_dtypes(exclude='object')
categorical_features = df.select_dtypes(include='object')

normalise_data = pd.DataFrame(scaler.fit_transform(numeric_features),columns=numeric_features.columns)
print(normalise_data)

cleaned_data = pd.concat([normalise_data,categorical_features],axis=1)


################# AUTOEDA ##################
# SWEETVIZ
# pip install sweetviz
df.Dateofbill = df['Dateofbill'].astype('str')
import sweetviz as sv
sv.analyze(df)
s = sv.analyze(df)
s.show_html('sweetviz_report.html')


# DTALE
# pip install datle
import dtale
d = dtale.show(df)
d.open_browser()

# AUTOVIZ
# pip install autoviz
from autoviz.AutoViz_Class import AutoViz_Class
av = AutoViz_Class()
%matplotlib inline
a = av.AutoViz(r"C:\Users\admin\OneDrive\Desktop\MEDICAL PROJECT FOLDERS\Dataset\Medical Inventory Optimaization Dataset.xlsx")

## PANDAS PROFILING ##
## pip install pandasprofiling
from pandas_profiling import ProfileReport
p = ProfileReport(df)
p.to_file("output.html")

## DATAPREP ##
# pip install dataprep
import dataprep
from dataprep.eda import create_report
report = create_report(df, title='My Report')
report.show_browser()










