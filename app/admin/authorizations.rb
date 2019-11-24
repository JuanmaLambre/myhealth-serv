ActiveAdmin.register Authorization do
	permit_params :id, :status, :image, :comment, :processed_time, :authorizer

	actions :all, :except => [:new]

	filter :status, label: "Estado", as: :select, collection: Authorization.statuses.values
	filter :provider, label: "Prestador"
	filter :requester_email, label: "Mail del solicitante", as: :string

	controller do
		def update
			if current_admin_user.has_signature? then
				authorization = UpdateAuthorization.new(authorization_params: params, current_user: current_admin_user).execute
				redirect_to admin_authorization_path(authorization.id)
			else
				redirect_to admin_authorization_path(params['id']), flash: {error: "El usuario autorizador no tiene una firma electrónica cargada"}
			end
		end

		def show
			resource.evaluation! if resource.requested?
			super
		end
	end

	index do
		column "Prestador" do |a|
			a.provider.name unless !a.provider.present?
		end
		column "Especialidad", :specialty
		column "Tipo de Estudio", :study_type
		column "Solicitante" do |a|
			a.requester.email
		end
		column "Plan" do |a|
			a.requester.medical_plan.number
		end
		column "Fecha de pedido", :created_at
		column "Estado" do |a|
			Authorization.statuses[a.status]
		end
		column "Fecha de procesamiento" , :processed_time
		actions
	end

	show do
		attributes_table do
			row 'Estado' do |a|
				Authorization.statuses[a.status]
			end
			row 'Prestador' do |a|
				a.provider.name unless !a.provider.present?
			end
			row 'Especialidad' do |a|
				a.specialty
			end
			row 'Tipo de estudio' do |a|
				a.study_type
			end
			row 'Solicitante' do |a|
				a.requester.email
			end
			row 'Nombre del solicitante' do |a|
				a.requester.first_name
			end
			row 'Apellido del solicitante' do |a|
				a.requester.last_name
			end
			row 'Plan' do |a|
				a.requester.medical_plan.number
			end
			row 'Fecha de pedido' do |a|
				a.created_at
			end
			row 'Fecha de procesamiento' do |a|
				a.processed_time
			end
			row 'Observaciones' do |a|
				a.comment
			end
			row 'Autorizador' do |a|
				a.authorizer.email if a.authorizer.present?
			end
			row 'Imagen del solicitante' do |a|
				image_tag(a.requester_image) if a.requester_image.attached?
			end
			row 'Imagen de la resolución' do |a|
				image_tag(a.image, width:273,height:248) if a.image.attached?
			end
		end
	end

	form do |f|
		f.inputs do
			f.input :status, selected: Authorization.statuses[f.object.status], label: "Estado", 
				as: :select, include_blank: false, collection: AuthorizationAdminStatus.values.values
			f.input :comment, label: "Observaciones"
		end
		f.actions
	end
end
