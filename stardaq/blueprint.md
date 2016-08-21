FORMAT: 1A

# Stardaq


## /tokens

### POST
+ Request
    + Attributes
        + source (source)
        + token
        + user_id
+ Response 200
    + Attributes (token)


## /me
### POST
+ Request
    + Attributes
        + source (source)
        + token
        + name
        + email
        + avatar_url
        + sex (enum)
            - male
            - female
        + age (number)
        + phone
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

## /me/sms_codes/:code

### GET
+ Request
    + Parameters
        + phone
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
+ Response 200
    + Attributes (array[user])


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

## /stars/:id/activities

### GET
차트데이터
+ Request
    + Parameters
        + period (enum) 
            - weekly
            - monthly
            - yearly
        + thing (enum)
            - value
            - activity
            - rank
+ Response 200
    + Attributes (array[activity_ext])

## /stars/:id/stocks

### GET
보유량 랭킹
+ Response 200
    + Attributes (array[stock])



## /transactions

### POST
+ Request
    + Attributes (transaction)
+ Response 200

### GET
+ Response 200
    + Attributes (array[transaction])



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



## /star_posts
same with recommend_posts

### GET
+ Request
    + Parameters
        + since - post id, return posts greater than since
+ Response 200 
    + Attributes (array[post])

### POST
+ Request
    + Attributes (star_post)
+ Response 200 

## /star_posts/:id

### GET
+ Response 200 (post)

### PUT
+ Request
    + Attributes (star_post)
+ Response 200 

### DELETE
+ Response 200 



## /ipo_requests

### POST
+ Request
    + Attributes (ipo_request)
+ Response 200 

### GET
+ Response 200
    + Attributes (array[ipo_request])

## /ipo_requests/:id

### GET
+ Response 200
    + Attributes (ipo_request)

### PUT
+ Request
    + Attributes (ipo_request)
+ Response 200 

## /ipo_requests/:id/accept
### PUT
admin only
+ Response 200 

## /ipo_requests/:id/refuse
### PUT
admin only
+ Response 200 

## /ipo_requests/:id/participants

### POST
+ Response 200 

### GET
+ Response 200 
    + Attributes (array[user])

## /ipo_requests/:id/participants/:user_id

### DELETE
+ Response 200



# Data Structures

## star
- _id - get only
- name
- category (category)
- stock (number) - # of stocks
- active (boolean)
- birth: `2008-01-14T04:33:35Z`
- height (number) - cm
- weight (number) - kg
- education
- company
- bio - 나머지 정보들
- image
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## user
- _id - get only
- name
- email
- coin (number)
- sex (enum)
    - male
    - female
- age (number)
- phone
- avatar_url
- active (boolean)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## oauth_token
- _id - get only
- source (source)
- token
- expires (number) - in minutes
- source_user_id
- user
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## stock
- _id - get only
- user
- star
- amount (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## transaction
for logging
- _id - get only
- date: `2008-01-14T04:33:35Z`
- user
- star
- amount (number) - # of stocks (+/-)
- activities (array[activity])
- created_at: `2008-01-14T04:33:35Z`
- updated_at: `2008-01-14T04:33:35Z`

## activity
price 이력 계산시 쓰임, embedded to (transaction)
- _id - get only
- star
- amount (number)

## activity_ext (activity)
- date: `2008-01-14T04:33:35Z`

## star_post
- _id - get only
- title
- url
- star
- user
- image
- view_count (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## recommend_post (star_post)

## post_comment
- _id - get only
- post
- user
- text
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## post_like
- _id - get only
- post
- user
- created_at: `2008-01-14T04:33:35Z`
- updated_at: `2008-01-14T04:33:35Z`

## post_read
- _id - get only
- post
- user
- is_read (boolean)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## report
- _id - get only
- category (enum)
    - user
    - post
    - comment
- thing - user id, post id, comment id
- user
- reason
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## ipo_request
- _id - get only
- category (category)
- star
- user
- participants (array[user])
- works - 수상이력
- image
- view_count (number)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## precaution_star
- _id - get only
- star
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## notification
- _id - get only
- user
- star - related star id
- type (enum) - not defined yet
- message
- is_read (boolean)
- created_at: `2008-01-14T04:33:35Z` - get only
- updated_at: `2008-01-14T04:33:35Z` - get only

## star_ext (star)
- portion: 0.22 (number) - 인기도
- price (number)
- change (number) - 전일비
- change_net: 0.5 (number) - 등락율
- activity_count (number) - 거래량
- weekly_ranks (array[number])

## post (star_post)
- like_count
- comment_count

## category (enum)
- actor
- actress
- athlete
- male_singer
- female_singer
- politician

## source (enum)
- facebook

## token
- token
- user_id
- expires (number) - in minutes

## error
- code (number, optional) - not http status code
- message


