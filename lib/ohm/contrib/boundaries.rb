module Ohm
  # Dirt cheap ::first and ::last support.
  #
  # @example
  #
  #   class Post < Ohm::Model
  #     include Ohm::Boundaries
  #   end
  #
  #   post1 = Post.create
  #   post2 = Post.create
  #   post1 == Post.first
  #   # => true
  #
  #   post2 == Post.last
  #   # => true
  module Boundaries
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def first(opts = {})
        find(opts).sort(:start => 0, :limit => 1).first
      end

      def last(opts = {})
        find(opts).sort(:start => 0, :limit => 1, :order => "DESC").first
      end
    end
  end
end
