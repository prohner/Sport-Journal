class WorkoutSessionsController < ApplicationController
  def create
    @workout_session = WorkoutSession.new(params[:workout_session])
    respond_to do |format|
      format.html { redirect_to(users_url, :notice => 'Workout was successfully created.') }
    end
  end

  def delete
  end
end
