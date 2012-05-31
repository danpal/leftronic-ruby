#implements a table stream with a heap
module Leftronic
  class List
    attr_accessor :array 
    def initialize (option = {})
        @array= []
    end

    def push(msg)
      @array.unshift msg
      if (@array.count > 20)
        @array.pop   
      end
    end
  end
end

