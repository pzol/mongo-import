module MongoImport
  def snapshot(expr, opts={})
    db, collection = expr.split('.')
    Snapshot.new(db, collection).import
  end

  class Snapshot
    attr_reader :opts, :db, :collection

    def initialize(db, collection, opts={})
      defaults = {:host => 'localhost', :port => 27017, :exec => 'mongoimport'}
      @opts = OpenStruct.new(defaults.merge(opts))
      @db, @collection = db, collection
      @path = 'spec/snapshots'
    end

    # returns true if the import succeeded
    def import
      raise "Could not find #{@opts.exec} in your PATH" unless system("which #{opts.exec} > /dev/null")

      file = File.join(@path, "#{@db}.#{@collection}.json")
      cmd  = "#{opts.exec} --host #{opts.host} --port #{opts.port} --drop --db #{@db} --collection #{@collection} #{file}"
      system cmd
    end
  end
end
