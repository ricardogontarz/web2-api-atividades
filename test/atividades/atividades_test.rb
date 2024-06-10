# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../config/environment'

class AtividadesTest < Minitest::Test
  def setup
    @atividade = Atividade.create(title: "Sample", content: "This is a sample.")
    @art1 = Artefato.create(name: "art1", atividade: @atividade)
    @art2 = Artefato.create(name: "art2", atividade: @atividade)
  end

  def teardown
    Atividade.destroy_all
    Artefato.destroy_all
  end

  def test_atividade_creation
    assert_equal 2, @atividade.artefatos.count
  end

  def test_artefato_belongs_to_atividade
    assert_equal @atividade, @art1.atividade
    assert_equal @atividade, @art2.atividade
  end

  def test_atividade_can_have_many_artefatos
    atividade = Atividade.create(title: "New Activity", content: "This activity has many artefatos.")
    artefato1 = Artefato.create(name: "artefato1", atividade: atividade)
    artefato2 = Artefato.create(name: "artefato2", atividade: atividade)

    assert_equal 2, atividade.artefatos.count
    assert_includes atividade.artefatos, artefato1
    assert_includes atividade.artefatos, artefato2
  end

  def test_create_atividade_with_artefatos
    atividade_params = {
      title: "Activity with Artefatos",
      content: "This activity has multiple artefatos.",
      artefatos_attributes: [
        { name: "Artefato 1" },
        { name: "Artefato 2" }
      ]
    }

    atividade = Atividade.create(atividade_params)

    assert_equal 2, atividade.artefatos.count
    assert_equal "Artefato 1", atividade.artefatos.first.name
    assert_equal "Artefato 2", atividade.artefatos.second.name
  end

  def test_create_atividade_with_no_artefatos
    atividade_params = {
      title: "Activity with no Artefatos",
      content: "This activity has no artefatos."
    }

    atividade = Atividade.create(atividade_params)

    assert_equal 0, atividade.artefatos.count
  end
end
