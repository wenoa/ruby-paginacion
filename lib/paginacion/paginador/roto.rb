module Paginacion
  class Paginador
    class Roto < Paginador
      def paginar(coleccion, metadata = {})
        paginable = Paginable.para(coleccion)
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
