RSpec.describe(Paginacion::Paginador::Roto) {
  it("entrega todo el contenido en una única página") {
    pagina = described_class.new.paginar([1, 2, 3])

    expect(pagina).to eq(Paginacion::Pagina.new(items: [1, 2, 3], total: 3, metadata: {}))
  }
}
