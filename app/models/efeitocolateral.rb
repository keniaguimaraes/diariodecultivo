class Efeitocolateral < ApplicationRecord
    belongs_to :user
    has_many :efeitodiario
end
