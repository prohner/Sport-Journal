class WorkoutSessionsController < ApplicationController
  def create
    workout_session = WorkoutSession.create(params[:workout_session])
    workout_session.workout_date = Time.now
    user = get_current_user
    workout_session.user = user
    
    workout_session.save!
    respond_to do |format|
      format.html { redirect_to workout_session.user, :notice => 'Workout was successfully created.' }
    end
  end

  def delete
  end
end
