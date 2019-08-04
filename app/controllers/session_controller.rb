class SessionController < ApplicationController
    before_action :already_signed_in, only:[:new,:create]

    def new
        

    end    

    def create 
        user=User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id]=user.id
            flash[:success]="You Have Successfully Logged In "
            redirect_to root_path
        else
            flash.now[:alert]="Wrong Credentials Trty Again"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id]= nil
        flash[:success]="You Have Been Logged Out :) "
        redirect_to login_path
    end    

    private
        def already_signed_in
            if logged_in?
                flash[:alert]="You Are Already Logged In"
                
                redirect_to root_path
            end
        end        
end    