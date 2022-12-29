# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Page < Bootstrap::Component
    extend T::Sig

    sig { params(title: String).void }
    def initialize(title:)
      super()

      @title = title
    end

    sig { returns(String) }
    attr_reader :title
  end
end
