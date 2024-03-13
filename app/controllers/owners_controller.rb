class OwnersController < ApplicationController
    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(params.require(:owner).permit(:first_name, :last_name, :email, :password))
        member = Member.find_by(first_name: params[:owner][:first_name], last_name: params[:owner][:last_name])
        if member.present? && !member.owner.present?
            @owner.member = member
        end
        if @owner.save
            flash[:notice] = "#{@owner.first_name} welcome"
            redirect_to dogs_path
        else
            render "new", status: 422
        end
    end
end
