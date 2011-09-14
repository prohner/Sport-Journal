require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_styles
    make_users
    make_promotions
    make_techniques
    make_workouts
  end
end

def make_users
  u = User.create!( :firstname  => "Sam",
                    :lastname   => "Rohner",
                    :email      => "p@r.com",
                    :style      => "Tang soo do")
  5.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@test.com"
    firstname = "first #{n+1}"
    lastname = "first #{n+1}"
    style = "Tang soo do"
    User.create!(:firstname => firstname,
                  :lastname => lastname,
                  :email    => email,
                  :style    => style)
  end
end

def make_workouts
  user = User.first
  tech1 = Technique.first
  tech2 = Technique.last
  
  workout_session = WorkoutSession.create!( :description  => "description of the first workout",
                                            :workout_date => "6/2/2011",
                                            :user => user)
  tech_rep = TechniqueRepetition.create!( :technique => tech1, 
                                          :user  => user, 
                                          :repetitions  => 10,
                                          :workout_session => workout_session)

  tech_rep = TechniqueRepetition.create!( :technique => tech2, 
                                          :user  => user, 
                                          :repetitions  => 13,
                                          :workout_session => workout_session)
  workout_session.tag_list = "forms,self-defense"
  user.workout_sessions << workout_session
  
  workout_session = WorkoutSession.create!( :description  => "description of the second workout",
                                            :workout_date => "6/2/2011",
                                            :user => user)
  tech_rep = TechniqueRepetition.create!( :technique => tech2, 
                                          :user  => user, 
                                          :repetitions  => 16,
                                          :workout_session => workout_session)
  workout_session.tag_list = "kicks,forms,jumps"
  user.workout_sessions << workout_session
  
  workout_session = WorkoutSession.create!( :description  => "description of the third workout",
                                            :workout_date => "6/12/2011",
                                            :user => user)
  tech_rep = TechniqueRepetition.create!( :technique => tech1, 
                                          :user  => user, 
                                          :repetitions  => 10,
                                          :workout_session => workout_session)
  tech_rep = TechniqueRepetition.create!( :technique => tech2, 
                                          :user  => user, 
                                          :repetitions  => 15,
                                          :workout_session => workout_session)
  workout_session.tag_list = "kicks,forms,one-step"
  user.workout_sessions << workout_session
  
  workout_session = WorkoutSession.create!( :description  => "description of the fourth workout",
                                            :workout_date => "6/15/2011",
                                            :user => user)
  tech_rep = TechniqueRepetition.create!( :technique => tech1, 
                                          :user  => user, 
                                          :repetitions  => 12,
                                          :workout_session => workout_session)
  tech_rep = TechniqueRepetition.create!( :technique => tech2, 
                                          :user  => user, 
                                          :repetitions  => 18,
                                          :workout_session => workout_session)
  workout_session.tag_list = "bo staff,forms"
  user.workout_sessions << workout_session
                                              
  user.save!
  
  
end


def make_promotions
  user = User.first
  style = Style.first
  user.promotions << Promotion.new( :rank  => "black",
                                    :promotion_date => "6/2/2011",
                                    :style => style)
  user.promotions << Promotion.new( :rank  => "red",
                                    :promotion_date => "1/2/2010",
                                    :style => style)
  user.save!
end

def make_styles
  style = Style.create!(  :name               => "Tang Soo Do",
                          :country_of_origin  => "Korea")
  style = Style.create!(  :name               => "Tae Kwon Do",
                          :country_of_origin  => "Korea")
  style = Style.create!(  :name               => "Jiu Jitsu",
                          :country_of_origin  => "Japan")
end


def make_techniques
  user = User.first
  Technique.create!(  :user => user, :name => "Roundhouse Kick")
  Technique.create!(  :user => user, :name => "Front stretch Kick")
  Technique.create!(  :user => user, :name => "Inside-to-outside Kick")
  Technique.create!(  :user => user, :name => "Outside-to-inside Kick")
end