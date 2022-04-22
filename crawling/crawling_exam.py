import requests
from bs4 import BeautifulSoup

def crawling(soup):
    div = soup.find("div", class_ = "gall_exposure")
    print(div.get_text())

def main():
    CUSTOM_HEADER = {
        'referer' : 'https://www.dcinside.com/',
        'user-agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'
    }

    url = 'https://www.dcinside.com/'
    req = requests.get(url = url, headers=CUSTOM_HEADER)
    # print(req.status_code)
    soup = BeautifulSoup(req.text, 'html.parser')
    crawling(soup)

if __name__ == "__main__":
    main()