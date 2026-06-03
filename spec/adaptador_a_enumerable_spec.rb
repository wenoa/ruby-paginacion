RSpec.describe(Paginacion::AdaptadorAEnumerable) {
  it("expone una fuente arbitraria como enumerable paginable") {
    adaptador = described_class.new(
      size: -> { 5 },
      slice: ->(desde, cantidad) { [10, 20, 30, 40, 50].slice(desde, cantidad) },
    )

    pagina = Paginacion::Paginador::Estandar.para_pagina(numero: 2, tamaño: 2).paginar(adaptador)

    expect(pagina).to eq(Paginacion::Pagina.new(items: [30, 40], total: 5, metadata: {}))
  }
}
