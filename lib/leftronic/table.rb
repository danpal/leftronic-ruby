#implements a table stream with a heap
class Leftronic
  class Table 
    attr_accessor :title
    attr_accessor :hash
    def initialize (options = {})
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

