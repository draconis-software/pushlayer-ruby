# Pushlayer

Send iOS push notifications using the [PushLayer.com](https://www.pushlayer.com) service.

## Installation

Add `pushlayer` to your Gemfile:

```ruby
gem pushlayer
```

Be sure to run `bundle install` afterwards.

Alernatively, you can install it locally:

```shell
gem install pushlayer
```

## Requirements

PushLayer depends on ruby 1.9+, and `rest-client`.

## Getting Started

First, you need an account with [PushLayer.com](https://www.pushlayer.com), and an application. An application defines the certificate to use with Apple, and gives you a corresponding api_key to reference when sending push notifications. Lastly, each application has a unique ID, and can be found by clicking on your application name. The URL will look something like `https://www.pushlayer.com/applications/123`, where 123 is the application ID.

Second, you need to tell the Pushlayer library about your ID and api_key:

```ruby
Pushlayer.api_id = 123
Pushlayer.api_key = 'my api key'
```

Third, you need to know the device token you wish to send a notification to. A device token is generated by iOS in response to the user agreeing to receive push notifications from your app. Check out [the documentation on how to request this permission](https://www.pushlayer.com/pages/docs#Askingforpermission).

## Sending a notification

To send a notification, simply:

```ruby
Pushlayer.post_notification 'device_token', 'Hello iOS!'
```

This will tell PushLayer to construct a payload consisting of the alert message 'Hello iOS!' and send it to the specified device token. If everything goes well, your iOS app should receive the notification.

## Help

If you find a bug, open an Issue. Pull Requests are welcome. If you get stuck and need help, feel free to contact us at [info@pushlayer.com](mailto:info@pushlayer.com).
