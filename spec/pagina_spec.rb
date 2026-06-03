RSpec.describe(Paginacion::Pagina) {
  describe("#==") {
    context("dos páginas son iguales si") {
      it("sus items, total y metadata son iguales") {
        pagina = described_class.new(items: [1, 2], total: 3, metadata: {})

        expect(pagina).to eq(described_class.new(items: [1, 2], total: 3, metadata: {}))
      }
    }

    context("dos páginas son diferentes si") {
      it("sus items son diferentes") {
        pagina = described_class.new(items: [1, 2], total: 3, metadata: {})

        expect(pagina).not_to eq(described_class.new(items: [1, 3], total: 3, metadata: {}))
      }

      it("sus totales son diferentes") {
        pagina = described_class.new(items: [1, 2], total: 3, metadata: {})

        expect(pagina).not_to eq(described_class.new(items: [1, 2], total: 4, metadata: {}))
      }

      it("sus metadatos son diferentes") {
        pagina = described_class.new(items: [1, 2], total: 3, metadata: {})

        expect(pagina).not_to eq(described_class.new(items: [1, 2], total: 3, metadata: { a: 1 }))
      }

      it("se la compara con un objeto que no es una página") {
        pagina = described_class.new(items: [1, 2], total: 3, metadata: {})

        expect(pagina).not_to eq("no soy una página")
      }
    }
  }

  describe(".individual") {
    it("crea una página con los items, su total y sin metadata") {
      pagina = described_class.individual([1, 2, 3])

      expect(pagina).to eq(described_class.new(items: [1, 2, 3], total: 3, metadata: {}))
    }
  }

  describe("#transformar") {
    it("transforma su contenido sin perder el total ni la metadata") {
      pagina = described_class.new(items: [1, 2], total: 5, metadata: { a: 1 })

      transformada = pagina.transformar { |n| n + 10 }

      expect(transformada).to eq(described_class.new(items: [11, 12], total: 5, metadata: { a: 1 }))
    }
  }

  describe("delega en sus items") {
    subject { described_class.new(items: [1, 2, 3], total: 3, metadata: {}) }

    it("devuelve el item en una posición dada") {
      expect(subject[1]).to eq(2)
    }

    it("se convierte en el array de sus items") {
      expect(subject.to_a).to eq([1, 2, 3])
    }

    it("sabe si está vacía") {
      expect(subject).not_to be_vacia
      expect(described_class.new(items: [], total: 0, metadata: {})).to be_vacia
    }
  }
}
