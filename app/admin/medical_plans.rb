ActiveAdmin.register MedicalPlan do
	permit_params :number, autmatically_accepted_specialty_ids: []

	config.filters = false

	index do
		id_column
		column "Número", :number
		actions
	end

	show do
		attributes_table do
			row 'Id' do |mp|
				mp.id
			end
			row 'Número' do |mp|
				mp.number
			end
			row 'Especialidades de autorizaciones que son aprobadas automáticamente' do |mp|
				mp.autmatically_accepted_specialties.pluck(:name)
			end
		end
	end

	form do |f|
		f.inputs do
			f.input :number, label: "Número"
			f.input :autmatically_accepted_specialties, :as => :check_boxes, 
				label: "Especialidades de autorizaciones que son aprobadas automáticamente", 
				collection: Specialty.all
		end
		f.actions
	end
end
 