class Authorization < ApplicationRecord
	enum status: { requested: 'requested', evaluation: 'evaluation', 
                 declined: 'declined', accepted: 'accepted' }

	belongs_to :requester, class_name: 'User'
	belongs_to :specialty
	belongs_to :provider, class_name: 'HealthProvider'

end
