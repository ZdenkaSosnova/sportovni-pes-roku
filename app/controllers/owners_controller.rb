class OwnersController < ApplicationController
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(params.require(:owner).permit(:name, :email, :password))
        if @owner.save
            flash[:notice] = "New member was succesfully created"
            redirect_to dogs_path
        else
            render "new", status: 422
        end
    end
end