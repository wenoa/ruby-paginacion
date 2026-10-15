module Paginacion
  class Paginador
    class Roto < Paginador
      def paginar(coleccion, metadata = {})
        paginable = Paginable.para(coleccion)
        total = paginable.total
        Pagina.new(
          items: paginable.todos,
          total:,
          metadata:,
        )
      end
    end
  end
end
