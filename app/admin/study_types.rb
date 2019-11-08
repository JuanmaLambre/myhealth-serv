ActiveAdmin.register StudyType do
	permit_params :name

	config.filters = false

	controller do
		def scoped_collection
			StudyType.where(deleted_at: nil)
		end

		def destroy
			resource.update! deleted_at: Time.current
			redirect_to collection_path
		end
	end
 
	index do
		id_column
		column "Nombre", :name
		actions
	end
 
	show do
		attributes_table do
			row 'Id' do |s|
				s.id
			end
			row 'Nombre' do |s|
				s.name
			end
		end
	end
 
	form do |f|
		f.inputs do
			f.input :name, label: "Nombre"
		end
		f.actions
	end
end