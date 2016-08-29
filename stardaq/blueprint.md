FORMAT: 1A

# Stardaq


## /me
### POST
+ Request
    + Attributes (user)
+ Response 200
    + Attributes (token)

### GET
+ Response 200
  + Attributes (user)

### PUT
+ Request
    + Attributes (user)
+ Response 200

## /me/sms_codes

### POST
핸폰인증번호 요청
+ Request
    + Attributes
        + phone
+ Response 200

## /me/sms_codes/verify

### PUT
+ Request
    + Attributes
        + phone
        + code
+ Response 200
+ Response 404
    + Attributes (error)


## /users

### GET
admin only
+ Response 200
    + Attributes (user)

## /users/:id

### GET
403: request 유저가 프로필 미공개인 경우
+ Response 200
    + Attributes (array[user])
+ Response 403
    + Attributes (error)

## /stars

### GET
+ Request
    + Parameters
      + category (category, optional)
+ Response 200
    + Attributes (array[star_ext])

### POST
admin only
+ Request
    + Attributes (star)
+ Response 200

## /stars/:id

### GET
+ Response 200
    + Attributes (star_ext)

### PUT
admin only
+ Request
    + Attributes (star)
+ Response 200

### DELETE
admin only
+ Response 200

## /stars/:id/histories

### GET
차트데이터
+ Request
    + Parameters
        + period (enum) 
            - daily
            - weekly
            - monthly
            - yearly
        + thing (enum)
            - value
            - history
            - rank
+ Response 200
    + Attributes (array[history_ext])

## /stars/:id/stocks

### GET
보유량(고수) 랭킹
+ Response 200
    + Attributes (array[stock])


## /orders

### POST
412: 총보유머니가 체결 총액보다 작은 경우
+ Request
    + Attributes (order)
+ Response 200
+ Response 412
    + Attributes (error)

### GET
+ Response 200
    + Attributes (array[order])



## /notifications

### POST
admin only
+ Request
    + Attributes (notification)
+ Response 200

### GET
+ Response 200
    + Attributes (array[notification])

## /notifications/:id

### GET
+ Response 200
    + Attributes (notification)

### DELETE
+ Response 200



## /posts

### GET
+ Request
    + Parameters
        + since - post id
        + limit (number)
+ Response 200 
    + Attributes (array[post_ext])

### POST
+ Request
    + Attributes (post)
+ Response 200 

## /posts/:id

### GET
+ Response 200 
    + Attributes (post_ext)

### PUT
+ Request
    + Attributes (post)
+ Response 200 

### DELETE
+ Response 200 


## /posts/:id/comments

### POST
+ Request
    + Attributes (comment)
+ Response 200 

### GET
+ Request
    + Parameters
        + since - comment id
        + limit (number)
+ Response 200 
    + Attributes (array[comment])

## /posts/:id/comments/:comment_id

### PUT
+ Request
    + Attributes (comment)
+ Response 200 

### DELETE
+ Response 200 

## /posts/:id/like

### PUT
+ Response 200 



## /listings

### POST
신규 종목 신청.  409: 이미 존재하는 경우. 412: 예치금 부족
+ Request
    + Attributes (listing)
+ Response 200 
+ Response 409
    + Attributes (error)
+ Response 412
    + Attributes (error)
        - confirm_price (number) - 최근 가격
        - confirm_net_price (number) - 체결 총액

### GET
+ Response 200
    + Attributes (array[listing])

## /listings/:id

### GET
+ Response 200
    + Attributes (listing)
        - target_price (number)
        - current_price (number)
        - participant_count (number)
        - comment_count (number)
        - like_count (number)

### PUT
412: 예치금 부족
+ Request
    + Attributes (listing)
+ Response 200 
+ Response 412
    + Attributes (error)

## /listings/:id/accept
### PUT
admin only
+ Response 200 

## /listings/:id/refuse
### PUT
admin only
+ Response 200 

## /listings/:id/participants

### POST
412: 예치금 부족
+ Request
    + Attributes (participant)
+ Response 200 
+ Response 412
    + Attributes (error)

### GET
+ Response 200 
    + Attributes (array[participant])

## /listings/:id/participants/:user_id

