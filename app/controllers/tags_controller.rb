class TagsController < ApplicationController
  def show
    @workout_sessions = WorkoutSession.tagged_with(params[:id])
  end

end
