require 'rest_client'
require 'pushlayer/version'

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
    params = { device_token: device_token, alert_body: alert_body }
    headers = { user_agent: user_agent }

    RestClient.post endpoint, params, headers
  end

  private

  def self.endpoint
    "#{@@api_base}/applications/#{@@api_id}/notifications.json?api_key=#{@@api_key}"
  end

  def self.user_agent
    "PushLayer/v1 RubyBindings/#{Pushlayer::VERSION}"
  end
end
