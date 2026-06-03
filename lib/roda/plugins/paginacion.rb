require "uri"
require_relative "../../paginacion"

class Roda
  module RodaPlugins
    module Paginacion
      PAGINADOR_POR_DEFECTO = ->(request) {
        pagina = request.params["pagina"].to_s
        if pagina.match?(/\A\d+t\d+\z/)
          numero, tamaño = pagina.split("t")
          ::Paginacion::Paginador::Estandar.para_pagina(numero: numero.to_i, tamaño: tamaño.to_i)
        else
          ::Paginacion::Paginador::Roto.new
        end
      }

      def self.load_dependencies(app, _opts = {})
        json = RodaPlugins.load_plugin(:json)
        app.plugin json unless app.plugins.include?(json)
      end

      def self.configure(app, opts = {})
        app.opts[:custom_block_results][::Paginacion::Pagina] = :renderizar_pagina
        app.opts[:paginador] = opts[:paginador] || PAGINADOR_POR_DEFECTO
      end

      module InstanceMethods
        def paginador
          opts[:paginador].call(request)
        end

        def renderizar_pagina(pagina)
          response["Total-Items"] = pagina.total.to_s
          pagina.metadata.each { |clave, valor|
            clave_cabecera = clave.to_s.tr("_", "-")
            json = request.send(:convert_to_json, valor)
            response[clave_cabecera] = URI.encode_www_form_component(json)
          }
          handle_json_block_result(pagina.to_a)
        end
      end
    end

    register_plugin(:paginacion, Paginacion)
  end
end
