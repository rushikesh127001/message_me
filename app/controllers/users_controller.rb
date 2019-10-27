class UsersController<ApplicationController

    def new
        @user=User.new
        
    end 
    
    def create
        @user = User.new(user_params)
        @user.save
        
        if @user.save
            flash[:success]="account created"
            redirect_to login_path
        else
            flash.now[:alert]="sorry wrong input"

            render 'new'
        end    


    end    

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

end    