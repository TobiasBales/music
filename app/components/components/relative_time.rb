# typed: strict
# frozen_string_literal: true

module Components
  class RelativeTime < ApplicationComponent
    extend T::Sig

    Input = T.type_alias { T.any(DateTime, ActiveSupport::TimeWithZone) }

    sig { params(time: Input).void }
    def initialize(time:)
      super()

      @time = time
    end

    sig { returns(Input) }
    attr_reader :time
  end
end
