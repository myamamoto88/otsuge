class Announcement < ApplicationRecord
  enum status: { untreated: 0, treated: 1 }

  with_options presence: true do
    validates :message
    validates :announce_at, timeliness: { before: -> { Time.current } }
    validates :announce_name
    validates :status, inclusion: { in: Announcement.statuses.keys }
    validates :created_user
  end
end
