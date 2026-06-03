module Paginacion
  module Paginador
    class Roto < Base
      def paginar(coleccion, metadata = {})
        paginable = Paginable::Base.para(coleccion)
        total = paginable.total
        Pagina.new(
          items: paginable.seleccionar(desde: 0, cantidad: total),
          total:,
          metadata:,
        )
      end
    end
  end
end
