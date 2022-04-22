from bs4 import BeautifulSoup

# 첫번째 작업 index.html 파일을 BeautifulSoup 객체로 변환
## 클래스로 변환 --> 클래스 내부의 메서드 사용
soup = BeautifulSoup(open("index.html", encoding='UTF-8'), "html.parser") # ,from_encoding = "utf-8"도 가능
# print(type(soup))

# soup.find("div", class_ = "chapter02")
# print(soup.find("p"))
results = soup.find_all("p")
# print(results[1])

print(soup.find("div", id = "main").find("p").get_text())