class Announcement < ApplicationRecord
  before_save :strip_string

  enum status: { untreated: 0, treated: 1, failed: 2 }

  scope :by_status, ->(state) {
    if Announcement.statuses.keys.include? state
      public_send(state)
    else
      untreated
    end
  }

  scope :unreleased, ->(time) {
    untreated \
      .where('announce_at <= ?', time)
  }

  def icon_emoji?
    !announce_icon.match(/\A:\w+:\Z/).nil?
  end

  with_options presence: true do
    validates :title
    validates :message
    validates :announce_at, timeliness: { after: -> { created_at || Time.current } }
    validates :announce_name
    validates :announce_icon
    validates :channel
    validates :status, inclusion: { in: Announcement.statuses.keys }
    validates :created_user
  end

  private

  def strip_string
    self.announce_name&.strip!
    self.announce_icon&.strip!
    self.channel&.strip!
  end
end
