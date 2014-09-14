require 'spec_helper'

describe MongoImport, 'snapshot' do
  it 'should pass all options to Snapshot ctor' do
    options = { db: 'db', collection: 'coll', foo: 'bar' }

    MongoImport::Snapshot.should_receive(:new) do |expr, opts|
      opts[:db].should == 'db'
      opts[:collection].should == 'coll'
      opts[:foo].should == 'bar'
      double('snapshot').as_null_object
    end

    snapshot = snapshot('expr', options)
  end

  it 'should take db and collection from expr when no passed in options' do
    MongoImport::Snapshot.should_receive(:new) do |expr, opts|
      opts[:db].should == 'db'
      opts[:collection].should == 'coll'
      double('snapshot').as_null_object
    end

    snapshot = snapshot('db.coll', {})
  end
end
