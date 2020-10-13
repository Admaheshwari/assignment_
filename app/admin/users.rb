ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :created_at
    end
  end

  before_create do
    resource.user_role = 'admin'
  end

  controller do

    def scoped_collection
      User.where(user_role: 'admin')
    end

    def create
      create! { |success,failure|
        success.html do
          redirect_to admin_users_path
        end
      }
    end

    def update
      update! { |success,failure|
        success.html do
          redirect_to admin_users_path
        end
      }
    end

    def update_resource object, attributes
      attributes.each do |attr|
        if attr[:password].blank? and attr[:password_confirmation].blank?
          attr.delete :password
          attr.delete :password_confirmation
        end
      end

      object.send :update_attributes, *attributes
    end

  end

end
