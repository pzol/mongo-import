require 'spec_helper'
require 'json'

module MongoImport
  class Snapshot
    def initialize(db, collection)
      @collection, @db = collection, db
      @dir = File.expand_path('../../snapshots', __FILE__)
      @host = 'localhost'
      @port = 27017
    end

    def import
      file = File.join(@dir, "#{@collection}.json")
      cmd = "mongoimport --host #{@host} --port #{@port} --drop --db #{@db} --collection #{@collection} #{file}"
      system  cmd
    end
  end
end

describe 'Integration' do
  it "works" do
    snapshot = MongoImport::Snapshot.new 'mongo_import_test', 'test'
    snapshot.import
    # c = db['test']
    # json = JSON.parse(s)
    # p json
    # c.insert(json)

    # db['test'].count.should == 1
  end
end
