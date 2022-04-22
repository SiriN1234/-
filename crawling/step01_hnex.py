import requests
from bs4 import BeautifulSoup
import pandas as pd


def con2oracle():
    

def crawling(soup):
    div = soup.find("div", class_="list_issue")
    # print(type(div))
    print(div.find_all("a"))

    result = []
    urls = []
    for a in div.find_all("a"):
        # print(a.get_text())
        urls.append(a['href'])
        result.append(a.get_text())

    # CSV
    
    # Oracle
    
    # Elastic
    
    # 
    df = pd.DataFrame({"news_title": result,
                       "url": urls})
    print(df)
    df.to_csv("newscrawling.csv")
    # print("크롤링 완성!")

def main():
    CUSTOM_HEADER = {
        'referer' : 'https://www.naver.com/',
        'user-agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'
    }

    url = 'https://www.naver.com'
    req = requests.get(url = url, headers=CUSTOM_HEADER)
    print(req.status_code)
    soup = BeautifulSoup(req.text, 'html.parser')
    crawling(soup)

if __name__ == "__main__":
    main()