class UsersController < ApplicationController

  def all_users
    matching_users = User.all
    @users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/all_users.html.erb"})
  end
  
  def user_details
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb"})
  end
  
  def create
    input_username = params.fetch("query_username")
    new_user = User.new
    new_user.username = input_username
    new_user.save
    
    redirect_to("/users/" + new_user.username)
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :username => user_id })
    the_user = matching_users.at(0)
    
    input_username = params.fetch("query_username")
    the_user.username = input_username
    the_user.save
    redirect_to("/users/" + the_user.username)

    
  end

end
