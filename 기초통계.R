# 모수와 통계량

# 분산값이 크다 -> 평균으로부터 멀어진 개별적인 데이터가 많다
# 분산값이 작다 -> 평균 주위에 개별적인 데이터가 많다


getwd()

albums = read.csv("album.csv")

str(albums)

# 앨범 판매량 데이터
# adverts : 광고집행비용
# sales : 판매량

# 기술통계량(Descriptive Analysis)
# 최대, 최소, 평균, 중간값, 분산, 표준편차

albums$sales
sort(albums$sales)

# 최소값
sort(albums$sales)[1]
min(albums$sales)

# 최대값
sort(albums$sales)[200]
max(albums$sales)


# 최빈값
table(albums$sales)
sort(table(albums$sales), decreasing = TRUE)[1]

# 평균과 중앙값
mean(albums$sales)   # 193.2
median(albums$sales)   # 200


# 결측치 데이터 추가
sales2 = c(albums$sales, NA)
tail(sales2)
mean(sales2)
mean(sales2, na.rm = TRUE)   # NA값 빼고 계산


# 평균의 가장 큰 단점
# 극단적인 값에 굉장히 민감하게 반응

sales3 = c(albums$sales, 30000000000)
mean(sales3)

# 양 극단의 값에 민감하게 반응하지 않음
# 이러한 특징을 강건하다(Robust)
median(sales3)

# 분산
weight = c(64, 68, 70, 72, 76)
weight_mean = mean(weight)   # 평균
weight_deviation = weight - weight_mean   # 편차
weight_deviation
sum(weight_deviation)

weight_deviation_2 = weight_deviation ^ 2
sum(weight_deviation_2)
mean(weight_deviation_2)   # 분산

# 표준편차
sqrt(mean(weight_deviation_2))   # sqrt는 제곱근


# R 내장 함수
var(weight)   # 표본분산
sd(weight)   # 표본표준편차




# 변동계수 : 표준편차를 평균으로 나눈 값
# CV : Coefficient of Variation = 변동계수
# RSD : Relative Standard Deviation = 상대 표준 편차

# cv = sd(data) / mean(data)

# 주식 데이터
install.packages("tidyquant")
library(tidyquant)
library(quantmod)
library(purrr)
library(ggplot2)
library(tibble)

tickers = c("AAPL", "TSLA")
getSymbols(tickers,
           from = "2022-01-02",
           to = "2022-01-30")

stock = map(tickers, function(x) Ad(get(x)))
stock = reduce(stock, merge)
colnames(stock) = tickers

head(stock)

stock_df = stock %>%
  data.frame(date = index(stock))
stock_df

# 사용자 정의 함수

cv_fun = function(data){
   result = sd(data) / mean(data) * 100
   return(result)
}

cv_fun(stock_df$AAPL)   # 4.034862
cv_fun(stock_df$TSLA)   # 9.46726

ggplot(stock_df, aes(x = date)) +
  geom_line(aes(y = AAPL, colour = "Apple")) +
  geom_line(aes(y = TSLA, colour = "Tesla")) +
  scale_colour_manual(name = "Company", values = 
  c("Apple" = "red", "Tesla" = "darkblue")) +
  theme_bw()



# 4분위수
qs_df = quantile(albums$sales)
qs_df[4] - qs_df[2]
IQR(albums$sales)   # 3사분위에서 1사분위를 뺀 값

boxplot(albums$sales)


# 이상치 판별

sales4 = c(albums$sales, 450, 460, -100, -1000)

q = quantile(sales4)
boxplot(sales4)

# 이상치 하한 극단 경계값 찾기
bottom_outlier = q[2] - 1.5 * (q[4] - q[2])
bottom_outlier

# 이상치 상한 극단 경계값 찾기
top_outlier = q[4] + 1.5 * (q[4] - q[2])
top_outlier

# 실제로 극단값이 존재하는지 출력
sales4[sales4 < bottom_outlier]

sales4[sales4 > top_outlier]




