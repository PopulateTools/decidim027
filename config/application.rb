require_relative 'boot'

require "decidim/rails"

# Add the frameworks used by your app that are not loaded by Decidim.
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_cable/engine"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DecidimStable027
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = "Europe/Madrid"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Locales
    config.i18n.available_locales = %i(es en)
    config.i18n.default_locale = :en
    config.i18n.enforce_available_locales = false
    config.i18n.fallbacks = { es: [:en] }

    config.to_prepare do
      [
        Decidim::ParticipatoryProcesses::Admin::ParticipatoryProcessForm,
        Decidim::Debates::DebateForm,
        Decidim::Debates::Admin::DebateForm,
        Decidim::Proposals::Admin::ProposalBaseForm,
        Decidim::Proposals::ProposalForm,
        Decidim::Assemblies::Admin::AssemblyForm,
        Decidim::Conferences::Admin::ConferenceForm
      ].each do |klass|
        klass.include Decidim::ScopeIdValidationOverride
      end

      [
        Decidim::Meetings::Admin::MeetingForm,
        Decidim::Accountability::Admin::ResultForm,
        Decidim::Budgets::Admin::BudgetForm,
        Decidim::Budgets::Admin::ProjectForm,
        Decidim::Meetings::MeetingForm
      ].each do |klass|
        klass.include Decidim::DecidimScopeIdValidationOverride
      end

      [
        Decidim::Accountability::Result,
        Decidim::Debates::Debate,
        Decidim::Budgets::Budget,
        Decidim::Budgets::Project,
        Decidim::Meetings::Meeting,
        Decidim::Assembly,
        Decidim::Conference,
        Decidim::ParticipatoryProcess
      ].each do |klass|
        klass.include Decidim::ScopableResourceOverrides
      end
    end
  end
end

Decidim.configure do |config|
  # Max requests in a time period to prevent DoS attacks. Only applied on production.
  config.throttling_max_requests = 1000

  # Time window in which the throttling is applied.
  # config.throttling_period = 1.minute
end
