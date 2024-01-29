# frozen_string_literal: true

require "active_support/concern"

module Decidim
  module ScopableResourceOverrides
    extend ActiveSupport::Concern

    included do
      belongs_to :scope,
                 foreign_key: "decidim_scope_id",
                 class_name: "Decidim::Scope",
                 optional: false
    end
  end
end
