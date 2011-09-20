# == Schema Information
# Schema version: 20110607034148
#
# Table name: workout_sessions
#
#  id           :integer         not null, primary key
#  description  :string(255)
#  user_id      :integer
#  workout_date :date
#  created_at   :datetime
#  updated_at   :datetime
#

class WorkoutSession < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :technique_repetitions
  before_save :default_values

  validates :description,   :presence => true,
                            :length   => { :minimum => 3 }
  validates :user_id,       :presence => true
  validates :workout_date,  :presence => true

  default_scope :order => 'workout_sessions.workout_date desc'

  def default_values
    self.workout_date = Time.now unless self.workout_date
  end
end
