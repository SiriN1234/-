# import libaries
import datetime as dt 
from datetime import timedelta 

from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator

import pandas as pd 

# load data
def csvToJson():
    df = pd.read_csv('data.csv')
    # print(df.info())
    for i, r in df.iterrows():
        print(r['name'])

    # Export JSON
    df.to_json('fromAirflow.json', orient="records")

default_args = {
    'owner' : 'evan', 
    'start_date' : dt.datetime(2020, 3, 18), 
    'retries' : 1, 
    'retry_delay' : dt.timedelta(minutes=5)
}

# 참조 : https://ponyozzang.tistory.com/402
with DAG('MyCSVDAG', 
            default_args=default_args, 
            schedule_interval=timedelta(minutes=5), 
            # '0 * * * *'
        ) as dag:
    print_starting = BashOperator(task_id = "starting", 
                                  bash_command='echo "I am reading the CSV now......"')
    
    CSVJson = PythonOperator(task_id = "convertCSVtoJson", 
                             python_callable=csvToJson)

print_starting >> CSVJson

# if __name__ == "__main__":
#    csvToJson()