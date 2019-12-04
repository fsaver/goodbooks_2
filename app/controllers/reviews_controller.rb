class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_review_user
    review = Review.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == review.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @reviews = Review.page(params[:page]).per(10)

    render("review_templates/index.html.erb")
  end

  def show
    @group = Group.new
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.user_id = params.fetch("user_id")
    @review.book_id = params.fetch("book_id")
    @review.format = params.fetch("format")
    @review.pages_read = params.fetch("pages_read")
    @review.rating = params.fetch("rating")
    @review.review = params.fetch("review")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/reviews", :notice => "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_book
    @review = Review.new

    @review.user_id = params.fetch("user_id")
    @review.book_id = params.fetch("book_id")
    @review.format = params.fetch("format")
    @review.pages_read = params.fetch("pages_read")
    @review.rating = params.fetch("rating")
    @review.review = params.fetch("review")

    if @review.valid?
      @review.save

      redirect_to("/books/#{@review.book_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    
    @review.book_id = params.fetch("book_id")
    @review.format = params.fetch("format")
    @review.pages_read = params.fetch("pages_read")
    @review.rating = params.fetch("rating")
    @review.review = params.fetch("review")

    if @review.valid?
      @review.save

      redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/users/#{@review.user_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_book
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/books/#{@review.book_id}", notice: "Review deleted successfully.")
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/reviews", :notice => "Review deleted successfully.")
  end
end
