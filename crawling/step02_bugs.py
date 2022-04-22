import requests
from bs4 import BeautifulSoup

def crawling(soup):
    # print("a")
    tbody_df = soup.find("tbody")
    result = []
    for p in tbody_df.find_all("p", class_ = 'title') :
        # print(p.get_text())
        result.append(p.get_text().strip('\n'))
        # result.append(p.get_text().replace("\n", ""))

    print(result)
    

def main():
    CUSTOM_HEADER = {
        'user-agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.127 Safari/537.36'
    }

    url = 'https://music.bugs.co.kr/chart'
    req = requests.get(url = url, headers=CUSTOM_HEADER)

    if(req.status_code == 200) :
        print("상태코드 : ", req.status_code)
        print("실행")
        soup = BeautifulSoup(req.text, 'html.parser')
        crawling(soup)
    else :
        print("웹사이트 확인하세요: ", url)
    # print(req.status_code)

if __name__ == "__main__":
    main()