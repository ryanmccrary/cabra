class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @group = Group.new
  end
end
