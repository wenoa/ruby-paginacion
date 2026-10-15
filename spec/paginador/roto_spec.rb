RSpec.describe(Paginacion::Paginador::Roto) {
  it("entrega todo el contenido en una única página") {
    pagina = described_class.new.paginar([1, 2, 3])

    expect(pagina).to eq(Paginacion::Pagina.new(items: [1, 2, 3], total: 3, metadata: {}))
  }

  it("entrega el contenido de un criteria sin aplicarle skip ni limit") {
    criteria = Class.new {
      def initialize(datos)
        @datos = datos
      end

      def size
        @datos.size
      end

      def to_a
        @datos
      end

      # :nocov:
      def skip(_cantidad)
        raise "El paginador roto no debe aplicar skip"
      end

      def limit(_cantidad)
        raise "El paginador roto no debe aplicar limit"
      end
      # :nocov:
    }
    pagina = described_class.new.paginar(criteria.new([1, 2, 3]))

    expect(pagina).to eq(Paginacion::Pagina.new(items: [1, 2, 3], total: 3, metadata: {}))
  }
}
