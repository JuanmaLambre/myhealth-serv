# == Schema Information
#
# Table name: authorizations
#
#  id             :bigint           not null, primary key
#  requester_id   :bigint
#  provider_id    :bigint
#  specialty_id   :bigint
#  status         :string(255)
#  processed_time :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  comment        :text(65535)
#  authorizer_id  :bigint
#

FactoryBot.define do
  factory :authorization do
    
  end
end
