ActiveAdmin.register Specialty do
	permit_params :name

	config.filters = false

	index do
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
