require 'mongo'

ENV['TZ'] = "CET" # make sure all tests are in the same timezone
$LOAD_PATH << File.expand_path('../../lib', __FILE__) # the gem's lib dir
