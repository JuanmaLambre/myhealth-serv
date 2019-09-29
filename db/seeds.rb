puts "Create Users..."
User.find_or_create_by document_number: 38425159, medical_plan_number: 310
User.find_or_create_by document_number: 11111111, medical_plan_number: 310
User.find_or_create_by document_number: 11111112, medical_plan_number: 310
User.find_or_create_by document_number: 11111113, medical_plan_number: 310

puts "Create Health Providers..."
HealthProvider.find_or_create_by(name: 'Hospital Aleman') do |hp|
	hp.latitude = -34.5922517
	hp.longitude = -58.4038044
	hp.address = 'Av. Pueyrredón 164'
	hp.phone_number = '45667834'
	hp.specialty = 'traumatologo'
	hp.languages = 'español, alemán, inglés'
	hp.medical_plan_numbers_accepted = '310, 410, 510'
	hp.provider_type = :hospital
	hp.save!
end

HealthProvider.find_or_create_by(name: 'Harry') do |hp|
	hp.latitude = -34.6177975
	hp.longitude = -58.3689796
	hp.address = 'Av. Paseo Colon y Av. Independencia'
	hp.phone_number = '45667835'
	hp.specialty = 'oculista'
	hp.languages = 'español'
	hp.medical_plan_numbers_accepted = '310'
	hp.provider_type = :doctor
	hp.save!
end

HealthProvider.find_or_create_by(name: 'Hermione') do |hp|
	hp.latitude = -34.5048425
	hp.longitude = -58.4992926
	hp.address = 'Av. Maipu y Ugarte'
	hp.phone_number = '45667836'
	hp.specialty = 'traumatologo'
	hp.languages = 'español, inglés'
	hp.medical_plan_numbers_accepted = '310, 410'
	hp.provider_type = :doctor
	hp.save!
end