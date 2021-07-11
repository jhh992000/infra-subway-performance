<p align="center">
    <img width="200px;" src="https://raw.githubusercontent.com/woowacourse/atdd-subway-admin-frontend/master/images/main_logo.png"/>
</p>
<p align="center">
  <img alt="npm" src="https://img.shields.io/badge/npm-%3E%3D%205.5.0-blue">
  <img alt="node" src="https://img.shields.io/badge/node-%3E%3D%209.3.0-blue">
  <a href="https://edu.nextstep.camp/c/R89PYi5H" alt="nextstep atdd">
    <img alt="Website" src="https://img.shields.io/website?url=https%3A%2F%2Fedu.nextstep.camp%2Fc%2FR89PYi5H">
  </a>
  <img alt="GitHub" src="https://img.shields.io/github/license/next-step/atdd-subway-service">
</p>

<br>

# 인프라공방 샘플 서비스 - 지하철 노선도

<br>

## 🚀 Getting Started

### Install
#### npm 설치
```
cd frontend
npm install
```
> `frontend` 디렉토리에서 수행해야 합니다.

### Usage
#### webpack server 구동
```
npm run dev
```
#### application 구동
```
./gradlew clean build
```
<br>

## 미션

* 미션 진행 후에 아래 질문의 답을 작성하여 PR을 보내주세요.

### 1단계 - 화면 응답 개선하기
1. 성능 개선 결과를 공유해주세요 (Smoke, Load, Stress 테스트 결과)
    ```javascript
    - 공통 테스트 조건
        - 실패율은 0% 인 경우만 기록
        - 요청의 99%가 1.5초 이내에 완료되어야 함
        - 측정구분값은 최대 가상유저수(vus)와 요청당 평균처리시간(http_req_duration)으로 함
    ```

    - 접속 빈도가 높은 페이지 (로그인 요청)

      <table>
      <thead>
      <tr>
          <th>시나리오</th>
          <th>구분</th>
          <th>개선전</th>
          <th>개선후 (동일조건)</th>
          <th>개선후 (vus증가)</th>
          <th>개선후 (was+1)</th>
          <th>개선후 (was+3)</th>
      </tr>
      </thead>
      <tbody>
      <tr>
          <td rowspan="2">Smoke</td>
          <td>max vus</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
          <td>1</td>
      </tr>
      <tr>
          <td>http_req_duration</td>
          <td>14.34ms</td>
          <td>11.04ms</td>
          <td>14.46ms</td>
          <td>9.47ms</td>
          <td>12.33ms</td>
      </tr>
      <tr>
          <td rowspan="2">Load</td>
          <td>max vus</td>
          <td>200</td>
          <td>200</td>
          <td>300</td>
          <td>300</td>
          <td>300</td>
      </tr>
      <tr>
          <td>http_req_duration</td>
          <td>74.41ms</td>
          <td>81.44ms</td>
          <td>135.59ms</td>
          <td>85.34ms</td>
          <td>36.61ms</td>
      </tr>
      <tr>
          <td rowspan="2">Stress</td>
          <td>max vus</td>
          <td>250</td>
          <td>250</td>
          <td>500</td>
          <td>500</td>
          <td>500</td>
      </tr>
      <tr>
          <td>http_req_duration</td>
          <td>504ms</td>
          <td>158.66ms</td>
          <td>317.51ms</td>
          <td>219.28ms</td>
          <td>83.19ms</td>
      </tr>
      </tbody>
      </table>

    - 데이터를 갱신하는 페이지 (회원가입을 요청)

       <table>
       <thead>
       <tr>
           <th>시나리오</th>
           <th>구분</th>
           <th>개선전</th>
           <th>개선후 (동일조건)</th>
           <th>개선후 (vus증가)</th>
           <th>개선후 (was+1)</th>
           <th>개선후 (was+3)</th>
       </tr>
       </thead>
       <tbody>
       <tr>
           <td rowspan="2">Smoke</td>
           <td>max vus</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>16.05ms</td>
           <td>11.32ms</td>
           <td>11.94ms</td>
           <td>12.09ms</td>
           <td>11.44ms</td>
       </tr>
       <tr>
           <td rowspan="2">Load</td>
           <td>max vus</td>
           <td>200</td>
           <td>200</td>
           <td>300</td>
           <td>300</td>
           <td>300</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>80.41ms</td>
           <td>80.3ms</td>
           <td>106.2ms</td>
           <td>71.72ms</td>
           <td>33.6ms</td>
       </tr>
       <tr>
           <td rowspan="2">Stress</td>
           <td>max vus</td>
           <td>250</td>
           <td>250</td>
           <td>500</td>
           <td>500</td>
           <td>500</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>153.63ms</td>
           <td>151.29</td>
           <td>247.2ms</td>
           <td>174.65ms</td>
           <td>79.22ms</td>
       </tr>
       </tbody>
       </table>

    - 데이터를 조회하는데 여러 데이터를 참조하는 페이지 (로그인 후 경로를 검색)

       <table>
       <thead>
       <tr>
           <th>시나리오</th>
           <th>구분</th>
           <th>개선전</th>
           <th>개선후 (동일조건)</th>
           <th>개선후 (vus증가)</th>
           <th>개선후 (was+1)</th>
           <th>개선후 (was+3)</th>
       </tr>
       </thead>
       <tbody>
       <tr>
           <td rowspan="2">Smoke</td>
           <td>max vus</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
           <td>1</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>27.07ms</td>
           <td>17.36ms</td>
           <td>18.25ms</td>
           <td>11.84ms</td>
           <td>27.23ms</td>
       </tr>
       <tr>
           <td rowspan="2">Load</td>
           <td>max vus</td>
           <td>200</td>
           <td>200</td>
           <td>300</td>
           <td>300</td>
           <td>300</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>266.66ms</td>
           <td>242.73ms</td>
           <td>209.74ms</td>
           <td>106.03ms</td>
           <td>40.57ms</td>
       </tr>
       <tr>
           <td rowspan="2">Stress</td>
           <td>max vus</td>
           <td>250</td>
           <td>250</td>
           <td>500</td>
           <td>500</td>
           <td>500</td>
       </tr>
       <tr>
           <td>http_req_duration</td>
           <td>557.94ms</td>
           <td>543.63ms</td>
           <td>511.72ms</td>
           <td>243.14ms</td>
           <td>85.02ms</td>
       </tr>
       </tbody>
       </table>

