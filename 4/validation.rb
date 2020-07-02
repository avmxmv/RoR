# frozen_string_literal: true

module Validation
  validate :name, :presence
  validate :name, :format, /^[a-zA-Z0-9]{3}-?[a-zA-Z0-9]{2}$/
  validate :name, :type, String
end
