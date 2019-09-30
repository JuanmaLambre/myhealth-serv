class Authorization < ApplicationRecord
	enum status: { requested: 'requested', evaluation: 'evaluation', 
                 declined: 'declined', accepted: 'accepted' }

end
