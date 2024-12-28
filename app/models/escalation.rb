class Escalation < ApplicationRecord

    has_many :escalations_readers
    has_many :readers, through: :escalations_readers

    validates :effective_date, :liturgical_time, presence: true

end
