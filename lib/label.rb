require_relative 'item'

class label
    attr_accessor :title, :color
    attr_reader :id, :items

    def initialize(title, color)
        @id = Random.rand(1..1000)
        @title = title
        @color = color
    end
end