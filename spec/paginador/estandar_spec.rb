RSpec.describe(Paginacion::Paginador::Estandar) {
  it("arma la primera página con los primeros elementos según el tamaño") {
    pagina = described_class.para_pagina(numero: 1, tamaño: 2).paginar([1, 2, 3])

    expect(pagina).to eq(Paginacion::Pagina.new(items: [1, 2], total: 3, metadata: {}))
  }

  it("se desplaza a la página indicada por su número") {
    pagina = described_class.para_pagina(numero: 2, tamaño: 2).paginar([1, 2, 3])

    expect(pagina).to eq(Paginacion::Pagina.new(items: [3], total: 3, metadata: {}))
  }

  it("devuelve una página vacía cuando se pide más allá del final") {
    pagina = described_class.para_pagina(numero: 5, tamaño: 2).paginar([1, 2, 3])

    expect(pagina).to eq(Paginacion::Pagina.new(items: [], total: 3, metadata: {}))
  }

  it("incluye en la página la metadata recibida") {
    pagina = described_class.para_pagina(numero: 1, tamaño: 2).paginar([1, 2, 3], { total: 100 })

    expect(pagina.metadata).to eq({ total: 100 })
  }
}
