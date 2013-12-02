class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :database_authenticatable, :lockable, :recoverable, :registerable, :rememberable, :timeoutable and :validatable
  devise :trackable
  devise :omniauthable, omniauth_providers: [:reddit]

  validates :uid, uniqueness: { scope: :provider }

  has_one :tag_pro_profile

  def self.find_or_create_for_oauth(auth)
    find_or_create_by provider: auth.provider, uid: auth.uid do |user|
      user.name = auth.extra.raw_info.name
    end
  end
end
