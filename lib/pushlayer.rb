require 'rest_client'

module Pushlayer
  @@api_base = 'https://www.pushlayer.com'
  @@api_id = ''
  @@api_key = ''

  def self.api_id=(id)
    @@api_id = id
  end

  def self.api_key=(key)
    @@api_key = key
  end

  def self.post_notification(device_token, alert_body)
    RestClient.post endpoint, device_token: device_token, alert_body: alert_body
  end

  private

  def self.endpoint
    "#{@@api_base}/applications/#{@@api_id}/notifications.json?api_key=#{@@api_key}"
  end
end
