module Paginacion
  module Paginable
    class Base
      class << self
        def para(coleccion)
          subclasses.detect { |paginable| paginable.para?(coleccion) }.new(coleccion)
        end

        # :nocov:
        def para?(coleccion)
          raise NotImplementedError
        end
        # :nocov:
      end

      def initialize(coleccion)
        @coleccion = coleccion
      end

      # :nocov:
      def total
        raise NotImplementedError
      end

      def seleccionar(desde:, cantidad:)
        raise NotImplementedError
      end
      # :nocov:
    end
  end
end
