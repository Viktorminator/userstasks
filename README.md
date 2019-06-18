# User create, login, update  
## create User  
```  
/api/users/create_user.php  
```  
body  
```json
{  
  "email" : "serhioramos@gmail.com",
  "password" : "123"
}  
```  
## login User  
```  
/api/login.php  
```  
body  
```json
{  
  "email" : "serhioramos@gmail.com",
  "password" : "123"
}  
```  
## update User  
```  
/api/users/update_user.php  
```  
body  
```json
{
  "email":"viktorio_updated@gmail.com", 
  "password": "123",
  "jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0ZG9pdHNvZnR3YXJlLmxvY2FsIiwiYXVkIjoiaHR0cDpcL1wvdGVzdGRvaXRzb2Z0d2FyZS5sb2NhbCIsImlhdCI6MTM1Njk5OTUyNCwibmJmIjoxMzU3MDAwMDAwLCJkYXRhIjp7ImlkIjoiMjIiLCJlbWFpbCI6InZpa3RvcmlvQGdtYWlsLmNvbSJ9fQ.mpSsf4Ky1sg30JS9wHInvPuiVUhhCleLMSZ_xHN6sB4"
}
```
# Tasks get all, for User by jwt with ordering
## get all Tasks (this works without authorisation)
```  
/api/task/read.php  
```
## get all Tasks for User
```
/api/task/read_paging.php
```
### order by 'id' (default) 'DESC'
body
```json
{
  "jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0ZG9pdHNvZnR3YXJlLmxvY2FsIiwiYXVkIjoiaHR0cDpcL1wvdGVzdGRvaXRzb2Z0d2FyZS5sb2NhbCIsImlhdCI6MTM1Njk5OTUyNCwibmJmIjoxMzU3MDAwMDAwLCJkYXRhIjp7ImlkIjoiMjQiLCJlbWFpbCI6IjExMUBnbWFpbC5jb20ifX0.UDdS5joCP65uVdFsDegR2HMHiMOSrZlCRMo4EY0nBQc", 
  "order":"DESC"
}
```
### order by 'priority' 'DESC' (also can be used order by 'title', 'due_date')
```json
{
  "jwt":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90ZXN0ZG9pdHNvZnR3YXJlLmxvY2FsIiwiYXVkIjoiaHR0cDpcL1wvdGVzdGRvaXRzb2Z0d2FyZS5sb2NhbCIsImlhdCI6MTM1Njk5OTUyNCwibmJmIjoxMzU3MDAwMDAwLCJkYXRhIjp7ImlkIjoiMjQiLCJlbWFpbCI6IjExMUBnbWFpbC5jb20ifX0.UDdS5joCP65uVdFsDegR2HMHiMOSrZlCRMo4EY0nBQc", 
  "order":"DESC", 
  "order_by":"priority",
}
```
## create Task (this works without authorisation)  
```  
/api/task/create.php  
```  
body:  
```json
{  
  "description" : "This task is totally undone.",  
  "user_id" : 20,  
  "active" : 1
}  
```  
## update Task  
```  
/api/task/update.php  
```  
body:  
```json
{  
  "description" : "This task is totally undone.",  
  "user_id" : 20,  
  "id": 12,  
  "active" : 1
}  
```  
## delete Task  
```  
/api/task/delete.php  
```  
body:
```json
{  
  "id": 12  
}  
```
