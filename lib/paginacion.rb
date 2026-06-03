require_relative "paginacion/pagina"
require_relative "paginacion/paginable/base"
require_relative "paginacion/paginable/enumerable"
require_relative "paginacion/paginable/criteria"
require_relative "paginacion/paginador/base"
require_relative "paginacion/paginador/estandar"
require_relative "paginacion/paginador/roto"
require_relative "paginacion/adaptador_a_enumerable"

module Paginacion
  def self.paginador_estandar(...)
    Paginador::Estandar.para_pagina(...)
  end

  def self.paginador_roto
    Paginador::Roto.new
  end
end
