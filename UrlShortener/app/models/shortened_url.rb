class ShortenedUrl < ActiveRecord::Base
  
  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )
  
  has_many(
    :visitors,
    :through => :users,
    :source => :visit
  )
  
  validates :long_url, :presence => true, :uniqueness => true
  validates :short_url, :presence => true, :uniqueness => true

  def self.create_for_user_and_long_url!(user, long_url)
    submitter_id = user.id
    
    ShortenedUrl.create!({
      :submitter_id => submitter_id, 
      :long_url => long_url,
      :short_url => ShortenedUrl.random_code
    })
  end
  
  def self.random_code
    valid = false
    secure_string = SecureRandom.urlsafe_base64.gsub(/\W/, ["a".."z"].sample.first)
    while ShortenedUrl.exists?(:short_url => secure_string) do
      secure_string = SecureRandom.urlsafe_base64.gsub(/\W/, ["a".."z"].sample.first)
    end
    "www.hi.vw/" + secure_string
  end

end