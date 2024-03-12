class OwnersController < ApplicationController
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(params.require(:owner).permit(:name, :email, :password))
        if @owner.save
            flash[:notice] = "#{@owner.name} welcome"
            redirect_to dogs_path
        else
            render "new", status: 422
        end
    end
end