$LOAD_PATH << File.join(File.dirname(__FILE__))
$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!

require 'pushlayer'