### GET
+ Response 200 
    + Attributes (participant)

### PUT
412: 예치금 부족
+ Request
    + Attributes (participant)
+ Response 200 
+ Response 412
    + Attributes (error)

### DELETE
+ Response 200



## /listing/:id/comments

### POST
+ Request
    + Attributes (listing_comment)
+ Response 200 

### GET
+ Request
    + Parameters
        + since - comment id
        + limit (number)
+ Response 200 
    + Attributes (array[listing_comment])

## /listing/:id/comments/:comment_id

### PUT
+ Request
    + Attributes (listing_comment)
+ Response 200 

### DELETE
+ Response 200 

## /listing/:id/like

### PUT
+ Response 200 



## /notices

### GET
+ Response 200 
    + Attributes (array[notice])

### POST
Admin only
+ Request
    + Attributes (notice)
+ Response 200 


## /notices/:id

### GET
+ Response 200 
    + Attributes (notice)

### PUT
Admin only
+ Request
    + Attributes (notice)
+ Response 200 

### DELETE
Admin only
+ Response 200



## /faqs

### GET
+ Response 200 
    + Attributes (array[faq])

### POST
Admin only
+ Request
    + Attributes (faq)
+ Response 200 


## /faqs/:id

### GET
+ Response 200 
    + Attributes (faq)

### PUT
Admin only
+ Request
    + Attributes (faq)
+ Response 200 

### DELETE
Admin only
+ Response 200


## /reports

### GET
유저인 경우 자기꺼만, 관리자인 경우 전체
+ Response 200 
    + Attributes (array[report])

### POST
+ Request
    + Attributes (report)
+ Response 200 


## /reports/:id

### GET
+ Response 200 
    + Attributes (report)

### PUT
+ Request
    + Attributes (report)
+ Response 200 

### DELETE
+ Response 200


## /reports/:id/confirm

### PUT
Admin only
+ Request
    + Attributes
        + notify_to_reporter (boolean) - 작성자
        + notify_to_reportee (boolean) - 신고당한 사람
+ Response 200 


## /delistings

### GET
Admin only
+ Response 200 
    + Attributes (array[delisting])

## /delistings/:id

### GET
Admin only
+ Response 200 
    + Attributes (delisting)

### PUT
Admin only
+ Request
    + Attributes (delisting)
+ Response 200 

### DELETE
Admin only
+ Response 200



## /app_versions

### GET
+ Response 200 
    + Attributes (array[app_version])

### POST
Admin only
+ Request
    + Attributes (app_version)
+ Response 200 


## /app_versions/:id

### GET
+ Response 200 
    + Attributes (app_version)

### PUT
Admin only
+ Request
    + Attributes (app_version)
+ Response 200 

### DELETE
Admin only
+ Response 200


## /events

### GET
+ Response 200
    + Attributes (array[event])

## /attendance_events

### POST
Admin only
+ Request
    + Attributes (attendance_event)
+ Response 200

## /attendance_events/:id

### GET
+ Response 200
    + Attributes (attendance_event)

### PUT
Admin only
+ Request
    + Attributes (attendance_event)
+ Response 200 

### DELETE
Admin only
+ Response 200

## /attendance_events/:id/attendances

### POST
409: 이미 존재하는 경우
+ Request
    + Attributes (attendance)
+ Response 200
+ Response 409
    + Attributes (error)

### GET
자기 출석 목록.. 1달간만..
+ Response 200
    + Attributes (array[attendance])


## /share_events

### POST
Admin only
+ Request
    + Attributes (share_event)
+ Response 200

## /share_events/:id

### GET
+ Response 200
    + Attributes (share_event)

### PUT
Admin only
+ Request
    + Attributes (share_event)
+ Response 200 

### DELETE
Admin only
+ Response 200

## /share_events/:id/shares

### POST
409: 이미 존재하는 경우
+ Request
    + Attributes (share)
+ Response 200
+ Response 409
    + Attributes (error)

### GET
Admin only. share한 사람 목록
+ Response 200
    + Attributes (array[share])


## /photo_events

### POST
Admin only
+ Request
    + Attributes (photo_event)
+ Response 200

## /photo_events/:id

### GET
+ Response 200
    + Attributes (photo_event)
        - player_count (number)

