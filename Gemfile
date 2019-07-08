source "https://rubygems.org"

gem "rake"

# Web framework
gem "dry-system", "~> 0.9"
gem "dry-web", "~> 0.7"
gem "dry-web-roda", "~> 0.11"
gem "puma"
gem "rack_csrf"

gem "rack", ">= 2.0"

# Database persistence
gem "pg"
gem "rom"
gem "rom-sql"

# Application dependencies
gem "dry-matcher"
gem "dry-monads"
gem "dry-struct"
gem "dry-types"
gem "dry-validation"
gem "dry-view", "~> 0.7"
gem "slim"

group :development, :test do
  gem "pry-byebug", platform: :mri
end

group :development do
  gem "rerun"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "database_cleaner"
  gem "poltergeist"
  gem "rspec"
  gem "rom-factory", "~> 0.5"
end
