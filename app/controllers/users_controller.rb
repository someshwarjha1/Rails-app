class UsersController < ApplicationController
    before_action :set_user, only: [:edit,:update,:show]
    def show
        
        @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end
    def index
        
        @users = User.paginate(page: params[:page], per_page: 5)
    end
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
            redirect_to users_path
        else
            render 'new'
        end
    end

    def edit 
    end

    def update

        
        if @user.update(user_params)
            flash[:notice] = "Edited Article successfully."
            redirect_to @user
        else 
            render 'edit'
        end
    end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end



end
