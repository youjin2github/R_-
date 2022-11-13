install.packages("readxl")
library(readxl)

# 파일 불러오기
# 외부 데이터 파일 불러오기
df_exam = read_excel("excel_exam.xlsx"); df_exam
# 다른 디렉토리 파일 불러오기
df_exam = read_excel("/Users/a1/Desktop/프로그래밍_R/excel_exam.xlsx") ; df_exam

# 첫번째 행이 변수명이 아닌 경우
df_exam = read_excel("excel_exam.xlsx", col_names = F)
# 여러개의 파일 시트를 불러오는 경우
df_exam = read_excel("excel_exam.xlsx", sheet = 1)

# 데이터 프레임을 csv파일로 저장하기
df_midterm = data.frame(english = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1,1,2,2))
write.csv(df_midterm, file = "df_midterm.csv")

# 데이터를 rds로 저장하기
saveRDS(df_midterm, file = "df_midterm.rds")
rm(df_midterm)
df_midterm = readRDS("df_midterm.rds")
