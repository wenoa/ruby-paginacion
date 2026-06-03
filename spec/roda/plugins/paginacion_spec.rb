require "json"
require "uri"

RSpec.describe("El plugin de paginación de Roda") {
  let(:app) {
    Class.new(Roda) {
      plugin :paginacion

      route { |r|
        r.get("vacia") {
          Paginacion::Pagina.new(
            items: [],
            total: 0,
            metadata: {},
          )
        }

        r.get("completa") {
          Paginacion::Pagina.new(
            items: [1, 2],
            total: 5,
            metadata: {
              total_existencias: {
                unidad: "kg",
                cantidad: 100,
              },
            },
          )
        }
      }
    }
  }

  it("renderiza una página vacía") {
    get("/vacia")

    expect(last_response.headers["Content-Type"]).to eq("application/json")
    expect(last_response.headers["Total-Items"]).to eq("0")
    expect(JSON.parse(last_response.body)).to eq([])
  }

  it("renderiza una página con su contenido, su total y su metadata") {
    get("/completa")

    expect(last_response.headers["Content-Type"]).to eq("application/json")
    expect(last_response.headers["Total-Items"]).to eq("5")
    expect(JSON.parse(last_response.body)).to eq([1, 2])

    metadato = URI.decode_www_form_component(last_response.headers["total-existencias"])
    expect(JSON.parse(metadato)).to eq({ "unidad" => "kg", "cantidad" => 100 })
  }

  context("con el paginador por defecto") {
    let(:app) {
      Class.new(Roda) {
        plugin :paginacion

        route { |r|
          r.get("items") {
            paginador.paginar([1, 2, 3, 4, 5])
          }
        }
      }
    }

    it("devuelve la página que pide la request") {
      get("/items?pagina=2t2")

      expect(last_response.headers["Total-Items"]).to eq("5")
      expect(JSON.parse(last_response.body)).to eq([3, 4])
    }

    it("devuelve todo el contenido cuando la request no pide una página") {
      get("/items")

      expect(last_response.headers["Total-Items"]).to eq("5")
      expect(JSON.parse(last_response.body)).to eq([1, 2, 3, 4, 5])
    }
  }

  context("cuando se especifica cómo construir el paginador") {
    let(:app) {
      Class.new(Roda) {
        plugin :paginacion, paginador: ->(_request) { Paginacion::Paginador::Estandar.para_pagina(numero: 1, tamaño: 2) }

        route { |r|
          r.get("items") {
            paginador.paginar([1, 2, 3, 4, 5])
          }
        }
      }
    }

    it("usa el paginador que configuró la app") {
      get("/items")

      expect(JSON.parse(last_response.body)).to eq([1, 2])
    }
  }

  context("cuando la app ya cargó el plugin json") {
    let(:app) {
      Class.new(Roda) {
        plugin :json, content_type: "application/vnd.api+json"
        plugin :paginacion

        route { |r|
          r.get("items") {
            Paginacion::Pagina.new(items: [1, 2], total: 5, metadata: {})
          }
        }
      }
    }

    it("no pisa su configuración") {
      get("/items")

      expect(last_response.headers["Content-Type"]).to eq("application/vnd.api+json")
    }
  }
}
