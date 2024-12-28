class Dash < ApplicationRecord

    has_one :reader

    validates :reader_id, uniqueness: true

end
