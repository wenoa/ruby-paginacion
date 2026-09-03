module Paginacion
  class Paginable
    class << self
      def para(coleccion)
        subclasses.detect { |paginable| paginable.para?(coleccion) }.new(coleccion) # steep:ignore NoMethod
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
