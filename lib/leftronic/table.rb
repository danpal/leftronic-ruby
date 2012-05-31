#implements a table stream with a heap
module Leftronic
  class Table 
    attr_accessor :title
    def initialize (option = {})
        self.title = options[:title] || ["blank", "blank", "blank"] 
        @hash = {}
        @hash[:table] = []
        @hash[:table] << self.title
    end

    def push(array)
      @hash[:table].insert(1, array)
      if (@hash[:table].count > 20)
        @hash[:table].pop   
      end
       
    end

  end
end

