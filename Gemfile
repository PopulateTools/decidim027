# frozen_string_literal: true

source "https://rubygems.org"

ruby RUBY_VERSION

DECIDIM_VERSION = "0.27.5"
DECIDIM_ANONYMOUS_PROPOSALS_VERSION = { git: "https://github.com/PopulateTools/decidim-module-anonymous_proposals", branch: "anonymous_proposals_for_registered_users" }

gem "decidim", DECIDIM_VERSION
gem "decidim-conferences", DECIDIM_VERSION
gem "decidim-initiatives", DECIDIM_VERSION

gem "decidim-anonymous_proposals", DECIDIM_ANONYMOUS_PROPOSALS_VERSION

gem "decidim-simple_proposal", git: "https://github.com/mainio/decidim-module-simple_proposal.git"
gem "decidim-decidim_awesome", git: "https://github.com/octree-gva/decidim-module-decidim_awesome.git"

# Performance
gem "appsignal"

gem "bootsnap"

gem "puma"

gem "faker", "~> 2.14"

gem "wicked_pdf", "~> 2.1"
gem 'sidekiq'
gem "aws-sdk-s3", require: false

# Fixes an error with Ruby 3.1.2 and Psych 4.0.0
gem "psych", "< 4"


group :development, :test do
  gem "byebug", "~> 11.0", platform: :mri

  gem "decidim-dev", DECIDIM_VERSION
end

group :development do
  gem "letter_opener_web", "~> 1.3"
  gem "listen", "~> 3.1"
  gem "spring", "~> 2.0"
  gem "spring-watcher-listen", "~> 2.0"
  gem "web-console", "~> 4.0"
end

gem "matrix", "~> 0.4.2"
