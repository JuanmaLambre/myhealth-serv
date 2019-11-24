ActiveAdmin.register AdminUser do
	permit_params :email, :password, :password_confirmation, :role, :signature

	index download_links: false do
		column :email
		column "Rol", :role
		column "Creada", :created_at

		actions
	end

	filter :email

	form do |f|
		f.inputs do
			f.input :email
			f.input :password, label: "Contraseña"
			f.input :password_confirmation, label: "Confirmar contraseña"
			f.input :role, label: "Rol", as: :select, include_blank: false, collection: AdminUser.roles.values
			f.input :signature, label: "Firma electrónica", as: :file
		end
		f.actions
	end

	show do
		attributes_table do
			row 'Email' do |r|
				r.email
			end
			row 'Rol' do |r|
				r.role
			end
			row 'Firma electrónica' do |a|
				image_tag(a.signature) if a.signature.attached?
			end
			row 'Creada en' do |r|
				r.created_at
			end
		end
	end
end
