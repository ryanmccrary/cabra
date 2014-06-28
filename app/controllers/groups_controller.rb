class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @groups = Group.all
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: "Group created"
    else
      render "new"
    end
  end
  def show
    @group = Group.find(params[:id])
  end
  def edit
    @group = Group.find(params[:id])
  end
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to groups_path, notice: "Group updated"
    else
      render "edit"
    end
  end

    private

    def group_params
      params.require(:group).permit(:name, :street, :city, 
                                    :state, :zip)
    end
end
