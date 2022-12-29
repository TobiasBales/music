# typed: strict
# frozen_string_literal: true

module Bootstrap
  class Card < Component
    extend T::Sig

    sig { params(title: T.nilable(String), image: T.nilable(String)).void }
    def initialize(title: nil, image: nil)
      super

      @title = title
      @image = image
    end

    renders_one :body

    sig { returns(T.nilable(String)) }
    attr_reader :title

    sig { returns(T.nilable(String)) }
    attr_reader :image

    sig { returns(String) }
    def classes
      [].join(" ")
    end
  end
end
