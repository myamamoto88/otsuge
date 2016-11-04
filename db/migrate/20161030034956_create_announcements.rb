class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title, null: false
      t.text :message, null: false
      t.timestamp :announce_at, null: false
      t.string :announce_icon, null: false
      t.string :announce_name, null: false
      t.string :created_user, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
