# frozen_string_literal: true

# :nodoc:
# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
