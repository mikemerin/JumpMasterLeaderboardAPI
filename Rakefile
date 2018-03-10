# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :heroku do

    desc "reload and scrape"
    task :reload => :environment do
      system("heroku pg:reset DATABASE_URL --confirm jumpmasterapi")
      system("heroku run rake db:migrate")
      system("heroku run rake db:seed")
      puts 'Database Ready and Seeded'
    end

end

namespace :db do

  desc "load and prep for scraping"
  task :load => :environment do
    system("rake db:create")
    system("rake db:migrate")
    system("rake db:migrate RAILS_ENV=development")
    puts 'Database Ready'
  end

  desc "reload and prep for scraping"
  task :reload => :environment do
    system("rake db:drop")
    system("rake db:create")
    system("rake db:migrate")
    system("rake db:migrate RAILS_ENV=development")
    puts 'Database Ready'
  end

end
