class Authorization < ApplicationRecord
	enum status: { requested: 'Pedido', evaluation: 'En evaluación',
                 declined: 'Rechazado', accepted: 'Aceptado' }

	belongs_to :requester, class_name: 'User'
	belongs_to :specialty
	belongs_to :provider, class_name: 'HealthProvider'

	has_one_attached :image
end
