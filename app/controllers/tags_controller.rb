class TagsController < ApplicationController
  def show
    @tag = params[:id]
    @workout_sessions = WorkoutSession.tagged_with(params[:id])
  end

end
