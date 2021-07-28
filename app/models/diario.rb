class Diario < ApplicationRecord
    belongs_to :administracao
    belongs_to :acompanhamento
    has_many:efeitodiario
   

end
