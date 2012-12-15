require 'spec_helper'

describe 'Integration' do
  it "should import a snapshot to mongo" do
    s = 'mongo_import_test.test'
    snapshot(s).should be_true

    db_name, collection_name = s.split '.'
    c = Mongo::Connection.new[db_name][collection_name]
    c.count.should == 1
    c.find_one.should == {"_id"=>BSON::ObjectId('4deca6e4b496b2fb83000003'), "name"=>"anixe",
                          "created_at"=> Time.utc(2011, 6, 6, 10, 7, 33)}
  end
end

describe 'Integration' do
  it "should import a snapshot to mongo with providing name and opts separately" do
    s = 'mongo_import_test.test'
    db_name, collection_name = 'test_mongo_import', 'test_test'
    snapshot(s, :db => db_name, :collection => collection_name).should be_true

    c = Mongo::Connection.new[db_name][collection_name]
    c.count.should == 1
    c.find_one.should == {"_id"=>BSON::ObjectId('4deca6e4b496b2fb83000003'), "name"=>"anixe",
                          "created_at"=> Time.utc(2011, 6, 6, 10, 7, 33)}
  end
end
