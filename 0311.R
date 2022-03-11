# install.packages("패키지명")
library(dplyr) # 데이터 가공

이름 = c("김", "이", "정")
나이 = c(20, 30, 40)
지각 = c(TRUE, FALSE, FALSE)

students = data.frame(name = 이름,
                      age = 나이,
                      atte = 지각)

str(students)

char = c("harder", "better", "faster", "stronger")
num = c(1, 2, 3, 4)
logic = c(TRUE, TRUE, FALSE, FALSE)

ex = data.frame(str = char,
                int = num,
                tf = logic)

str(ex)

# 경로 확인
getwd()

# 파일 저장
write.csv(x = students, file = "학생.csv")

#row.names = FALSE를 붙이면 앞에 숫자가 사라짐
#write.csv(x = students, file = "학생.csv", row.names = FALSE)

write.csv(x = ex, file = "ex.csv")

## 엑셀로 내보내기

install.packages("writexl")
library(writexl)

write_xlsx(x = students, path = "학생.xlsx")

# 객체 모두 지우기
rm(list = ls())

# 파일 불러오기
getwd() # 경로 확인

students = read.csv("학생.csv") # 탭키 눌러서 불러오기


# 엑셀 파일 불러오기
library(readxl)
students2 = read_xlsx("학생.xlsx", sheet = 1)

students
students2


# dplyr 패키지

library(dplyr)

iris = iris
str(iris)

iris %>% # ~에서 # 150개, 5개의 변수
  select(Sepal.Length, Sepal.Width) %>% #150개, 2개의 변수
  head()

iris %>% 
  select(Sepal.Length, Sepal.Width) %>% 
  filter(Sepal.Length > 6) # 6 이상의 변수만 필터 61개, 2개의 변수
  ..
  ..
  head(10) -> iris2 # 10개, 2개의 변수

str(students)
students %>% select(name, age, atte)

str(iris2)
