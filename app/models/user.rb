class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :database_authenticatable, :lockable, :omniauthable, :recoverable, :registerable, :rememberable, :timeoutable and :validatable
  devise :trackable
end
