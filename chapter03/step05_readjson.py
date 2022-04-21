import json 

with open('data.json', 'r') as f:
    data = json.load(f)

print("Data Type is ", type(data))
print(data['records'][0])
print(data['records'][0]['name'])