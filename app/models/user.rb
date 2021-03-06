class User < ActiveRecord::Base
  has_many :events_organized, :class_name => "Event", :foreign_key => "organizer_id"
  has_many :attendances, :foreign_key => "attendant_id"
  has_many :events_attended, :through => :attendances, :source => :event
  has_many :submissions, :foreign_key => "author_id"
  has_many :votes
  has_many :submissions_voted, :through => :votes, :source => :submission

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates :name, :presence => true, :uniqueness => true
end
