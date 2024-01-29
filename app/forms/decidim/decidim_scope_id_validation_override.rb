# frozen_string_literal: true

require "active_support/concern"

module Decidim
  module DecidimScopeIdValidationOverride
    extend ActiveSupport::Concern

    included do
      validates :decidim_scope_id, presence: true, scope_descendant_of_component: true
    end
  end
end
