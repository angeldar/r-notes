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

# Filter data by column.
data = data[data.colour = 'green']

# Create new row with values equal difference between current and previous value of another row
data['diff'] = (data['money'] - data['money'].shift(1)).fillna(1)

# Save data to csv
data.to_csv('new_file.csv')

# You can use SQL queries in pandas
import pandasql
q = """
    SELECT * FROM data LIMIT 30 WHERE country = "russia"
    """
pandasql.sqldf(q.lower(), locals())

# Describe dataframe
data.describe()

# Fill NA values with the mean
data['weight'] = data['weight'].fillna(numpy.mean(data['weight']))
