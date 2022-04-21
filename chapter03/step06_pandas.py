import pandas.io.json as pd_JSON
import pandas as pd

f = open('data.json', 'r')
data = pd_JSON.loads(f.read())
df = pd.json_normalize(data, record_path='records')
print(df.head(2))
print(df.head(2).to_json())
print(df.head(2).to_json(orient='records'))