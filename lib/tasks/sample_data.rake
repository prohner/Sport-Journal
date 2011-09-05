require 'faker'
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_promotions
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
  user.workout_sessions << WorkoutSession.new(:description  => "description of the first workout",
                                              :workout_date => "6/2/2011")
  user.workout_sessions << WorkoutSession.new(:description  => "description of the second workout",
                                              :workout_date => "6/5/2011")
  user.save!
end


def make_promotions
  user = User.first
  user.promotions << Promotion.new( :rank  => "black",
                                    :promotion_date => "6/2/2011")
  user.promotions << Promotion.new( :rank  => "red",
                                    :promotion_date => "1/2/2010")
  user.save!
end