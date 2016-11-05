class ChangeColumnToAnnouncement < ActiveRecord::Migration[5.0]
  def change
    add_column :announcements, :channel, :string, null:false, after: :announce_name
  end
end
