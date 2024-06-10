class AddArtefatoToAtividades < ActiveRecord::Migration[6.1]
  def change
    add_reference :atividades, :artefato, null: true, foreign_key: true
  end
end
