df = data.frame(sex = c("M","F",NA,"M","F"),
                score = c(5,4,3,4,NA))
# 결측치 확인하기
is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

# 결측치 제거하기
# 결측치가 있는 행 제거하기
library(dplyr)
df %>% filter(is.na(score))
df_nomiss = df %>% filter(!is.na(score) & !is.na(sex))
mean(df_nomiss$score)
# 결측치가 하나라도 있으면 제거하기
df_nomiss = na.omit(df)
# 결측치 제거하고 평균, 합계
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

# 평균으로 결측치 대체하기 
mean(exam$math, na.rm = T)
exam$math = ifelse(is.na(exam$math), 57.45, exam$math)
table(is.na(exam$math))

# 이상치 제거하기
outlier = data.frame(sex = c(1,2,1,3,2,1),
                     score = c(5,4,3,4,2,6))

table(outlier$sex)
table(outlier$score)
# 이상치 결측 처리하기
outlier$sex = ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score = ifelse(outlier$score > 5, NA, outlier$score)
# 결측치를 제거하고 성별에 따른 평균을 구하기
outlier %>% filter(!is.na(score) & !is.na(sex)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))
