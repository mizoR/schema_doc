# blogs

## Blog

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| name | Blog Name | varchar(255) | false |  | 255 |
| owner_id | Owner | integer | false |  |  |


# entries

## Entry

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| title | Entry Title | varchar(255) | false |  | 255 |
| body | Entry Body | varchar(255) | false |  | 255 |


# users

## User

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| nick | Nickname | varchar(255) | false |  | 255 |
