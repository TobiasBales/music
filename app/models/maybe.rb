# typed: strict
# frozen_string_literal: true

module Maybe
  extend T::Generic
  extend T::Helpers
  extend T::Sig

  sealed!
  abstract!

  Value = type_member(:out)

  sig do
    type_parameters(:V)
      .params(value: T.type_parameter(:V))
      .returns(Just[T.type_parameter(:V)])
  end
  def self.just(value)
    Just.new(value)
  end

  sig { returns(Nothing[T.untyped]) }
  def self.nothing
    Nothing.new
  end

  sig { abstract.returns(Value) }
  def value!; end

  sig { abstract.returns(T::Boolean) }
  def value?; end
end

module Maybe
  class Just
    extend T::Sig
    extend T::Generic

    Value = type_member

    include Maybe

    sig { params(value: Value).void }
    def initialize(value)
      @value = value
    end

    sig { returns(Value) }
    attr_reader :value

    sig { override.returns(Value) }
    def value!
      @value
    end

    sig { override.returns(T::Boolean) }
    def value?
      true
    end
  end
end

module Maybe
  class Nothing
    extend T::Generic
    extend T::Sig

    Value = type_member

    include Maybe

    sig { override.returns(Value) }
    def value!
      raise "Nothing has no value"
    end

    sig { override.returns(T::Boolean) }
    def value?
      false
    end
  end
end
