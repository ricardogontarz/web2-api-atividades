class Artefato < ApplicationRecord
  belongs_to :atividade, optional: true
end
