class Escalation < ApplicationRecord

    has_many :escalations_readers
    has_many :readers, through: :escalations_readers

    validates :effective_date, :liturgical_time, presence: true

    before_destroy :destroy_escalation_reader

    def destroy_escalation_reader
        er = EscalationsReader.where(escalation_id: self.id)
        unless er == []
            er.destroy_all
        end
    end

end
