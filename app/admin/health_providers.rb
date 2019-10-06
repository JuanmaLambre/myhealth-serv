ActiveAdmin.register HealthProvider do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :phone_number, :name, :specialty, :provider_type, :languages, :medical_plan_numbers_accepted, :latitude, :longitude, :address
  #
  # or
  #
  # permit_params do
  #   permitted = [:phone_number, :name, :specialty, :provider_type, :languages, :medical_plan_numbers_accepted, :latitude, :longitude, :address]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  #
  #
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
        hp.medical_plan_numbers_accepted
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
      f.input :latitude, label: "Latitud"
      f.input :longitude, label: "Longitud"
      f.input :address, label: "Dirección"
      f.input :medical_plan_numbers_accepted, label: "Números de planes aceptados"
      f.input :languages, label: "Idioma"
    end
    f.actions
  end
  
end
