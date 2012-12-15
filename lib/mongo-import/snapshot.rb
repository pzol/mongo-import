module MongoImport
  def snapshot(expr, opts={})
    db, collection = expr.split('.')
    Snapshot.new(expr, :db => opts[:db] || db, :collection => opts[:collection] || collection).import
  end

  class Snapshot
    attr_reader :opts, :db, :collection

    def initialize(name, opts={})
      raise ArgumentError, ':db is missing' unless opts[:db]
      raise ArgumentError, ':collection is missing' unless opts[:collection]
      defaults = {:host => 'localhost', :port => 27017, :exec => 'mongoimport'}
      @opts = OpenStruct.new(defaults.merge(opts))
      p @opts
      @path = 'spec/snapshots'
      @name = name
    end

    # returns true if the import succeeded
    def import
      raise "Could not find #{@opts.exec} in your PATH" unless system("which #{opts.exec} > /dev/null")

      file = File.join(@path, "#{@name}.json")
      cmd  = "#{opts.exec} --host #{opts.host} --port #{opts.port} --drop --db #{opts.db} --collection #{opts.collection} #{file}"
      system cmd
    end
  end
end
