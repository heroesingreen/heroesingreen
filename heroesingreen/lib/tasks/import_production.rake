namespace :import_production do
  desc "Import production database into development database"
  task :all => [:import]

  desc "Import production database dump"
  task :import, :fn, :needs => :environment do |t, args|
    environment = (ENV.include?("RAILS_ENV")) ? (ENV["RAILS_ENV"]) : 'development'
    ENV["RAILS_ENV"] = RAILS_ENV = environment
    begin
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)
      sql = File.open(args[:fn]).read
      sql.split(';').each do |sql_statement|
         ActiveRecord::Base.connection.execute(sql_statement)
      end
      ActiveRecord::Base.establish_connection(RAILS_ENV.to_sym)

      puts "Database has been created '#{Time.now}' "
    rescue => e
      puts "Couldn't import database file: " + e.inspect
    end
  end
end
