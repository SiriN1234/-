library(ggplot2)

diamonds = ggplot2::diamonds   #diamonds 데이터세트를 새 객체 diamonds에 입력

#1단계
ggplot(data = diamonds, aes(x = carat, y = price))

#2단계
ggplot(data = diamonds, aes(x = carat, y = price)) +
  geom_point()


table(diamonds$cut)


#막대그래프 그리기 : geom_bar()
ggplot(diamonds, aes(x = cut)) +
  geom_bar()

ggplot(diamonds, aes(x = cut, y = price)) +
  geom_bar(stat = "identity")


#범주별로 정해진 값을 토대로 막대그래프 그리기

#cut 범주별 평균 가격 구하기 : geom_col()
cut_price = diamonds %>%
  group_by(cut) %>%   #cut 범주별로 데이터 분류
  summarise(mean_price = mean(price))   #cut의 범주별 평균가격 구하기

cut_price

ggplot(data = cut_price, aes(x = cut, y = mean_price)) +
  geom_col()


#히스토그램 그리기 : geom_histogram()
ggplot(data = diamonds, aes(x = carat)) +
  geom_histogram()

range(diamonds$carat)

ggplot(data = diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 1)

ggplot(data = diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)


#커밀 밀도 곡선 : geom_density()
ggplot(data = diamonds, aes(x = carat)) +
  geom_density()


#상자그림 그래프 그리기 : geom_boxplot()
ggplot(data = diamonds, aes(x = 1, y = price)) +
  geom_boxplot()

ggplot(data = diamonds, aes(x = cut, y = price)) +
  geom_boxplot()


#선그래프 그리기 : geom_line()
str(cars)

ggplot(data = cars, aes(x = speed, y = dist)) +
  geom_line()

ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()

ggplot(data = economics, aes(x = date, y = psavert)) +
  geom_line()
