class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation
  #attr_accessor :password
  has_many :books
  has_many :orders
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+-?[a-z]+\.[1-9]\d*@osu\.edu/, 
    message: "should be from OSU" }
  has_secure_password
end
