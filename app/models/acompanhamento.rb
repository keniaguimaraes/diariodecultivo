class Acompanhamento < ApplicationRecord
    belongs_to:genero
    belongs_to:tipo
    belongs_to:user
    belongs_to:cid
end
