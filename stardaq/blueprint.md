# Stardaq

## posts [/posts]

## posts [/posts/{id}]

### get /posts/:id [GET]
+ Request
    + Parameters
        + id - post id
+ Response 200
    
    


# Data Structures

## Place Create (object)

- name: `Battery Harris` (string, required) - Name of the place.
- lat: `40.712017` (number, required) - Latitude as a decimal.
- lon: `-73.950995` (number, required) - Longitude as a decimal.
- status (enum[string])
  - pending - They haven't finished their public profile or whatever.
  - active - Good as gold.
  - closed - This place doesn't exist.

## Place Full (object)

- id: `fRge5` (string, required) - The unique ID of the place.
- Include Place Create
- created_at: `2015-01-07T14:03:43Z` (string, required) - ISO8601 dat

