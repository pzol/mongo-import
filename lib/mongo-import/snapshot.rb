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
      defaults = {host: 'localhost', port: 27017, exec: 'mongoimport', path: 'spec/snapshots'}
      @opts = OpenStruct.new(defaults.merge(opts))
      @path = @opts.path
      @name = name
    end

    # returns true if the import succeeded
    def import
      raise "Could not find #{@opts.exec} in your PATH" unless system("which #{opts.exec} > /dev/null")

      file = File.join(@path, "#{@name}.json")
      cmd  = "#{opts.exec} --host #{opts.host} --port #{opts.port} --drop --db #{opts.db} --collection #{opts.collection} #{file}"
      `#{cmd}`
    end
  end
end
