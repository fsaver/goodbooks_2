class GroupsController < ApplicationController
  def index
    @groups = Group.all

    render("group_templates/index.html.erb")
  end

  def show
    @group = Group.find(params.fetch("id_to_display"))

    render("group_templates/show.html.erb")
  end

  def new_form
    @group = Group.new

    render("group_templates/new_form.html.erb")
  end

  def create_row
    @group = Group.new

    @group.name = params.fetch("name")
    @group.user_id = params.fetch("user_id")
    @group.review_access_id = params.fetch("review_access_id")

    if @group.valid?
      @group.save

      redirect_back(:fallback_location => "/groups", :notice => "Group created successfully.")
    else
      render("group_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @group = Group.find(params.fetch("prefill_with_id"))

    render("group_templates/edit_form.html.erb")
  end

  def update_row
    @group = Group.find(params.fetch("id_to_modify"))

    @group.name = params.fetch("name")
    @group.user_id = params.fetch("user_id")
    @group.review_access_id = params.fetch("review_access_id")

    if @group.valid?
      @group.save

      redirect_to("/groups/#{@group.id}", :notice => "Group updated successfully.")
    else
      render("group_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_review_access
    @group = Group.find(params.fetch("id_to_remove"))

    @group.destroy

    redirect_to("/reviews/#{@group.review_access_id}", notice: "Group deleted successfully.")
  end

  def destroy_row
    @group = Group.find(params.fetch("id_to_remove"))

    @group.destroy

    redirect_to("/groups", :notice => "Group deleted successfully.")
  end
end
