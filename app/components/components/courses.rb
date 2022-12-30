# typed: strict
# frozen_string_literal: true

module Components
  class Courses < ApplicationComponent
    extend T::Sig

    sig { params(courses: T::Array[::Course], button_text: String).void }
    def initialize(courses:, button_text:)
      super()

      @courses = courses
      @button_text = button_text
    end

    sig { returns(T::Array[::Course]) }
    attr_reader :courses

    sig { returns(String) }
    attr_reader :button_text
  end
end
