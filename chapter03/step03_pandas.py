import pandas as pd
df = pd.read_csv('data.csv')
df.head(10)

df.to_csv('fromdf.csv', index=False)