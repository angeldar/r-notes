# Notes about pandas froamework for python
# Pandas is a data-analisys framework for python, like R programming language.

#import pandas
import pandas

# Read data
data = pandas.read_csv('file.csv')

# Get data column
data['nameFirst']

# Add new column using old columns
data['new_column'] = data['weight'] + data['height']

# Save data to csv
data.to_csv('new_file.csv')
