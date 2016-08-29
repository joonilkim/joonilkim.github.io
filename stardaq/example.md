FORMAT: 1A

# Stardaq

## /tokens

### POST

source, source_token, source_token_expires

+ Request
  + Parameters
    + source
    + token
    + expires

## /me

### POST

### GET

### PUT

### DEL

## /auth_codes

### POST - 핸폰인증번호 요청

## /auth_codes/{code}

### GET - valid check


## /posts

## /posts/{id}

### GET

+ Request
    + Parameters
        + id - post id
+ Response 200
    + Attributes (Place)
    
### POST

### PUT


# Data Structures

## category
- name

## star
- name
- category
- stock - # of stocks
- is_active
- birth
- physical
- education
- company
- bio
- image

## user
- name
- email
- coin
- sex
- age
- phone

## oauth_token
- source
- token
- expires
- source_user_id
- user

## notification
- user
- star - related star id
- type
- message
- is_read

## post
- type
- title
- url
- star
- user
- image
- view_count

## post_comment
- post
- user
- text

## post_like
- post
- user

## post_read
- post
- user
- is_read

## report
- category - user, board, comment
- thing
- user
- reason

## stock
- user
- star
- amount

## transaction - for logging
- date
- user
- celeb
- amount - # of stocks (+/-)
- stock  - price 이력 계산시 쓰임
  - celeb
  - amount

## new_star_post - 예치금?
- category
- star
- user
- participants
- works
- image
- view_count

precaution_star
- star

## Place (object)

- name: Battery Harris (string, required) - Name of the place.
- lat: 40.712017 (number, required) - Latitude as a decimal.
- lon (number, required) - Longitude as a decimal.
- status (enum[string])
  - pending - They haven't finished their public profile or whatever.
  - active - Good as gold.
  - closed - This place doesn't exist.

