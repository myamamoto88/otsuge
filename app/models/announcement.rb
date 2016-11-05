class Announcement < ApplicationRecord
  enum status: { untreated: 0, treated: 1 }

  with_options presence: true do
    validates :title
    validates :message
    validates :announce_at, timeliness: { after: -> { Time.current } }
    validates :announce_name
    validates :announce_icon
    validates :channel
    validates :status, inclusion: { in: Announcement.statuses.keys }
    validates :created_user
  end
end
