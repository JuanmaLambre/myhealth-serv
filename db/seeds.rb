puts "Starting database seeding..."

puts "Create Medical Plans..."
medical_plan_310 = MedicalPlan.find_or_create_by number: 310
medical_plan_410 = MedicalPlan.find_or_create_by number: 410

puts "Create Users..."
user1 = User.find_or_create_by document_number: 38425159, medical_plan: medical_plan_310
user1.update! first_name: 'Cosme', last_name: 'Fulanito'
User.find_or_create_by document_number: 11111111, medical_plan: medical_plan_310
User.find_or_create_by document_number: 11111112, medical_plan: medical_plan_310
User.find_or_create_by document_number: 11111113, medical_plan: medical_plan_310

puts "Create Specialities..."
traumatologia = Specialty.find_or_create_by name: "Traumatología"
oftalmologia = Specialty.find_or_create_by name: "Oftalmología"
Specialty.find_or_create_by name: "Pediatría"
Specialty.find_or_create_by name: "Radiología"
load './db/specs.rb'

puts "Create Study types..."
study_type = StudyType.find_or_create_by name: 'Tomografía'

puts "Create Health Providers..."
HealthProvider.find_or_create_by(name: 'Hospital Aleman') do |hp|
	hp.latitude = -34.5922517
	hp.longitude = -58.4038044
	hp.address = 'Av. Pueyrredón 164'
	hp.phone_number = '45667834'
	hp.specialty = traumatologia
	hp.languages = 'español, alemán, inglés'
	hp.medical_plans_accepted << [medical_plan_310, medical_plan_410]
	hp.provider_type = :hospital
	hp.save!
end

HealthProvider.find_or_create_by(name: 'Harry') do |hp|
	hp.latitude = -34.6177975
	hp.longitude = -58.3689796
	hp.address = 'Av. Paseo Colon y Av. Independencia'
	hp.phone_number = '45667835'
	hp.specialty = oftalmologia
	hp.languages = 'español'
	hp.medical_plans_accepted << [medical_plan_310]
	hp.provider_type = :doctor
	hp.save!
end

hp = HealthProvider.find_or_create_by(name: 'Hermione') do |hp|
	hp.latitude = -34.5048425
	hp.longitude = -58.4992926
	hp.address = 'Av. Maipu y Ugarte'
	hp.phone_number = '45667836'
	hp.specialty = traumatologia
	hp.languages = 'español, inglés'
	hp.medical_plans_accepted << [medical_plan_310]
	hp.provider_type = :doctor
	hp.save!
end

Authorization.create!(requester: user1, specialty: traumatologia, status: :requested, provider: hp, study_type: study_type)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', role: 'Admin') if Rails.env.development? && !AdminUser.find_by(email: "admin@example.com").present?
AdminUser.create!(email: 'god@example.com', password: 'password', password_confirmation: 'password', role: 'Admin') if Rails.env.development? && !AdminUser.find_by(email: "god@example.com").present?


puts "Database seeding finished"
