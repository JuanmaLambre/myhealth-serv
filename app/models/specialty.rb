# == Schema Information
#
# Table name: specialties
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specialty < ApplicationRecord
  before_destroy :check_for_health_providers

  def check_for_health_providers
    if HealthProvider.where(specialty_id: id).count > 0
      errors.add(:base, "Está especialidad la tiene asignada un prestador, primero debe cambiarsela al prestador para poder elimanarla")
      throw :abort
    end
  end
end
