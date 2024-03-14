class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def create 
        @dog = Dog.new(params.require(:dog).permit(:dog_name, :date_of_birth))
        @dog.owner = Owner.first
        if @dog.save 
            flash[:notice] = "Member was successfully created."
            redirect_to owner_path(Owner.find(@dog.owner_id))
        else
            render "new", status: 422
        end
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        if @dog.update(params.require(:dog).permit(:dog_name, :date_of_birth))
            flash[:notice] = "Details about your dog were successfully updated."
            redirect_to owner_path(Owner.find(@dog.owner_id))
        else
            render "edit", status: 422
        end
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to owner_path(Owner.find(@dog.owner_id))
    end
end