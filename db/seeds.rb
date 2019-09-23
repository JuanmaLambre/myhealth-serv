puts "Starting database seeding..."

puts "Create Users..."
User.find_or_create_by document_number: 38425159, medical_plan_number: 310
User.find_or_create_by document_number: 11111111, medical_plan_number: 310
User.find_or_create_by document_number: 11111112, medical_plan_number: 310
User.find_or_create_by document_number: 11111113, medical_plan_number: 310

puts "Create Hospitals..."
aleman = Hospital.find_or_create_by(name: 'Hospital Aleman') do |h|
	h.latitude = -34.5922517
	h.longitude = -58.4038044
	h.address = 'Av. Pueyrredón 164'
	h.save!
end
fiuba = Hospital.find_or_create_by(name: 'Hospital FIUBA') do |h|
	h.latitude = -34.6175988
	h.longitude = -58.3776464
	h.address = 'Av. Paseo Colón 822'
	h.save!
end
vilo = Hospital.find_or_create_by(name: 'Hospital Vilo') do |h| 
	h.latitude = -34.5233629
	h.longitude = -58.5043826
	h.address = 'Gdor. Ugarte 1501'
	h.save!
end

puts "Create Specialities..."
traumatologia = Specialty.find_or_create_by name: "Traumatología"
oftalmologia = Specialty.find_or_create_by name: "Oftalmología"

puts "Create Doctors..."
Doctor.find_or_create_by(name: 'Harry') do |d|
	d.phone_number = 1559638738
	d.hospital = aleman
	d.specialty = traumatologia
	d.save!
end
Doctor.find_or_create_by(name: 'Ron') do |d|
	d.phone_number = 1559638739
	d.hospital = fiuba
	d.specialty = traumatologia
	d.save!
end
Doctor.find_or_create_by(name: 'Hermione') do |d|
	d.phone_number = 1559638740
	d.hospital = vilo
	d.specialty = oftalmologia
	d.save!
end


puts "Database seeding finished"
