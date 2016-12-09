# Template to create a basic Rails app with Postgres, Rspec, and my preferred dev tools
# Choices Gem: https://github.com/mislav/choices

remove_file 'README.doc'
create_file 'README.md'

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
generate 'rspec:install'

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
