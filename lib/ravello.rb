Dir[File.dirname(__FILE__)+'/*/*'].each {|file| require file }

module Ravello

  include Auth
  include Applications
  include Blueprints
  include Images
  include DiskImages

  BASE_URI = 'https://cloud.ravellosystems.com/api/v1'

end
