class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :database_authenticatable, :lockable, :recoverable, :registerable, :rememberable, :timeoutable and :validatable
  devise :trackable
  devise :omniauthable, omniauth_providers: [:reddit]

  validates :uid, uniqueness: { scope: :provider }
end
