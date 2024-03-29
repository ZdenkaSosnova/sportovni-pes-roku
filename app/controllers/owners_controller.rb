class OwnersController < ApplicationController

    def show
        @owner = Owner.find(params[:id])
    end
    
    def new
        @owner = Owner.new
    end

    def create
        debugger
        @owner = Owner.new(params.require(:owner).permit(:first_name, :last_name, :email, :password))
        member = Member.find_by(first_name: params[:owner][:first_name], last_name: params[:owner][:last_name])
        if member.present? && !member.owner.present?
            @owner.member = member
        end
        if @owner.save
            session[:owner_id] = @owner.id
            flash[:notice] = "Člen #{@owner.first_name} #{@owner.last_name} byl úspěšně registrován"
            redirect_to owner_path(@owner)
        else
            render "new", status: 422
        end
    end

    def edit
        @owner = Owner.find(params[:id])
    end

    def update
        @owner = Owner.find(params[:id])
        if @owner.update(params.require(:owner).permit(:first_name, :last_name, :email, :password))
            flash[:notice] = "Váš účet byl úspěšně upraven"
            redirect_to members_path
        else
            render "edit"
        end
    end
end
