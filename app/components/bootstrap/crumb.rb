# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Crumb
    extend T::Sig

    sig { params(text: String, to: String).void }
    def initialize(text:, to:)
      @text = text
      @to = to
    end

    sig { returns(String) }
    attr_reader :text

    sig { returns(String) }
    attr_reader :to
  end
end
