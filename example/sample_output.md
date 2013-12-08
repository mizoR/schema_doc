
# blogs

## Blog

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| name | Name | varchar(255) | false |  | 255 |
| owner_id | Owner | integer | false |  |  |

# entries

## Entry

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| title | Title | varchar(255) | false |  | 255 |
| body | Body | varchar(255) | false |  | 255 |

# users

## User

| name | human name | sql type | primary | default | limit |
| ---- | ---------- | -------- | ------- | ------- | ----- |
| id | Id | INTEGER | true |  |  |
| nick | Nick | varchar(255) | false |  | 255 |

