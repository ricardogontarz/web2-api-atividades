class Atividade < ApplicationRecord
  has_many :artefatos, dependent: :nullify
  accepts_nested_attributes_for :artefatos
end
