module Paginacion
  module Paginador
    class Estandar < Base
      class << self
        def para_pagina(numero:, tamaño:)
          new(numero:, tamaño:)
        end

        private :new
      end

      def paginar(coleccion, metadata = {})
        paginable = Paginable::Base.para(coleccion)
        Pagina.new(
          items: paginable.seleccionar(desde: @tamaño * (@numero - 1), cantidad: @tamaño),
          total: paginable.total,
          metadata:,
        )
      end

      private

      def initialize(numero:, tamaño:)
        super()
        @numero = numero
        @tamaño = tamaño
      end
    end
  end
end
