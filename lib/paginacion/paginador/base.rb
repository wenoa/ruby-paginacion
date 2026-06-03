module Paginacion
  module Paginador
    class Base
      # :nocov:
      def paginar(coleccion, metadata = {})
        raise NotImplementedError
      end
      # :nocov:
    end
  end
end
