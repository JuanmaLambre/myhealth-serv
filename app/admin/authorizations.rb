ActiveAdmin.register Authorization do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :status, :image, :comment, :processed_time, :authorizer
  #
  # or
  #
  # permit_params do
  #   permitted = [:requester_id, :provider_id, :specialty_id, :status, :processed_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  actions :all, :except => [:new]

  filter :status, as: :select, collection: Authorization.statuses.values 
  filter :provider
  filter :requester_email, as: :string

  controller do
    def update
      authorization = UpdateAuthorization.new(authorization_params: params, current_user: current_admin_user).execute()
      redirect_to admin_authorization_path(authorization.id)
    end
  end

  index do
    id_column
    column "Prestador" do |a|
      a.provider.name unless !a.provider.present?
    end
    column "Especialidad", :specialty

    column "Solicitante" do |a|
      a.requester.email
    end
    column "Plan" do |a|
      a.requester.medical_plan_number
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
        a.requester.medical_plan_number
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
        image_tag(a.requester_image, width:273,height:248) if a.requester_image.attached?
      end
      row 'Imagen de la resolución' do |a|
        image_tag(a.image, width:273,height:248) if a.image.attached?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, selected: Authorization.statuses[f.object.status], label: "Estado", as: :select, include_blank: false, collection: Authorization.statuses.values
      f.input :image, label: "Imagen", :as => :file
      f.input :comment, label: "Observaciones"
    end
    f.actions
  end
  
end
