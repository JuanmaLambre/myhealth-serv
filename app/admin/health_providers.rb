ActiveAdmin.register HealthProvider do
	permit_params :phone_number, :name, :specialty, :provider_type, :languages, :latitude, :longitude, 
		:address, :specialty_id, medical_plans_accepted_ids: []

	config.filters = false

	index do
		id_column
		column "Nombre", :name
		column "Número de teléfono", :phone_number
		column "Especialidad", :specialty
		column "Latitud", :latitude
		column "Longitud", :longitude
		column "Dirección", :address
		column "Tipo de prestador", :provider_type
		actions
	end

	show do
		attributes_table do
			row 'Nombre' do |hp|
				hp.name
			end
			row 'Número de teléfono' do |hp|
				hp.phone_number
			end
			row 'Especialidad' do |hp|
				hp.specialty
			end
			row 'Latitud' do |hp|
				hp.latitude
			end
			row 'Longitude' do |hp|
				hp.longitude
			end
			row 'Dirección' do |hp|
				hp.address
			end
			row 'Tipo de prestador' do |hp|
				hp.provider_type
			end
			row "Números de planes aceptados" do |hp|
				hp.medical_plans_accepted.pluck(:number)
			end
			row "Idioma" do |hp|
				hp.languages
			end
		end
	end

	form do |f|
		f.inputs do
			f.input :name, label: "Nombre"
			f.input :phone_number, label: "Número de teléfono"
			f.input :specialty, label: "Especialidad"
			f.input :provider_type, label: "Tipo de prestador", as: :select, include_blank: false, collection: HealthProvider.provider_types
            f.input :latitude, label: "Latitud", input_html: { disabled: true }
            f.input :longitude, label: "Longitud", input_html: { disabled: true } 
            f.latlng lang: :es, id_lat: :health_provider_latitude, id_lng: :health_provider_longitude, map: :yandex, height: 300, map_zoom: 16
			f.input :address, label: "Dirección"
			f.input :medical_plans_accepted, :as => :check_boxes, label: "Números de planes aceptados", collection: MedicalPlan.all
			f.input :languages, label: "Idioma"
		end
		f.actions
	end
end
