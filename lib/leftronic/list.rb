#implements a table stream with a heap
class Leftronic
  class List
    attr_accessor :array 
    def initialize (options = {})
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