2. 어떤 부분을 개선해보셨나요? 과정을 설명해주세요

    - 정적파일 경량화 (css를 main.js로 통합)
    - 렌더링 차단 리소스 제거하기 (js defer 적용)
    - nginx : gzip 압축 적용
    - nginx : worker 옵션 변경
        - worker_processes : auto
        - worker_connections : 1024
    - nginx : http2 적용
    - nginx : 로드밸런싱 알고리즘 변경 (round robin -> least connection)
    - nginx : 정적파일 cache 적용 (css,js,gif,png,jpg,jpeg)
    - was : 경로 찾기 캐시 적용 (redis)
    - was 인스턴스 추가

   ```javascript
      (개선후 PageSpeed 측정값)
      - First Contentful Paint : 14.8 -> 1.7
      - Time to Interactive : 15.8 -> 5.3
      - Speed Index : 14.8 -> 3.7
      - Total Blocking Time : 960 -> 840
      - Largest Contentful Paint : 15.9 -> 5.3
   ```

   - 인스턴스 scaleUp, scaleOut 후 부하테스트
      - reverse proxy : scale up (t2.medium -> t2.large)
      - was : scale out (인스턴스 5개)
      - db : scale up (t2.medium -> t2.large)
      ```javascript
      // 데이터를 조회하는데 여러 데이터를 참조하는 페이지로 테스트
      export let options = {
         stages: [
            { duration: '5s', target: 500 },
            { duration: '10s', target: 1000 },
            { duration: '20s', target: 2000 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '30s', target: 3000 },
            { duration: '30s', target: 2500 },
            { duration: '10s', target: 2000 },
            { duration: '5s', target: 1000 },
            { duration: '5s', target: 500 },
         ],
      
         thresholds: {
            http_req_duration: ['p(99)<1500'], // 99% of requests must complete below 1.5s
         },
      };
      ```
      ```javascript
      max = 14414.95ms, p(90) = 786.81ms, p(95) = 1036.40ms, avg = 503.54ms, min = 7.19ms, med = 380.00msINFO[0629] 
           ✓ 메인페이지가 정상적으로 응답함
           ✓ 로그인이 정상적으로 처리됨
           ✓ 나의 즐겨찾기 목록이 정상적으로 조회됨
           ✓ 경로가 정상적으로 검색됨
      
           checks.........................: 100.00% ✓ 3235856     ✗ 0      
           data_received..................: 1.9 GB  3.1 MB/s
           data_sent......................: 455 MB  728 kB/s
           http_req_blocked...............: avg=389.54µs min=0s      med=0s       max=8.56s   p(90)=1µs      p(95)=1µs  
           http_req_connecting............: avg=110.22µs min=0s      med=0s       max=1.8s    p(90)=0s       p(95)=0s   
         ✓ http_req_duration..............: avg=503.53ms min=7.18ms  med=380ms    max=14.41s  p(90)=786.81ms p(95)=1.03s
             { expected_response:true }...: avg=503.53ms min=7.18ms  med=380ms    max=14.41s  p(90)=786.81ms p(95)=1.03s
           http_req_failed................: 0.00%   ✓ 0           ✗ 3235856
           http_req_receiving.............: avg=53.74µs  min=16µs    med=46µs     max=17.09ms p(90)=72µs     p(95)=87µs 
           http_req_sending...............: avg=43.06µs  min=11µs    med=34µs     max=16.08ms p(90)=65µs     p(95)=79µs 
           http_req_tls_handshaking.......: avg=278.53µs min=0s      med=0s       max=7.63s   p(90)=0s       p(95)=0s   
           http_req_waiting...............: avg=503.44ms min=7.13ms  med=379.91ms max=14.41s  p(90)=786.7ms  p(95)=1.03s
           http_reqs......................: 3235856 5175.009258/s
           iteration_duration.............: avg=2.03s    min=41.79ms med=2.03s    max=15.75s  p(90)=2.57s    p(95)=2.81s
           iterations.....................: 808964  1293.752314/s
           vus............................: 508     min=100       max=3000 
           vus_max........................: 3000    min=3000      max=3000   source=console
      ```

   - reverse proxy를 scaleUp 하고 was를 5대로 늘렸더니 아래 사진처럼 db에 병목이 생기더군요.
   ![image](https://user-images.githubusercontent.com/67728580/125015249-149fa100-e0aa-11eb-9294-eae5b1886eb5.png)
   
   - 그래서 간단하게 db 인스턴스를 t2.large로 한단계 scaleUp 해보았는데요. reverse proxy와 was의 cpu 점유율이 오르긴 했지만, 그래도 db의 병목발생은 여전했습니다. 
   - db 인스턴스를 하나 늘려주면 병목이 해결될것 같습니다. (미션의 내용에 있는 db이중화는 1대의 서버내에서 인스턴스 분리만 하는거라 실제 성능향상은 크게 없는것 같습니다.)
   - 실제 운영시에는 예상 사용자수를 고려해서 이번 테스트처럼 서버들을 확충해나가면 될것 같다는 생각이 드네요.
   - aws를 마음껏 써볼수 있는 기회라서 놓치면 안되겠다는 생각에 한번 시도해보았는데요. 재미있고 의미있는 경험을 해보게 된 것 같습니다.
     ![image](https://user-images.githubusercontent.com/67728580/125015555-aad3c700-e0aa-11eb-93ef-38d356cd2b82.png)
   

---

### 2단계 - 조회 성능 개선하기
1. 인덱스 적용해보기 실습을 진행해본 과정을 공유해주세요

      ```sql
      -- 실습전 각 테이블에 누락된 pk와 fk를 모두 생성해주었습니다.

      -- pk 생성
      ALTER TABLE subway.covid ADD CONSTRAINT pk_covid PRIMARY KEY (id);
      
      ALTER TABLE subway.programmer ADD CONSTRAINT pk_programmer PRIMARY KEY (id);
      
      ALTER TABLE subway.hospital ADD CONSTRAINT pk_hospital PRIMARY KEY (id);
      
      -- fk 생성
      ALTER TABLE subway.covid ADD CONSTRAINT fk_covid_member_id FOREIGN KEY (member_id) REFERENCES subway.`member`(id);
      
      ALTER TABLE subway.programmer ADD CONSTRAINT fk_programmer_member_id FOREIGN KEY (member_id) REFERENCES subway.`member`(id);
      
      ALTER TABLE subway.covid MODIFY COLUMN hospital_id int(11) NULL;
      
      ALTER TABLE subway.covid ADD CONSTRAINT fk_covid_hospital_id FOREIGN KEY (hospital_id) REFERENCES subway.hospital(id);

      ```

      - [x] Coding as a Hobby 와 같은 결과를 반환하세요.
         ```sql
         -- 인덱스 생성
         CREATE INDEX idx_programmer_hobby ON programmer(hobby);
         
         -- 조회
         select
             hobby,
             ((count(hobby)/(select count(hobby) from programmer)) * 100) as percentage
         from programmer
         group by hobby
         order by hobby desc;
         ```

        <img src="https://user-images.githubusercontent.com/67728580/125132965-13b94e80-e140-11eb-8d3f-5ca342fa0139.png" width="350" />

         ```sql
            - programmer 테이블의 hobby 컬럼에 인덱스를 생성하여 인덱스 검색이 되도록 하였습니다.
         ```
      
      - [x] 프로그래머별로 해당하는 병원 이름을 반환하세요. (covid.id, hospital.name)
         ```sql
         -- 인덱스 생성
         CREATE INDEX idx_covid_pgrm_hsptl ON covid(programmer_id, hospital_id);

         -- 조회
         select
             p.id as programer_id,
             h.name as hospital_name
         from
             programmer p,
             hospital h,
             (
             select programmer_id, hospital_id from covid
             where programmer_id is not null
             limit 0, 10
             ) t
         where p.id = t.programmer_id
         and t.hospital_id = h.id;
         ```
        <img src="https://user-images.githubusercontent.com/67728580/125135564-2cc3fe80-e144-11eb-8376-a158e6ebe4dd.png" width="600" />
        
         ```sql
            - 데이터가 9만건이 넘어서 페이징을 적용했습니다.
            - 진료기록에 페이징을 하여 범위를 축소한다음 축소한 데이터에서 프로그래머와 병원정보를 조인하여 데이터를 조회합니다.
            - 프로그래머의 정렬을 위하여 인덱스를 생성해주었습니다.
         ```
      
      - [x] 프로그래밍이 취미인 학생 혹은 주니어(0-2년)들이 다닌 병원 이름을 반환하고 user.id 기준으로 정렬하세요. (covid.id, hospital.name, user.Hobby, user.DevType, user.YearsCoding)
         ```sql
         -- 조회
         select
            c.id as covid_id,
            h.name as hospital_name,
            u.hobby,
            u.dev_type,
            u.years_coding
         from
            covid c,
            hospital h,
            (
               select
                  p.id,
                  p.hobby,
                  p.dev_type,
                  p.years_coding
               from
                   programmer p
               where
                   (p.hobby = 'yes' or years_coding = '0-2 years')
               limit 0, 10
            ) u
         where
             c.hospital_id = h.id
         and
             u.id = c.programmer_id;
         ```

        <img src="https://user-images.githubusercontent.com/67728580/125136271-782adc80-e145-11eb-9cf2-dcb1f2df4440.png" width="600" />
        
         ```sql
         - 이 쿼리도 데이터량이 많아서 페이징 적용했구요. 먼저 프로그래머 테이블을 페이징하여 범위를 축소한다음, 축소한 데이터를 다른 테이블과 조인하여 추가 데이터를 조회하였습니다.
         - 이전에 생성해두었던 idx_covid_pgrm_hsptl 인덱스가 재사용되었습니다.
         ```
      
      - [x] 서울대병원에 다닌 20대 India 환자들을 병원에 머문 기간별로 집계하세요. (covid.Stay)
         ```sql
         -- 병원명 필드 타입 변경
         ALTER TABLE subway.hospital MODIFY COLUMN name VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;
         
         -- 병원명 인덱스 생성
         CREATE INDEX idx_hospital_name ON hospital(name);
         
         -- 조회
         select
            c.stay,
            count(m.id) member_cnt
         from
               (select id from hospital where name = "서울대병원") h,
               covid c,
               (
                  select
                     m.id
                  from
                     programmer p, member m
                  where
                     p.member_id = m.id
                    and
                     m.age between 20 and 29
                    and
                     p.country = 'India'
               ) m
         where
            h.id = c.hospital_id
           and
            c.member_id = m.id
         group by
            c.stay
         order by
            c.stay;
         ```

        <img src="https://user-images.githubusercontent.com/67728580/125138167-1e2c1600-e149-11eb-93f1-59f39e4b45bf.png" width="800" />
        
         ```sql
         - 병원명의 필드가 대량문자열을 저장할수있는 TEXT 타입으로 되어있어서 VARCHAR로 변경했습니다.
         - 병원명의 인덱스를 생성했습니다.
         - India에 사는 20대를 범위를 축소한다음 진료기록과 병원을 조인하여 그룹핑하여 통계를 산출했습니다.
         ```
      
      - [x] 서울대병원에 다닌 30대 환자들을 운동 횟수별로 집계하세요. (user.Exercise)
         ```sql
         select
             p.exercise,
             count(p.id) member_cnt
         from
             (select id from subway.member where age between 30 and 39) m,
             (select member_id, hospital_id, programmer_id from subway.covid) c,
             (select id from subway.hospital where name = '서울대병원') h,
             (select id, exercise from subway.programmer) p
         where m.id = c.member_id
         and c.hospital_id = h.id
         and c.programmer_id = p.id
         group by
             p.exercise;
         ```

        <img src="https://user-images.githubusercontent.com/67728580/125138595-e4a7da80-e149-11eb-853b-4e750f353fd2.png" width="800" />
        
         ```sql
         - 서브쿼리를 작성하여 범위축소가능한 테이블들의 데이터수를 줄였고, 필요한 컬럼만 조회를 하였습니다.
         - 이전에 생성해 둔 인덱스들이 적절히 활용되어졌습니다.
         ```

2. 페이징 쿼리를 적용한 API endpoint를 알려주세요

   ```
   로그인계정 : test@test.com / 1234
   
   https://jhh992000.ddns.net/favorites
   ```