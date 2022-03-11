#### chapter 1. 기초 문법 ####

1 / 100 * 30

a <- 1 / 100 * 30
b <- 1/ 1000

a <- "A그룹"
groupA <- "A그룹"
group_A <- "A그룹"

r_basics <- 3

r_basics


## 변수 유형 확인 예시
class(r_basics)
class(group_A)

temp <- TRUE

class(temp)

## 교재 또는 임의의 변수를 만들어보세요.

int <- 1
float <- 0.1
double <- 0.01
string = "스트링123"

#### chapter 2. 벡터 만들기 ####

num_vector = c(1, 2, 3)

print(num_vector)
class(num_vector)

char_vector = c("A", "B", "C")
print(char_vector)
class(char_vector)

logical_vector = c(TRUE, FALSE, FALSE)
print(logical_vector)
class(logical_vector)

#### (1) 예외 ####

temp = c(1, "1", 2)
print(temp)
class(temp)

temp = c(1, FALSE, TRUE)
print(temp)
class(temp)

temp = c("A", FALSE, TRUE)
print(temp)
class(temp)

#### (2) 범주형 변수 ####
# factor

# 비서열 척도 = 명목형 척도
location_vector = c("서울", "경기", "대구", "광주")
fct_vector = factor(location_vector)
# 뒤에 ordered = FALSE가 생략됨
print(fct_vector)
class(fct_vector)

# 원핫 인코딩 ---> python

# 서열 척도
# Ordinal Encoding ---> python
fct_vector2 = factor(location_vector, 
                     ordered = TRUE)
print(fct_vector2)
class(fct_vector2)

