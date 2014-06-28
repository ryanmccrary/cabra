class LeadersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @leaders = Leader.all
  end
  def new
    @leader = Leader.new
  end
  def create
    @leader = Leader.new(leader_params)
    if @leader.save
      redirect_to leaders_path, notice: "Leader" + @leader.first_name + " successfully created"
    else
      render "new"
    end
  end
  def show
    
  end
  def edit
    @leader = Leader.find(params[:id])
  end
  def update
    @leader = Leader.find(params[:id])
    if @leader.update_attributes(leader_params)
      redirect_to groups_path, notice: @leader.first_name + " successfully updated!"
    else
      render "edit"
    end
  end

    private

    def leader_params
      params.require(:leader).permit(:first_name, :last_name, :email,
                                    :telephone, :group_id)
    end
end
