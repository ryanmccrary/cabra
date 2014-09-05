class LeadernotesController < ApplicationController

  def new
    @leadernote = Leadernote.new
  end

  def create
    @leadernote = Leadernote.new(note_params)
    if @leadernote.save
      redirect_to leader_path(@leadernote.leader), notice: "Successfully created note"
    else
      redirect_to leader_path(@leadernote.leader), notice: "Failed to create note, try again"
    end
  end


  private

  def note_params
    params.require(:leadernote).permit(:copy, :leader_id, :user_id)
  end
end