# frozen_string_literal: true

# This validator ensures the scope is a descending scope of the component scope
# if component present
class ScopeDescendantOfComponentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless component_for(record)

    record.errors.add(attribute, :invalid_subscope) if component_for(record).scope == Decidim::Scope.find_by(id: value)
  end

  private

  def component_for(record)
    record.try(:component) || record.try(:current_component)
  end
end
