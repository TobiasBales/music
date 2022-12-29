# typed: false
# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    extend T::Sig

    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    sig { params(input: String).returns(Note) }
    def note(input)
      Note.deserialize(input)
    end

    sig { params(user: User).returns(User) }
    def sign_in_as(user)
      post(sign_in_url, params: { email: user.email, password: "Secret1*3*5*" })
      user
    end
  end
end
