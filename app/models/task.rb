# frozen_string_literal: true

class Task < Sequel::Model(:tasks)
  plugin :validation_helpers
  STATUSES = %w[unassigned assigned closed].freeze

  def validate
    super
    validates_presence %i[title description]
    validates_includes STATUSES, :status
  end
end
