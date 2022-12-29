# typed: true
# frozen_string_literal: true

module Bootstrap
  module List
    class Item < Bootstrap::Component
      def initialize(text: nil, to: nil, icon: nil)
        super

        @text = text
        @to = to
        @icon = icon
      end

      attr_reader :text
      attr_reader :to
      attr_reader :icon
    end
  end
end
