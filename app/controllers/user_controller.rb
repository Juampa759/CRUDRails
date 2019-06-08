class UserController < ApplicationController
  def index
    @all_users=User.all
  end
  def new
    @user=User.all
  end

  def create
    @user=User.new(name: params[:user][:name],
      phone: params[:user][:phone],
      email: params[:user][:email])
      if @user.save
        redirect_to action "index"
      else
        render :new
      end
  end
  def edit
    @user = User.find(params[:id])
    render :new
  end
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name],
      phone: params[:user][:phone],
      email: params[:user][:email])
      redirect_to action: "index"
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: "index"
  end
end
