# 네이버 접속
import requests
from bs4 import BeautifulSoup

url = "https://www.naver.com/"

def main(url) :
    req = requests.get(url)
    print(req.status_code)
    print(req.text)

if __name__ == "__main__" :
    main(url = url)