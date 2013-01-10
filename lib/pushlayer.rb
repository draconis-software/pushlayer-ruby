require 'rest_client'
require 'multi_json'

require 'pushlayer/version'

module Pushlayer
  # @private
  @@api_base = 'https://www.pushlayer.com'

  @@api_id = ''
  @@api_key = ''

  def self.api_id=(id)
    @@api_id = id
  end

  def self.api_key=(key)
    @@api_key = key
  end

  # Send a push notification
  #
  # @example
  #   Pushlayer.post_notification 'abc123', 'Hello from PushLayer!'
  #
  # @param [String] device_token The device_token from the iOS device, returned by the system in
  #   response to the user giving your app permission to send push notifications.
  # @param [String] alert_body A string to send in the APNS alert_body payload param. Typically
  #   this is a message you want to display to the user in an alert.
  # @param [Hash] opts A hash of all remaining valid APNS payload parameters to include, such as
  #   badge, sound, etc.
  #
  # @option opts [String] :badge
  # @option opts [String] :sound
  # @option opts [String] :action_loc_key
  # @option opts [String] :loc_key
  # @option opts [String] :loc_args
  # @option opts [String] :launch_image
  # @option opts [String] :custom_payload
  #
  # Upon success, a Ruby hash object will be returned representing the notification object sent.
  #
  # Under the hood, Pushlayer is using rest_client to communicate with the service. Be sure to
  # familiarize yourself with rest_client's behavior in terms of exceptions:
  def self.post_notification(device_token, alert_body, opts={})
    params = { device_token: device_token, alert_body: alert_body }.merge opts
    headers = { accept: :json, content_type: :json, user_agent: user_agent }

    RestClient.post endpoint, MultiJson.dump(params), headers
  end

  private

  def self.endpoint
    "#{@@api_base}/applications/#{@@api_id}/notifications.json?api_key=#{@@api_key}"
  end

  def self.user_agent
    "PushLayer/v1 RubyBindings/#{Pushlayer::VERSION}"
  end
end
