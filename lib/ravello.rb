require "ravello/version"
require 'ravello/auth'
require 'ravello/applications'
require 'ravello/blueprints'
require 'ravello/images'
require 'ravello/disk_images'

module Ravello
  include Auth
  include Applications
  include Blueprints
  include Images
  include DiskImages

  BASE_URI = 'https://cloud.ravellosystems.com/api/v1'
end
