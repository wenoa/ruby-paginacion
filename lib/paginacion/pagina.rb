module Paginacion
  class Pagina
    class << self
      def individual(items)
        new items:, total: items.size, metadata: {}
      end
    end

    attr_reader :total, :metadata

    def initialize(items:, total:, metadata:)
      @items = items
      @total = total
      @metadata = metadata
    end

    def ==(otra)
      is_a?(otra.class) &&
        items == otra.items &&
        total == otra.total &&
        metadata == otra.metadata
    end

    def transformar(&)
      Pagina.new(items: @items.map(&), total:, metadata:)
    end

    def [](indice)
      @items[indice]
    end

    def to_a
      @items.to_a
    end

    def vacia?
      @items.empty?
    end

    protected

    attr_reader :items
  end
end