### PUT
Admin only
+ Request
    + Attributes (photo_event)
+ Response 200 

### DELETE
Admin only
+ Response 200

## /photo_events/:id/players

### POST
409: 이미 존재하는 경우. 412: 돈 부족
+ Request
    + Attributes (photo_event_player)
+ Response 200
+ Response 409
    + Attributes (error)
+ Response 412
    + Attributes (error)

### GET
+ Response 200
    + Attributes (array[photo_event_player])

## /photo_events/:id/players/:player

### GET
+ Response 200
    + Attributes (photo_event_player)

### PUT
+ Request
    + Attributes (photo_event_player)
+ Response 200 

### DELETE
+ Response 200

## /photo_events/:id/winners

### PATCH
변경되면 201, 아니면 200
+ Request
Array of user_id
    + Attributes (array[string])
+ Response 201
+ Response 200

### GET
+ Response 200
    + Attributes (array[user])

## /video_events

### POST
Admin Only
+ Request
    + Attributes (video_event)
+ Response 200

## /video_events/:id

### GET
+ Response 200
    + Attributes (video_event)
        - player_count (number)

### PUT
Admin only
+ Request
    + Attributes (video_event)
+ Response 200 

### DELETE
Admin only
+ Response 200

## /video_events/:id/players

### POST
409: 이미 존재하는 경우. 412: 돈 부족
+ Request
    + Attributes (video_event_player)
+ Response 200
+ Response 409
    + Attributes (error)
+ Response 412
    + Attributes (error)

### GET
+ Response 200
    + Attributes (array[video_event_player])

## /video_events/:id/players/:player

### GET
+ Response 200
    + Attributes (video_event_player)

### PUT
+ Request
    + Attributes (video_event_player)
+ Response 200 

### DELETE
+ Response 200

## /video_events/:id/winners

### PATCH
변경되면 201, 아니면 200
+ Request
Array of user_id
    + Attributes (array[string])
+ Response 201
+ Response 200

### GET
+ Response 200
    + Attributes (array[user])


## /predict_events

### POST
Admin Only
+ Request
    + Attributes (predict_event)
+ Response 200

## /predict_events/:id

### GET
+ Response 200
    + Attributes (predict_event)
        - player_count (number)

### PUT
Admin only
+ Request
    + Attributes (predict_event)
+ Response 200 

### DELETE
Admin only
+ Response 200

## /predict_events/:id/orders

### POST
412: 돈 부족
+ Request
    + Attributes (predict_order)
+ Response 200
+ Response 412
    + Attributes (error)

### GET
User 인 경우 해당 사용자만. Admin인 경우 전체 유저
+ Response 200
    + Attributes (array[predict_order])

## /predict_events/:id/winners

### PATCH
변경되면 201, 아니면 200
+ Request
Array of user_id
    + Attributes (array[string])
+ Response 201
+ Response 200

### GET
+ Response 200
    + Attributes (array[user])



## /admins

### POST
admin only
+ Request
    + Attributes (admin)
+ Response 200

### GET
admin only
+ Response 200
    + Attributes (array[admin])

## /admins/:id

### GET
admin only
+ Response 200
    + Attributes (admin)

### PUT
admin only
+ Request
    + Attributes (admin)
+ Response 200

### DELETE
admin only
+ Response 200

## /admin_tokens

### POST
admin only
+ Request
    + Attributes (admin)
+ Response 200
    + Attributes
        + token
        + admin - id of admin
        + expires (number) - in minutes


# Data Structures

## admin
- name
- password

## star
- _id - get only
- name
- category (category)
- active (boolean)
- birth: `2008-01-14T04:33:35Z`
- body_size - 키, 몸무게
- education
- company
- website_url
- biography - 나머지 정보들
- image
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## star_ext (star)
- up_position (number)
- down_position (number)
- price: 33.33 (number) - 인기도, price
- change (number) - 전일비
- change_ratio: 0.5 (number) - 등락율
- history_volume (number) - 거래량, sum of abs(position)
- weekly_ranks (array[number]) - [1주전, 2주전, 3주전]
- updated_at: `2008-01-14T04:33:35Z` - 기준시간

