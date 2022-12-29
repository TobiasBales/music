# typed: true
# frozen_string_literal: true

module Bootstrap
  module Form
    module Tag
      class Label < Bootstrap::Component
        def initialize(form:, field:, style: :default)
          super

          @form = form
          @field = field
          @style = style
        end

        def classes
          classes = []
          classes << "form-check-label" if @style == :checkbox

          classes.join(" ")
        end
      end
    end
  end
end
