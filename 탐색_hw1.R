### R-Object
## 1.
#1)
x = c(17,16,20,24,22,15,21,18) #x벡터 설정
x[x>=20] #20이상만 출력
#2)
y <- vector() # 빈 벡터 설정
for (i in 1:8)
{
  #20이상이면 y에 100으로 나머지는 그대로 입력
  if(x[i]>=20) y[i]=100 
  else y[i]=x[i]
}
y

## 2.
#1)
x = matrix(rep(-1,25),5,5) #-1로만 이루어진 5x5행렬 설정
a = c(3,4,5,6,7) #대각성분만 다르므로 따로 벡터 설정
for(i in 1:5)
{
  #대각부분만 정한걸로 대체
  x[i,i]=a[i]
}
#2)
y = x[,-5] #5열만 삭제한 형태를 y행렬에 저장
#3)
yinfo = c(nrow(y),ncol(y)) #yinfo벡터에 y행렬의 행,열의 수를 저장
#4)
#y의 행렬의 성분 수를 고려해 성분이 0인 y1행렬을 설정
y1=matrix(rep(0,yinfo[1]*yinfo[2]),yinfo[1],yinfo[2]) 
for(i in 1:yinfo[1])
{
  for(j in 1:yinfo[2])
  {
    #y의 성분이 -1이면 0이되게 하고 나머지는 y의 성분을 그대로 가져옴
    if(y[i,j]==-1) y1[i,j]=0
    else y1[i,j]=y[i,j]
  }
}

## 3. rowdata.txt라는 데이터파일이 없어 코드를 어떤식으로
##    짜야할지만 적어보았습니다.
# 1)
# read.table을 이용해 rdata에 저장

# 2)
# is.na 함수를 이용

# 3)
# for 문을 통해 각 행별로 if문을 이용하여
# v2와 v3가 동시에 NA가 아닌경우의 행의 숫자를 저장한다.

# 4)
# 3)에서의 경우에 데이터 프레임 rdata1에 저장한다.

## 4.
# 1)
# 리스트의 1~3번째 위치는 특이한 경우이므로 따로지정
a = c(TRUE, FALSE)
b = diag(1,2)
c = seq(0,1,length = 100)
# 문제에서 요구하는 리스트 생성
temp <- list(a,b,c,1,2,3,4)
temp

# 2)
temp[[2]] <- NULL
temp

# 3)
temp[[3]]

# 4)
length(temp)

## 5.
# 1)
a1 <- -1:2
a2 <- 1:2
a1 + a2
# 결과 : 0 2 2 4
# 설명 : a1에 -1 0 1 2 가 저장되고 a2에 1 2 가 저장되어
#        길이가 맞지 않아 a2가 1 2 1 2 로 인식되어 더해져 0 2 2 4가 나온다.

# 2)
a1 <- -(1:2)
a2 <- 1:2
a1 + a2
# 결과 : 0 0
# 설명 : a1에는 -1 -2 가 저장되고 a2는 1 2 가 저장되어 더해져서 0 0 이 나온다.

# 3)
a1 <- matrix(0,2,2)
a2 <- c(3,4)
a1 + a2
# 결과 : 3  4
#        3  4
# 설명 : a1은 성분이 0인 2by2 행렬이 저장되고 a2는 3 4 인 벡터가 저장된다.
#        여기서 a2가 더 짧아 3 4 3 4 순으로 a1의 각 성분에 더해지는데
#        열순서로 우선 더해져서 1행 1열에 3이 2행 1열에 4가 더해지는 식으로 진행된다.

# 4)
a1 <- matrix(1:4,2,2)
a1[a1>2] = 0
a1
# 결과 : 1  0
#        2  0
# 설명 : a1의 행렬 성분 중 2보다 큰 3과 4 인 성분은 0으로 바뀐다.

# 5)
a1 <- 1:5
a1[-1] - a1[-length(a1)]
# 결과 : 1 1 1 1
# 설명 : a1[-1]은 a1의 1번째 성분이 삭제 되어 2 3 4 5가 되고
#        a1[-length(a1)]은 length(a1)이 5이므로 5번째 성분이 삭제되어 1 2 3 4가 되어
#        이를 서로 빼면 1 1 1 1이 된다.





### R-Programming
## 1.
a <- vector() # 빈 벡터 설정
a[1] = 1 # 주어진 a1 입력
a[2] = 3 # 주어진 a2 입력
for(i in 3:20)
{
  # 식에 해당하게 for문으로 반복되며 수열을 계산
  a[i] = 0.9*a[i-1] - 0.1*a[i-2] + 1
}
a[20]

## 2.
# 1번에서 구한 a벡터에서 4보다 큰 성분을 발견하면 
#그때의 i를 n에 저장하고 break로 반복문을 탈출
for(i in 1:20)
{
  if(a[i] > 4)
  {
    n = i
    break
  }
}
n

## 3. 
A <- matrix( runif(100), 50, 5) # 50행 5열 행력 생성
v <- rep(0,50) #성분이 0인 크기 50의 벡터 생성
for(i in 1:50)
{
  #각 행의 성분을 더해서 v벡터에 저장
  v[i] = sum(A[i,])
}

