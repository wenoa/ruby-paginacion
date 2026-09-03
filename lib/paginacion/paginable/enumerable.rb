module Paginacion
  class Paginable
    class Enumerable < Paginable
      class << self
        def para?(coleccion)
          coleccion.respond_to?(:size) && coleccion.respond_to?(:slice)
        end
      end

      def total
        @coleccion.size
      end

      def seleccionar(desde:, cantidad:)
        @coleccion.slice(desde, cantidad) || []
      end
    end
  end
end
