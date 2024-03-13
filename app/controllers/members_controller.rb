class MembersController < ApplicationController
    def index
        @members = Member.all
    end

    def show
        @member = Member.find(params[:id])
        @owner = Owner.find_by(member_id: @member.id)
        @dogs = Dog.where(owner_id: @owner.id)
    end
end