## 4. 
tmp = rep(0, 10)
a <- 10:1
idx = 1
for ( j in a)
{
  if (j<5)
  {
    tmp[idx] <- a[j]
    idx <- idx + 1
  }
}
tmp
# 결과 값 tmp = 7 8 9 10 0 0 0 0 0 0

## 5. 
# 관측치에 대한 정보가 따로없어
# 임의로 1~10범위의 5000개의 난수를 생성해 x행렬에 저장
x <- matrix(runif(5000,1,10), 1000, 5)
# 0.50000001~10(0.5는 반올림시 0이 되므로) 사이의 난수를 생성하여 반올림을 통해
# 1~10 사이의 정수가 일정한 확률로 나오도록 난수를 생성하여 sid에 저장
sid <- round(runif(1000,0.50000001,10.5),0)
sid

## 6-1
# 성분이 모두 0인 10by5의 행렬 생성
m.mat = matrix(rep(0,50),10,5)

for(i in 1:10)
{
  # sid가 i값을 가지는 위치들의 벡터를 a에 저장
  a = c((which(sid==i)))
  s_data <- rep(0,5) # 앞으로 더할 데이터 합의 벡터 s_data 생성
  for(j in a)
  {
    # sid가 i값을 가지는 위치의 값들을 더해감
    s_data = s_data + x[j,]
  }
  m.mat[i,] = s_data / length(a) # 더한값을 a의 길이로 나누어 평균을 m.mat에 저장
}
m.mat

## 6-2
idist <- matrix(rep(0,10000),1000,10)
for(i in 1:1000)
{
  a = x[i,] # 관측치

  for(j in 1:10)
  {
    b = m.mat[sid[j],] # 각 평균값
    # 거리를 구하기 위한 변수 설정
    xy = 0
    xx = 0
    yy = 0
    for(k in 1:5)
    {
      xy = xy + a[k]*b[k]
      xx = xx + a[k]^2
      yy = yy + b[k]^2
    }
    # 관측치와 각 sid의 평균치와의 거리를 idist에 저장
    idist[i,j] <- xy/(sqrt(xx*yy))
  }
}
idist

## 7.
ivec <- vector()
for(i in 1:1000)
{
  # idist의 각 행의 가장 짧은 거리의 위치(sid평균)를 추출
  ivec[i] <- which.min(idist[i,])
}
ivec

## 8.
# rpois 함수 사용시 0의 결과도 나와서 +1을 해도 1이되어
# 경기가 성립되지않아 +2로 수정하였음
set.seed(1)
a = list()
for (i in 1:1000)
{
  x = rpois(1,4)+2 
  x = min(x,10)
  a[[i]] = sample(1:10, x)
}
# 1)
# freq라는 빈 벡터 설정
freq <- vector()
length_a <- vector() # length_a라는 빈 벡터 설정
for(i in 1:1000)
{
  # 각 게임별 출전선수를 세기 위해 각 리스트의 길이를 저장
  length_a[i] <- length(a[[i]])
}
for(j in 1:10)
{
  # 리스트 길이가 같은 것의 수를 freq에 저장
  freq[j] <- length(which(length_a == j))
}
# freq는 참여인원 별 경기 수가 된다. 1명이 참가한 경기는 없으므로 0이 됨
freq

# 2)
score <- rep(0,10) # score라는 모두 0점인 벡터 설정
for( i in 1:1000)
{
  # 문제가 이상하여 맨 위에 출전선수를 2~3명 출전으로 임의로 고쳐서 풀었음
  # 2~3명 출전인 경우 1등만 1점
  if(length_a[i] >= 2 & length_a[i] <= 3 )
  {
    first <- a[[i]][1] # 1등이 누구인지 first에 입력
    score[first] <- score[first] + 1 # 1등의 선수의 점수를 1점 추가
  }
  # 4~6명 출전인 경우 1등 2점, 2등 1점
  else if(length_a[i] >= 4 & length_a[i] <= 6 )
  {
    # 위와 같은 논리로 1,2등에게 점수 추가
    first <- a[[i]][1]
    second <- a[[i]][2]
    score[first] <- score[first] + 2
    score[second] <- score[second] + 1
  }
  # 7~10명 출전인 경우 1등 3점, 2등 2점, 3등 1점
  else
  { # 위와 같은 논리로 1,2,3등에게 점수 추가
    first <- a[[i]][1]
    second <- a[[i]][2]
    third <- a[[i]][3]
    score[first] <- score[first] + 3
    score[second] <- score[second] + 2
    score[third] <- score[third] + 1
  }
}
score
which.max(score)

## 9.
# 1)
set.seed(1)
m1 = 10
m2 = 5
num = 0

for(i in 1:4)
{
  # 0 또는 1의 난수 a 생성
  a = rbinom(1,1,1/2)
  # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
  if( a == 0 )
  {
    m1 = m1 - 1
    m2 = m2 + 1
  }
  else
  {
    m1 = m1 + 1
    m2 = m2 - 1
  }
}
m1

# 2)
set.seed(1)
m1 = 10
m2 = 5
num = 0

