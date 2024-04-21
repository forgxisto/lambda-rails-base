# frozen_string_literal: true

if Rails.env.development?
  require 'webrick'

  WEBrick::Config::HTTP[:Logger] = WEBrick::Log.new("/dev/null")
  WEBrick::Config::HTTP[:AccessLog] = WEBrick::Log.new("/dev/null")
end
