class EscalationsReader < ApplicationRecord

    belongs_to :reader
    belongs_to :escalation

    validates :reader_id, :escalation_id, :role, :did_serve, presence: true
    validates_uniqueness_of :reader_id, scope: :escalation_id

end
