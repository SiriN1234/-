import requests
from bs4 import BeautifulSoup
import pandas as pd


def crawling(soup):
    tbody = soup.find("tbody")
    p1 = tbody.find_all("p", class_ = 'title')
    p2 = tbody.find_all("p", class_ = 'artist')
    a1 = tbody.find_all("a", class_ = 'album')

    title = []
    artist = []
    album = []

    for t in p1 :
        title.append(t.get_text().strip('\n'))
        
    for t in p2 :
        artist.append(t.get_text().strip('\n'))

    for a in a1 :
        album.append(a.get_text().strip('\n'))
    
    # print(title)


    df = pd.DataFrame({"song_title" : title,
                       "artist" : artist,
                       "album" : album})
    print(df)
    df.to_csv("bugs_crawling.csv")
    


def main():
    CUSTOM_HEADER = {
        'referer' : 'https://music.bugs.co.kr/',
        'user-agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'
    }

    url = 'https://music.bugs.co.kr/chart'
    req = requests.get(url = url, headers=CUSTOM_HEADER)
    # print(req.status_code)
    soup = BeautifulSoup(req.text, 'html.parser')
    crawling(soup)

if __name__ == "__main__":
    main()