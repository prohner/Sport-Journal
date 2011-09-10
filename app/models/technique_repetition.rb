# == Schema Information
# Schema version: 20110908035818
#
# Table name: technique_repetitions
#
#  id                 :integer         not null, primary key
#  technique_id       :integer
#  user_id            :integer
#  repetitions        :integer
#  workout_session_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class TechniqueRepetition < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_session
  belongs_to :technique

  validates :repetitions,         :presence => true,
                                  :numericality => {  :only_integer => true,
                                                      :minimum      => 1 }
  validates :user_id,             :presence => true
  validates :technique_id,        :presence => true
  validates :workout_session_id,  :presence => true
end
