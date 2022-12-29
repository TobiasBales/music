# typed: strict
# frozen_string_literal: true

module Bootstrap
  module Form
    module Tag
      class Input < Bootstrap::Component
        extend T::Sig

        sig do
          params(
            form: ActionView::Helpers::FormBuilder,
            field: Symbol,
            type: Symbol,
            autofocus: T::Boolean,
            multiple: T::Boolean
          ).void
        end
        def initialize(form:, field:, type:, autofocus:, multiple:)
          super

          @form = form
          @field = field
          @type = type
          @autofocus = autofocus
          @multiple = multiple
        end

        sig { returns(ActionView::Helpers::FormBuilder) }
        attr_reader :form

        sig { returns(Symbol) }
        attr_reader :field

        sig { returns(Symbol) }
        attr_reader :type

        sig { returns(T::Boolean) }
        attr_reader :autofocus

        sig { returns(T::Boolean) }
        attr_reader :multiple
      end
    end
  end
end
