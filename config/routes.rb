Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "books#index"
  # Routes for the Group resource:

  # CREATE
  get("/groups/new", { :controller => "groups", :action => "new_form" })
  post("/create_group", { :controller => "groups", :action => "create_row" })

  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  get("/groups/:id_to_display", { :controller => "groups", :action => "show" })

  # UPDATE
  get("/groups/:prefill_with_id/edit", { :controller => "groups", :action => "edit_form" })
  post("/update_group/:id_to_modify", { :controller => "groups", :action => "update_row" })

  # DELETE
  get("/delete_group/:id_to_remove", { :controller => "groups", :action => "destroy_row" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  get("/reviews/new", { :controller => "reviews", :action => "new_form" })
  post("/create_review", { :controller => "reviews", :action => "create_row" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:id_to_display", { :controller => "reviews", :action => "show" })

  # UPDATE
  get("/reviews/:prefill_with_id/edit", { :controller => "reviews", :action => "edit_form" })
  post("/update_review/:id_to_modify", { :controller => "reviews", :action => "update_row" })

  # DELETE
  get("/delete_review/:id_to_remove", { :controller => "reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Book resource:

  # CREATE
  get("/books/new", { :controller => "books", :action => "new_form" })
  post("/create_book", { :controller => "books", :action => "create_row" })

  # READ
  get("/books", { :controller => "books", :action => "index" })
  get("/books/:id_to_display", { :controller => "books", :action => "show" })

  # UPDATE
  get("/books/:prefill_with_id/edit", { :controller => "books", :action => "edit_form" })
  post("/update_book/:id_to_modify", { :controller => "books", :action => "update_row" })

  # DELETE
  get("/delete_book/:id_to_remove", { :controller => "books", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
