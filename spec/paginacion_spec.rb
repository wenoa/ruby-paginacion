RSpec.describe(Paginacion) {
  describe(".paginador_estandar") {
    it("delega en el paginador estándar") {
      pagina = described_class.paginador_estandar(numero: 2, tamaño: 2).paginar([1, 2, 3])

      expect(pagina).to eq(Paginacion::Pagina.new(items: [3], total: 3, metadata: {}))
    }
  }

  describe(".paginador_roto") {
    it("delega en el paginador roto que entrega todo en una única página") {
      pagina = described_class.paginador_roto.paginar([1, 2, 3])

      expect(pagina).to eq(Paginacion::Pagina.new(items: [1, 2, 3], total: 3, metadata: {}))
    }
  }
}
