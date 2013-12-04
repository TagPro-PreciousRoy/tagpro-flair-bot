require 'csv'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :database_authenticatable, :lockable, :recoverable, :registerable, :rememberable, :timeoutable and :validatable
  devise :trackable
  devise :omniauthable, omniauth_providers: [:reddit]

  validates :uid, uniqueness: { scope: :provider }
  validates :flair_class, inclusion: { in: lambda { |user| user.tag_pro_profile.flairs.map(&:flair_class) }, allow_blank: true }

  has_one :tag_pro_profile, dependent: :destroy

  after_save :write_flair_to_reddit, if: :flair_set?

  def self.find_or_create_for_oauth(auth)
    find_or_create_by provider: auth.provider, uid: auth.uid do |user|
      user.name = auth.extra.raw_info.name
    end
  end

  def flair_set?
    flair_class? || flair_text?
  end

  def write_flair_to_reddit
    reddit = Snoo::Client.new
    reddit.log_in ENV['REDDIT_MOD_USERNAME'], ENV['REDDIT_MOD_PASSWORD']
    reddit.flair_csv [name, flair_text, flair_class].to_csv, ENV['REDDIT_MOD_SUBREDDIT']
  end
end
