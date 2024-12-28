class Reader < ApplicationRecord

    has_one :dash
    has_many :escalations_readers
    has_many :escalations, through: :escalations_readers

    validates :name, :email, :phone_number, presence: true
    validates :email, :phone_number, uniqueness: true

    after_create :create_dash
    before_destroy :destroy_dash, :destroy_escalation_reader

    def create_dash
        dash = Dash.create(reader_id: self.id)
        self.update(dash_id: dash.try(:id))
    end

    def destroy_dash
        dash = Dash.find_by(reader_id: self.id)
        unless dash.nil?
            self.update(dash_id: nil)
            dash.update(reader_id: nil)
            dash.destroy
        end
    end

    def destroy_escalation_reader
        er = EscalationsReader.where(reader_id: self.id)
        unless er == []
            er.destroy_all
        end
    end

end
