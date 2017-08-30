class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :payment #the user will required to have a payment once when he signup
  accepts_nested_attributes_for :payment #when we signup a user it will handle though the registration new.html.erb
  #when signup a user now only it will hit the user table also payment table it accept nested attributes
  has_many :images
end