# A, B군이 모두 0이 아닌 동안 실행
while(m1 != 0 & m2 != 0)
{
  # 게임 실행 횟수 num
  num = num + 1
  # 0 또는 1의 난수 a 생성
  a = rbinom(1,1,1/2)
  # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
  if( a == 0 )
  {
    m1 = m1 - 1
    m2 = m2 + 1
  }
  else
  {
    m1 = m1 + 1
    m2 = m2 - 1
  }
}
num
m1
m2

# 3)
win_A_num = 0 # A,B군의 최종 승리 횟수
win_B_num = 0
for (k in 1:200)
{
  set.seed(k)
  m1 = 10
  m2 = 5
  num = 0
  
  # A, B군이 모두 0이 아닌 동안 실행
  while(m1 != 0 & m2 != 0)
  {
    # 게임 실행 횟수 num
    num = num + 1
    # 0 또는 1의 난수 a 생성
    a = rbinom(1,1,1/2)
    # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
    if( a == 0 )
    {
      m1 = m1 - 1
      m2 = m2 + 1
    }
    else
    {
      m1 = m1 + 1
      m2 = m2 - 1
    }
  }
  if(m1 == 15) win_A_num = win_A_num + 1
  if(m2 == 15) win_B_num = win_B_num + 1
}
win_A_num
win_B_num

## 10.
# 1) B군 10원
win_A_num = 0 # A,B군의 최종 승리 횟수
win_B_num = 0
for (k in 1:200)
{
  set.seed(k)
  m1 = 10
  m2 = 10
  num = 0
  
  # A, B군이 모두 0이 아닌 동안 실행
  while(m1 != 0 & m2 != 0)
  {
    # 게임 실행 횟수 num
    num = num + 1
    # 0 또는 1의 난수 a 생성
    a = rbinom(1,1,1/2)
    # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
    if( a == 0 )
    {
      m1 = m1 - 1
      m2 = m2 + 1
    }
    else
    {
      m1 = m1 + 1
      m2 = m2 - 1
    }
  }
  if(m1 == 20) win_A_num = win_A_num + 1
  if(m2 == 20) win_B_num = win_B_num + 1
}
win_A_num
win_B_num

rate_win_A = win_A_num / ( win_A_num + win_B_num )
rate_win_A

# 2) B군 15원
win_A_num = 0 # A,B군의 최종 승리 횟수
win_B_num = 0
for (k in 1:200)
{
  set.seed(k)
  m1 = 10
  m2 = 15
  num = 0
  
  # A, B군이 모두 0이 아닌 동안 실행
  while(m1 != 0 & m2 != 0)
  {
    # 게임 실행 횟수 num
    num = num + 1
    # 0 또는 1의 난수 a 생성
    a = rbinom(1,1,1/2)
    # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
    if( a == 0 )
    {
      m1 = m1 - 1
      m2 = m2 + 1
    }
    else
    {
      m1 = m1 + 1
      m2 = m2 - 1
    }
  }
  if(m1 == 25) win_A_num = win_A_num + 1
  if(m2 == 25) win_B_num = win_B_num + 1
}
win_A_num
win_B_num

rate_win_A = win_A_num / ( win_A_num + win_B_num )
rate_win_A

# 3) B군 20원
win_A_num = 0 # A,B군의 최종 승리 횟수
win_B_num = 0
for (k in 1:200)
{
  set.seed(k)
  m1 = 10
  m2 = 20
  num = 0
  
  # A, B군이 모두 0이 아닌 동안 실행
  while(m1 != 0 & m2 != 0)
  {
    # 게임 실행 횟수 num
    num = num + 1
    # 0 또는 1의 난수 a 생성
    a = rbinom(1,1,1/2)
    # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
    if( a == 0 )
    {
      m1 = m1 - 1
      m2 = m2 + 1
    }
    else
    {
      m1 = m1 + 1
      m2 = m2 - 1
    }
  }
  if(m1 == 30) win_A_num = win_A_num + 1
  if(m2 == 30) win_B_num = win_B_num + 1
}
win_A_num
win_B_num

rate_win_A = win_A_num / ( win_A_num + win_B_num )
rate_win_A

# 4) B군 25원
win_A_num = 0 # A,B군의 최종 승리 횟수
win_B_num = 0
for (k in 1:200)
{
  set.seed(k)
  m1 = 10
  m2 = 25
  num = 0
  
  # A, B군이 모두 0이 아닌 동안 실행
  while(m1 != 0 & m2 != 0)
  {
    # 게임 실행 횟수 num
    num = num + 1
    # 0 또는 1의 난수 a 생성
    a = rbinom(1,1,1/2)
    # 난수 a가 0이면 A군이 B군에게 1원을 k가 1이면 그 반대를 실행
    if( a == 0 )
    {
      m1 = m1 - 1
      m2 = m2 + 1
    }
    else
    {
      m1 = m1 + 1
      m2 = m2 - 1
    }
  }
  if(m1 == 35) win_A_num = win_A_num + 1
  if(m2 == 35) win_B_num = win_B_num + 1
}
win_A_num
win_B_num

rate_win_A = win_A_num / ( win_A_num + win_B_num )
rate_win_A

