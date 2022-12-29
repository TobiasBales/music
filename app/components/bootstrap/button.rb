# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Button < Component
    extend T::Sig

    Target = T.type_alias { T.any(String, Symbol, ActiveRecord::Base) }

    sig { params(text: String, to: Target, method: Symbol, style: Symbol, confirm: T.nilable(String)).void }
    def initialize(text:, to:, method: :get, style: :primary, confirm: nil)
      super

      @text = text
      @to = to
      @method = method
      @style = style
      @confirm = confirm
    end

    sig { returns(String) }
    attr_reader :text

    sig { returns(Target) }
    attr_reader :to

    sig { returns(Symbol) }
    attr_reader :method

    sig { returns(Symbol) }
    attr_reader :style

    sig { returns(T.nilable(String)) }
    attr_reader :confirm

    sig { returns(String) }
    def classes
      ["btn-#{@style}"].join(" ")
    end
  end
end
