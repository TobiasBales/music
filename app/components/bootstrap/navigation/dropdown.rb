# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Navigation
    class Dropdown < Bootstrap::Component
      extend T::Sig

      sig { params(text: String).void }
      def initialize(text:)
        super()

        @text = text
      end

      sig { returns(String) }
      attr_reader :text
    end
  end
end
