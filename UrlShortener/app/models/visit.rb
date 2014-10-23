class Visit < ActiveRecord::Base
  
  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )
  
  belongs_to(
    :shortened_url,
    :class_name => "ShortenedUrl",
    :foreign_key => :shortened_url,
    :primary_key => :short_url
  )
  
  # validates :user_id, :presence => true, :uniqueness => true
#   validates :shortened_url, :presence => true, :uniqueness => true
  def self.record_visit!(user, shortened_url)
    
    Visit.create!({
      :user_id => user.id, 
      :shortened_url => shortened_url
    })
  end
end