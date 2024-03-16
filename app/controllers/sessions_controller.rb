class SessionsController < ApplicationController
    def new
    end

    def create
        owner = Owner.find_by(email: params[:session][:email])
        if owner && owner.authenticate(params[:session][:password])
            session[:owner_id] = owner.id
            flash[:notice] = "Logged in succesfully"
            redirect_to owner_path(owner)
        else
            flash.now[:alert] = "There was something wrong"
            render "new"
        end
    end

    def destroy
        session[:owner_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end