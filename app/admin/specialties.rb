ActiveAdmin.register Specialty do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  config.filters = false

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
