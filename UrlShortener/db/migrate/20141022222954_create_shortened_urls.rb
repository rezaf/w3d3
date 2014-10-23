class CreateShortenedUrls < ActiveRecord::Migration
  def change
    create_table :shortened_urls do |t|
      t.string :submitter_id
      t.string :long_url
      t.string :short_url

      t.timestamps
    end
  end
end
