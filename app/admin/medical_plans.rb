ActiveAdmin.register MedicalPlan do
	config.filters = false

	controller do
		def permitted_params
			params.permit!
		end
	end

	index do
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
			row 'Tipos de estudios de autorizaciones que son aprobadas automáticamente' do |mp|
				mp.autmatically_accepted_studies.pluck(:name)
			end
		end
	end

	form do |f|
		f.inputs do
			f.input :number, label: "Número"
			f.input :autmatically_accepted_studies, :as => :check_boxes, 
				label: "Tipos de estudios de autorizaciones que son aprobadas automáticamente", 
				collection: StudyType.all
		end
		f.actions
	end
end
 