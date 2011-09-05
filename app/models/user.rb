# == Schema Information
# Schema version: 20110605233440
#
# Table name: users
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  firstname  :string(255)
#  lastname   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :workout_sessions
  has_many :promotions
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, :presence         => true,
                        :length           => { :maximum => 50 }
  validates :lastname,  :presence         => true,
                        :length           => { :maximum => 50 }
  validates :email,     :presence         => true,
                        :format           => { :with => email_regex },
                        :uniqueness       => { :case_sensitive => false }
end
