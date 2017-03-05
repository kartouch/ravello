require_relative "ravello/version"
require_relative 'ravello/auth'
require_relative 'ravello/applications'
require_relative 'ravello/blueprints'
require_relative 'ravello/images'
require_relative 'ravello/disk_images'

module Ravello
  
  include Auth
  include Applications
  include Blueprints
  include Images
  include DiskImages

  BASE_URI = 'https://cloud.ravellosystems.com/api/v1'
end
