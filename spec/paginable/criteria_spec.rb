class CriteriaFalso
  def initialize(datos)
    @datos = datos
  end

  def size
    @datos.size
  end

  def skip(cantidad)
    @desde = cantidad
    self
  end

  def limit(cantidad)
    @cantidad = cantidad
    self
  end

  def to_a
    @datos.slice(@desde, @cantidad) || []
  end
end

RSpec.describe(Paginacion::Paginable::Criteria) {
  it("pagina algo que responde a skip y limit") {
    criteria = CriteriaFalso.new([1, 2, 3, 4, 5])

    pagina = Paginacion::Paginador::Estandar.para_pagina(numero: 2, tamaño: 2).paginar(criteria)

    expect(pagina).to eq(Paginacion::Pagina.new(items: [3, 4], total: 5, metadata: {}))
  }
}
