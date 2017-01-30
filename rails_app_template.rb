# Template to create a basic Rails app with Postgres, Rspec, and my preferred dev tools
# Rails documentation for templates http://guides.rubyonrails.org/rails_application_templates.html
# Command to create a new rails app with this template: 
#     rails new app_name -T --database=postgresql -m ../rails_templates/rails_app_template.rb

# Choices Gem: https://github.com/mislav/choices
# Devise Gem: https://github.com/plataformatec/devise

remove_file 'README.doc'

app_name = ask("What would you like to cal lthis app?")
description = ask("What is a brief description of what this app will do?")

file 'README.md', <<-CODE
# #{app_name}

#{description}
CODE

gem 'choices'
gem 'selenium-webdriver'
gem 'slim'
gem 'slim-rails'

gem_group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
end

gem_group :development do
  gem 'web-console'
end

gem_group :production do
  gem 'rails_12factor' # for heroku logging
end

run 'bundle install'

# Setup Testing 

generate 'rspec:install'

# Setup for the Choices Gem

environment "config.from_file = 'settings.yml'"

file 'config/settings.yml', <<-CODE
defaults: &defaults

development:
  <<: *defaults

test: &testing
  <<: *defaults

production:
  <<: *defaults
CODE

file 'config/settings.local.yml', <<-CODE
development:
CODE


after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end

rails_command "db:create"
rails_command "db:migrate"

# Include Devise?

if yes?("Do you want to include Devise for user authentication? (y/n)")
  gem 'devise'

  run 'bundle install'

  run 'rails generate devise:install'

  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'development'
  environment "config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }", env: 'test'

  if yes?("Do you want to create a Devise User model? (y/n)")
    generate(:scaffold, "user", "first_name:string", "last_name:string")
    run 'rails generate devise User'
    rails_command "db:migrate"
    route "root to: 'user#index'"
    git add: "."
    git commit: %Q{ -m 'Added User model and Devise gem' }
  else
    git add: "."
    git commit: %Q{ -m 'Added Devise gem' }
  end
end

if yes?("Would you like to include tools to build an API? (y/n)")
  gem "jbuilder"

  run 'bundle install'

  git add: "."
  git commit: %Q{ -m 'Added Jbuilder and API base controller' }
end
