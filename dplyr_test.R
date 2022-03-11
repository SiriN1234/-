install.packages("magrittr")
install.packages("dplyr")
library(dplyr)
library(magrittr)

mpg1 = read.csv("public_dataset/mpg1.csv",
                stringsAsFactors = F)
str(mpg1)

mpg1_rename1 = mpg1 %>%
  rename(transmission = trans,
         drive_method = drv,
         city = cty,
         highway = hwy)

str(mpg1_rename1)

mpg2_rename2 = rename(mpg1,
                      transmission = trans,
                      drive_method = drv,
                      city = cty,
                      highway = hwy)

str(mpg2_rename2)

str(mpg1)

count(mpg1, trans)
count(mpg1, drv)

class(count(mpg1, trans))

table(mpg1$trans)

mpg1_1 = mpg1 %>%
  select(manufacturer, trans, cty)
str(mpg1_1)

mpg1_2 = select(mpg1, manufacturer, trans, cty)
str(mpg1_2)

mpg1_t1 = mpg1 %>% select(-manufacturer, -trans)
str(mpg1_t1)

mpg1 %>% slice(1,4,5) # 1,4,5번째만 출력

mpg1 %>% filter(manufacturer == "hyundai") # 조건을 만족하는 것만 출력


# 연습문제 6-1

install.packages("hflights")
library(hflights)
hflights = hflights::hflights # library와 다르게 임시로 씀

# hflights(패키지명)::hflights(함수명)

# 1번

hflights1 = hflights %>%
  select(Month, FlightNum, Dest, Distance)

hflights1 %>% slice(1, 2, 3)
head(hflights1, 3)

# 2번

hflights1 = hflights1 %>%
  rename(month = Month,
         flight_no = FlightNum,
         dest = Dest,
         distance = Distance)
                     
head(hflights1, 2)

# 3번

hflights1 = hflights1 %>% # select로 순서 바꿀 수 있음
  select(dest, month, flight_no, distance)

head(hflights1, 2)



# 연습문제 6-2

# 1번

hflights2 = hflights %>%
  select(Month, FlightNum, Dest, Distance)

hflights2 %>% slice(22, 23, 91, 92)
# 22~23은 22:23으로 표현 가능
# 91~92는 91:92로 표현 가능

# 2번

mean(hflights2$Distance) #mean은 평균값
min(hflights2$Distance) #min은 최소값

# 3번

hflights2 %>% 
  select(Dest) %>%
  filter(hflights2$Distance == min(hflights2$Distance))

# 4번

hflights2_1 = hflights2 %>%
  filter(hflights2$Distance >= mean(hflights2$Distance))

dim(hflights2_1)


# 연습문제 6-3

# 1번

hflights3 = hflights %>%
  select(Month, FlightNum, Dest, Distance)

hflights3_1 = hflights3 %>%
  count(Dest)

head(hflights3_1, 2)

hflights3


# 2번

hflights3_1 %>%
  filter(hflights3_1$n == max(hflights3_1$n))


# 3번

hflights3_2 = hflights3 %>%
  filter(Distance >= median(hflights3$Distance) & Month == 1)

dim(hflights3_2)


# 4번

hflights3_3 = hflights3 %>%
  filter(Month >= 3 & Month <= 5)

dim(hflights3_3)


# 5번

hflights3_4 = hflights3 %>%
  filter(Distance <= 1000 & Month >= 9 & Month <= 11 & FlightNum >= 2000)

dim(hflights3_4)



# 연습문제 6-4

# 1번

library(ggplot2)
diamonds = ggplot2::diamonds

diamonds %>%
  group_by(cut) %>%
  summarise(mean = mean(price))


# 2번

diamonds %>%
  group_by(cut) %>%
  summarise(n = n()) %>%
  mutate(pct = n / sum(n) * 100)

# 3번

diamonds %>%
  filter((cut == "Premium" | cut == "Ideal") & (color == "D" | color == "E")) %>%
  group_by(cut, color) %>%
  summarise(n = n(), mean = mean(price))

