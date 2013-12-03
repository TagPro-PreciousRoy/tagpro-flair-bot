class TagProProfile < ActiveRecord::Base
  belongs_to :user

  validates :user_id, uniqueness: true
  validates :uid, uniqueness: { scope: :server }, presence: true
  validates :server, presence: true
  validate :flair_page_must_work

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

  def flair_page
    @flair_page ||= begin
      Rails.cache.fetch([self, :flair_page]) do
        agent = Mechanize.new
        agent.follow_redirect = false
        page = agent.get(url)
        raise unless page.code =~ /\A[234]/
        FlairPage.new(code: page.code, content: page.content)
      end
    rescue
      nil
    end
  end

  def flair_page_must_work
    page = flair_page
    if page.nil?
      errors.add(:url, "couldn't be processed")
    elsif page.code == "302"
      errors.add(:url, "doesn't exist")
    end
  end

  delegate :flairs, to: :flair_page
end
