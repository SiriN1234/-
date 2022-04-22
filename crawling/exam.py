from bs4 import BeautifulSoup
soup = BeautifulSoup(open("index2.html", encoding = 'utf-8'), 'html.parser')

# print(soup.prettify())

a_find = soup.find_all("a")
# print(a_find)
class_find = soup.find_all("a", class_ = "sister")
for text in class_find :
    print(text.get_text())

a_string = soup.find(string="Lacie")
print(a_string.find_parents("a"))
print(a_string.find_parent("p"))