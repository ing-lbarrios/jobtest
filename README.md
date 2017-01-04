# jobtest
A beautiful blog system with APIs

# Run it!

* To run the posts API, go to the posts folder and run `rails server -p 5000`.
* To run the blog app, go to the blog folder and run `rails server`.

The posts API is consumed by an Client class called `SuperAgent`, located in `lib/`.

# Routes for (Blog)

```bash
Prefix Verb   URI Pattern               Controller#Action
posts GET    /posts(.:format)          posts#index
POST   /posts(.:format)          posts#create
new_post GET    /posts/new(.:format)      posts#new
edit_post GET    /posts/:id/edit(.:format) posts#edit
post GET    /posts/:id(.:format)      posts#show
PATCH  /posts/:id(.:format)      posts#update
PUT    /posts/:id(.:format)      posts#update
DELETE /posts/:id(.:format)      posts#destroy
```

# Routes for (Posts API)

```bash
Prefix Verb   URI Pattern            Controller#Action
posts GET    /posts(.:format)       posts#index
POST   /posts(.:format)       posts#create
post GET    /posts/:id(.:format)   posts#show
PATCH  /posts/:id(.:format)   posts#update
PUT    /posts/:id(.:format)   posts#update
DELETE /posts/:id(.:format)   posts#destroy
authors GET    /authors(.:format)     authors#index
POST   /authors(.:format)     authors#create
author GET    /authors/:id(.:format) authors#show
PATCH  /authors/:id(.:format) authors#update
PUT    /authors/:id(.:format) authors#update
DELETE /authors/:id(.:format) authors#destroy
```
