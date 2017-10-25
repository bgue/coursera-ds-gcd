# coursera-ds-gcd

## Getting and Cleaning Data Course Project

### Introduction
This directory contains files for the course project analysis for John Hopkins' Getting and Cleaning Data course. From the assignment:

"""
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
"""

### Analysis Steps
The script itself, run_analysis.R, goes through the following steps:
1. Download data if it isn't available locally
2. Load the data into R data.frames
3. Merges the datasets; each had been split into test and train subsets
4. Applies more meaningful labels to the columns of the datasets
5. Creates a final merge into a single 2-dimensional data.frame between the separate features, activities, and subjects
6. Extracts the mean and standard deviation measurements into a new frame
7. Groups by activity and subject
8. Creates a tidy dataset with columnwise averages, and writes it out as tidydata.txt

Details of the variables present and their derivations can be found in the modified Codebook.md.

