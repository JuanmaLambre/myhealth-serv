class Doctor < ApplicationRecord
	belongs_to :hospital
    belongs_to :specialty

	acts_as_mappable :through => :hospital
end
