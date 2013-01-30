class CartesianProduct
    include Enumerable

    def initialize(vector1 = [], vector2 = [])
      @product = []
      calculate(vector1, vector2) unless vector1.empty? or vector2.empty?
    end

    def each(&blk)
      @product.each(&blk)
    end

    private

    def calculate(vector1, vector2)
      vector1.each do |v1|
        vector2.each do |v2|
          @product << [v1, v2]
        end
      end
    end
end