## order
- _id - get only
- user (user)
- star (star)
- position (number)
- histories (array[history])
- ordered_at: `2008-01-14T04:33:35Z` - order한 시간과 logging시간 다를 수 있음
- created_at: `2008-01-14T04:33:35Z`
- updated_at: `2008-01-14T04:33:35Z`

## history
- _id - get only
- star (star)
- position (number)

## history_ext (history)
- ordered_at: `2008-01-14T04:33:35Z`

## user
- _id - get only
- name
- email (string, optional)
- cash (number) - 스타달러
- sex (enum)
    - male
    - female
- age (number)
- phone
- avatar_url
- active (boolean)
- allows_push (boolean)
- oauthproviders (array[oauthprovider])
- is_public (boolean) - 프로파일 공개 여부
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## oauthprovider
- provider (provider)
- token
- user_id - user id of the provider service
- expires (number) - in minutes

## stock
- _id - get only
- user (user)
- star (star)
- position (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## post
- _id - get only
- type (enum)
    - star_post
    - reco_post
- title
- url
- star (star)
- user (user)
- image
- is_reported (boolean) - 비공개 여부
- read_count (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## comment
- _id - get only
- post
- user (user)
- text
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## like
- _id - get only
- post
- user (user)
- created_at: `2008-01-14T04:33:35Z`
- updated_at: `2008-01-14T04:33:35Z`

## report
- _id - get only
- category (enum)
    - user
    - post
    - comment
    - listing
    - listing_comment
- thing - user id, post id, comment id
- thing_user (user) - get only
- user (user)
- reason
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## listing
- _id - get only
- category (category)
- star (star)
- user (user)
- works - 수상이력
- website_url
- facebook_url
- image
- read_count (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## listing_comment (comment)

## listing_like (like)

## participant
- listing - id of listing
- user (user)
- position (number) - 음수 허용안됨

## delisting (star)

## to_delisting
- _id - get only, 관심종목
- star (star)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## notification
- _id - get only
- user (user)
- star (star) - related star id
- link_type (enum)
    - user
    - star_post
    - reco_post
    - star
- link_id - link_type과 link_id 조합으로 보여줘야할 페이지 알 수 있음
- message
- image
- is_read (boolean)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## verification
- phone
- code (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## app_version
- device (device)
- version
- url

## service_config
- join_reward (number)
- listing_reward (number)

## notice
- title
- content
- url
- device (device)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## faq
- title
- content
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## post_ext (post)
- like_count (number)
- comment_count (number)
- is_liked (boolean)
- is_commented (boolean)

## category (enum)
- actor
- actress
- athlete
- male_singer
- female_singer
- politician

## provider (enum)
- facebook
- kakao

## token
- token
- user - id of user
- expires (number) - in minutes

## device (enum)
- iphone
- android
- all

## error
- code (number, optional) - not http status code
- message

## event
- _id
- title
- sub_title
- content
- banner
- start_at
- end_at
- carriable (boolean) - 이월가능여부
- active (boolean)
- created_at

## attendance_event (event)
- day_reward
- week_reward
- month_reward

## attendance
- event (attendance_event)
- user (user)
- created_at

* attendance - 7*5일간 유저 구해서 %7=0이면 리워드. %30=0 이면 리워드. 35일 이전껀 삭제.

## share_event (event)
- provider (provider)
- share_reward

## share
- event (share_event)
- user (user)
- created_at

## photo_event (event)
- play_fee (number)
- game1_candidates (array[candidate])
- game2_candidates (array[candidate])

## candidate
- name
- image

## photo_event_player
- event (photo_event)
- user (user)
- order (array[number])

## photo_event_winner
- event (photo_event)
- winner (photo_event_player)

## video_event (event)
- play_fee (number)
- video (array[video])

## video
- title
- content
- stars (array[star])
- video_url

## video_event_player
- event (video_event)
- user (user)
- order (array[number])

## video_event_winner
- event (video_event)
- winner (video_event_player)

## event_type (enum)
- video
- predict
- photo
- attenance
- share

## predict_event (event)
- cadidates (array[star])

## predict_ox_event (predict_event)

## predict_order
- event (predict_event)
- user (user)
- order (order)

## predict_winner
- event (predict_event)
- winner (user)

