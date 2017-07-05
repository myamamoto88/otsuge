class AnnounceService
  class << self
    def run
      AnnounceService.new.service
    end
  end

  def service
    Announcement.unreleased(Time.current).each do |announcement|
      announcement.with_lock do
        success = notify(announcement)

        if success
          announcement.treated!
        else
          announcement.failed!
        end
      end
    end
  end

  private

  def notify(announcement)
    client = build_client(announcement)
    client.notify announcement.message
    true
  rescue SlackNotify::Error
    false
  end

  def build_client(announcement)
    option = {
      webhook_url: webhook_url,
      channel: announcement.channel,
      username: announcement.announce_name,
      link_names: 1
    }

    if announcement.icon_emoji?
      option.merge! icon_emoji: announcement.announce_icon
    else
      option.merge! icon_url: announcement.announce_icon
    end

    SlackNotify::Client.new option
  end

  def webhook_url
    ENV['SLACK_WEBHOOK_URL']
  end
end
