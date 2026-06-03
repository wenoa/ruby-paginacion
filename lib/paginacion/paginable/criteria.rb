module Paginacion
  module Paginable
    class Criteria < Base
      class << self
        def para?(coleccion)
          coleccion.respond_to?(:skip) && coleccion.respond_to?(:limit)
        end
      end

      def total
        @coleccion.size
      end

      def seleccionar(desde:, cantidad:)
        @coleccion.skip(desde).limit(cantidad).to_a
      end
    end
  end
end
