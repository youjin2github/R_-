# filter() 행 추출
# select() 열(변수) 추출
# arrange() 정렬
# mutate() 변수 추가
# summarise() 통계치 산출
# group_by() 집단별로 나누기
# left_join() 데이터 합치기(열)
# bind_rows() 데이터 합치기(행)

# dplyr 패키지 
library(dplyr)
exam = read.csv("csv_exam.csv")

# 행추출
# 데이터 %>% filter(조건) : 조건을 만족하는 행을 추출
exam %>% filter(class == 1)
# & 그리고 | 또는
# 데이터 %>% filter( 열 %in% c(조건1,조건2))
# %in% 조건 매칭 확인

# 열추출
exam %>% select(english)
exam %>% select(-math)

exam %>% filter(class == 2) %>%select(math)

# 정렬하기
# 오름차순
exam %>% arrange(math)
# 내림차순
exam %>% arrange(desc(math))

# 파생변수 추가하기
exam %>% mutate(total = math + english + science)
exam %>% mutate(test_score = ifelse(math >= 80, 'pass', 'fail'))

# 가로로 합치기
test1 = data.frame(id = c(1,2,3,4,5),
                   midterm = c(34,24,55,55,43))
test2 = data.frame(id = c(1,2,3,4,5),
                   final = c(45,25,34,23,45))
total = left_join(test1, test2, by = 'id')

# 세로로 합치기
group_a = data.frame(id = c(1,2,3,4,5),
                     test = c(60, 80, 50, 70,80))
group_b = data.frame(id = c(6,7,8,9,10),
                     score = c(45,34,53,23,34))
group_total = bind_rows(group_a, group_b)
