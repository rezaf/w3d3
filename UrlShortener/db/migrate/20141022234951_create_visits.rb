class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :user_id
      t.string :shortened_url
      t.time_stamp
    end
  end
end
