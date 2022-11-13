exam = read.csv("csv_exam.csv")
head(exam)
tail(exam)
View(exam) #뷰 창에서 데이터 확인하기
dim(exam) #행, 열 출력
str(exam) #데이터 속성 확인
summary(exam) #요약 통계량 산출하기

# 변수명 변경하기
library(dplyr)
df_raw = data.frame(var1 = c(1,2,1),
                    var2 = c(2,3,2))
# 복사본 만들기
df_new = df_raw
# 변수명 바꾸기
df_new = rename(df_new, v2 = var2)

# 파생변수 만들기
df = data.frame(var1 = c(1,2,1),
                    var2 = c(2,3,2))
df$sum = df$var1 + df$var2
df$test = ifelse(df$sum >= 3, 'pass', 'fail')
