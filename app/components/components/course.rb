# typed: strict
# frozen_string_literal: true

module Components
  class Course < ApplicationComponent
    extend T::Sig

    sig { params(course: ::Course, button_text: String).void }
    def initialize(course:, button_text:)
      super()
      @course = course
      @button_text = button_text
    end

    sig { returns(::Course) }
    attr_reader :course

    sig { returns(String) }
    attr_reader :button_text
  end
end
