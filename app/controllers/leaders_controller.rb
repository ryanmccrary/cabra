class LeadersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @leaders = Leader.all
  end
  def new
    @leader = Leader.new
  end
end
