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
      redirect_to leaders_path, notice: "Leader created succesfully"
    else
      render "new"
    end
  end

    private

    def leader_params
      params.require(:leader).permit(:first_name, :last_name, :email,
                                    :telephone, :group_id)
    end
end
