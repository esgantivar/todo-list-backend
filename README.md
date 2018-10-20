# TODO List - Backend

Para ejecutar el proyecto
```
$ git clone
$ cd [nombre de la carpeta]
$ bundle install
$ rake db:migrate
$ rails server
```
### URLs
```
Verb   URI Pattern
GET    /
POST   /api/auth(.:format)                                                                
POST   /api/v1/user(.:format)                                                               
GET    /api/v1/user/:id(.:format)                                                               
GET    /api/v1/list/:list_id/item(.:format)                                                     
POST   /api/v1/list/:list_id/item(.:format)                                                                                                                 
GET    /api/v1/list/:list_id/item/:id(.:format)                                                                                
PUT    /api/v1/list/:list_id/item/:id(.:format)                                                 
DELETE /api/v1/list/:list_id/item/:id(.:format)                                                 
GET    /api/v1/list(.:format)                                                                   
POST   /api/v1/list(.:format)                                                                                                                                                             
GET    /api/v1/list/:id(.:format)                                                                                                                  
PUT    /api/v1/list/:id(.:format)                                                               
DELETE /api/v1/list/:id(.:format)                                                               
```

[Link Aplicación Desplegada](https://fede-todo-list.herokuapp.com/)