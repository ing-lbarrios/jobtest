# jobtest
A beautiful blog system with APIs

### Run it!

* To run the posts API, go to the posts folder and run `rails server -p 5000`.
* To run the blog app, go to the blog folder and run `rails server`.

The posts API is consumed by an Client class called `SuperAgent`, located in `lib/`.

### Routes for (Blog)

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

### Routes for (Posts API)

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

### Tasks 

* Fork this repo. 
* Go ahead and resolve and complete these tasks. You can work on them on any order, is not necessary to complete all of them.
* *Posts* CRUD is almost done. Add missing to code to submit a post and display it.
* SuperAgent class is huge, DRY it up and fix whatever you see is not correct.
* SuperAgent class need some tests. Look at the example `spec/lib/super_agent_spec.rb`.
* In order to create posts you need some authors in your database. Create a rake task in post API to achieve this.
* Check *Posts* API models (author, post) and look for other way to improve validations.

* When you're done, create a pull request against base fork `estebanz01/jobtest`

