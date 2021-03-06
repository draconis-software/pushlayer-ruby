require 'spec_helper'

describe Pushlayer do
  describe '.post_notification' do
    before do
      api_id = 123
      api_key = '123abc'

      Pushlayer.api_id = api_id
      Pushlayer.api_key = api_key

      @expected_url = post_notification_url(api_id, api_key)
      stub_request :any, @expected_url

      @device_token = '1a2b3c'
      @alert_body = 'test message'

      Pushlayer.post_notification @device_token, @alert_body
    end

    it 'POSTs to the correct URL' do
      body = { device_token: @device_token, alert_body: @alert_body }
      headers = { content_type: 'application/json', user_agent: user_agent }

      WebMock.should have_requested(:post, @expected_url).with(body: body, headers: headers).once
    end
  end

  def post_notification_url(id, key)
    "https://www.pushlayer.com/applications/#{id}/notifications.json?api_key=#{key}"
  end

  def user_agent
    "PushLayer/v1 RubyBindings/#{Pushlayer::VERSION}"
  end
end
