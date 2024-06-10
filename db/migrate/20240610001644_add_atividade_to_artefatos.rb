class AddAtividadeToArtefatos < ActiveRecord::Migration[6.1]
  def change
    add_reference :artefatos, :atividade, null: true, foreign_key: true
  end
end
