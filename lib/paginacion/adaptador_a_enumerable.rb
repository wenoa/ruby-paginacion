module Paginacion
  class AdaptadorAEnumerable
    def initialize(size:, slice:)
      @size = size
      @slice = slice
    end

    def size
      @size.call
    end

    def slice(...)
      @slice.call(...)
    end
  end
end
