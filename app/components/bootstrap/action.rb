# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Action
    extend T::Sig
    Target = T.type_alias { T.any(String, Symbol, ActiveRecord::Base) }
    sig { params(label: String, to: Target, icon: String, method: Symbol, confirm: T.nilable(String)).void }
    def initialize(label:, to:, icon:, method: :get, confirm: nil)
      @label = label
      @to = to
      @icon = icon
      @method = method
      @confirm = confirm
    end

    sig { returns(String) }
    attr_reader :label

    sig { returns(Target) }
    attr_reader :to

    sig { returns(String) }
    attr_reader :icon

    sig { returns(Symbol) }
    attr_reader :method

    sig { returns(T.nilable(String)) }
    attr_reader :confirm
  end
end
