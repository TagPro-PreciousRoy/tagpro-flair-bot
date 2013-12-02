class TagProProfile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :uid, uniqueness: { scope: :server }, presence: true
  validates :server, presence: true

  URL_REGEX = /\Ahttp:\/\/tagpro-([a-z]+).koalabeast.com\/profile\/([\da-f]{24})\z/

  def url
    "http://tagpro-#{server}.koalabeast.com/profile/#{uid}" if server && uid
  end

  def url=(url)
    if url =~ URL_REGEX
      self.server = $1
      self.uid = $2
    end
  end
end
