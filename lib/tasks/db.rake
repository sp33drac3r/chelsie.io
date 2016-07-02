# lib/tasks/db.rake
namespace :db do

  # desc "Dumps the database to db/APP_NAME.dump"
  # task :dump => :environment do
  #   cmd = nil
  #   with_config do |app, host, db, user|
  #     cmd = "pg_dump --host #{host} --username #{user} --verbose --clean --no-owner --no-acl --format=c #{db} > #{Rails.root}/db/#{app}.dump"
  #   end
  #   puts cmd
  #   exec cmd
  # end

  desc "Dumps the database to db/APP_NAME.dump"
  task :dump => :environment do
    cmd = nil
    # "psql -P format=unaligned -P tuples_only -P fieldsep=\, -c 'SELECT * FROM chelsie_development' > db/backups/#{file_name}"
    with_config do |app, host, db, user|
      file_name = Time.now.strftime("%Y%m%d%H%M%S") + "_" + db + '.dump'
      cmd = "pg_dump -Fc chelsie_development > db/backups/#{file_name}"
      # cmd = "psql -P format=unaligned -P tuples_only -P fieldsep=\, -c 'SELECT * FROM service_providers' > db/backups/#{file_name}"
    end
    puts cmd
    exec cmd
  end

  # desc "Resets the remote database"
  # task :reset => :environment do
  #   exec 'heroku pg:reset DATABASE_URL'
  # end

  desc "Pushes the database to heroku"
  task :push => :environment do
    exec 'heroku pg:push chelsie_development DATABASE_URL --a afternoon-badlands-40242'
  end



  # desc "Restores the database dump at db/APP_NAME.dump."
  # task :restore => :environment do
  #   cmd = nil
  #   with_config do |app, host, db, user|
  #     cmd = "pg_restore --verbose --host #{host} --username #{user} --clean --no-owner --no-acl --dbname #{db} #{Rails.root}/db/#{app}.dump"
  #   end
  #   Rake::Task["db:drop"].invoke
  #   Rake::Task["db:create"].invoke
  #   puts cmd
  #   exec cmd
  # end

  private

  def with_config
    yield Rails.application.class.parent_name.underscore,
      ActiveRecord::Base.connection_config[:host],
      ActiveRecord::Base.connection_config[:database],
      ActiveRecord::Base.connection_config[:username]
  end

end
