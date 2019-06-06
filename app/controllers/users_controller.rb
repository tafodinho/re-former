class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)

        if @user.save
          redirect_to new_user_path
        else
          render :new
        end
    end
    def edit
        set_user
    end
    def update
        set_user
        @user.update(user_params)   
        if @user.valid?     
            flash[:success] = "User updated successfully"
          redirect_to new_user_path
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to edit_user_path(@user)
        end
    end
    private
        def user_params
            params.require(:user).permit(:username,:email,:password)
        end
        def set_user  
            @user = User.find(params[:id])
          end
end
