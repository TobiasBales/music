# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Navigation
    class DropdownItem < Bootstrap::Component
      extend T::Sig

      Target = T.type_alias { T.any(String, Symbol, ActiveRecord::Base) }

      sig { params(text: String, to: Target, method: T.nilable(Symbol)).void }
      def initialize(text:, to:, method:)
        super()

        @text = text
        @to = to
        @method = method
      end

      sig { returns(String) }
      attr_reader :text

      sig { returns(Target) }
      attr_reader :to

      sig { returns(T.nilable(Symbol)) }
      attr_reader :method
    end
  end
end
