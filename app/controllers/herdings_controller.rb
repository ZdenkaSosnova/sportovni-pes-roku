class HerdingsController < ApplicationController
    def index
        entries_grouped_by_dog = Herding.all.group_by(&:dog_id)
        dog_points = {}
        entries_grouped_by_dog.each do |dog_id, entries|
            total_points = entries.sum(&:final_points)
            dog_points[dog_id] = total_points
        end
        sorted_dog_points = dog_points.sort_by { |_dog_id, points| -points }
        @top_10_dogs_dictionary = sorted_dog_points.take(10)
    end
    
    def new
        @herding = Herding.new
        @dog_id = params[:dog_id]
    end

    def create
        @herding = Herding.new(params.require(:herding).permit(:category, :points, :position, :dog_id, :num_dogs))
        if @herding.save 
            flash[:notice] = "Záznam byl úspěšně přidán"
            redirect_to dog_path(params[:herding][:dog_id])
        else
            @dog_id = params[:herding][:dog_id]
            render "new", status: 422
        end
    end

    def edit
        @herding = Herding.find_by(dog_id: params[:id])
        @dog_id = params[:dog_id]
    end

    def update
        @herding = Herding.find(params[:id])
        if @herding.update(params.require(:herding).permit(:category, :points, :position, :dog_id, :num_dogs))
            flash[:notice] = "Záznam byl úspěšně upraven"
            redirect_to dog_path(params[:herding][:dog_id])
        else 
            render "edit", status: 422
        end
    end

    def destroy
        debugger
        @herding = Herding.find(params[:id])
        dog_id = @herding.dog_id
        @herding.destroy
        redirect_to dog_path(dog_id)
    end

end





