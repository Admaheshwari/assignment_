ActiveAdmin.register Author do
  
  permit_params :first_name, :last_name, :date_of_birth


  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :date_of_birth
    actions
  end

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :first_name
      f.input :last_name
      f.input :date_of_birth, as: :datepicker
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :date_of_birth
    end
    panel "Author books" do
      table_for(author.books) do
        column :id do |book|
          link_to book.id, admin_book_path(book)
        end
        column :book_title
        column :created_at
        column :updated_at
      end
    end
  end

  controller do

    def create
      create! { |success,failure|
        success.html do
          redirect_to admin_authors_path
        end
      }
    end

    def update
      update! { |success,failure|
        success.html do
          redirect_to admin_authors_path
        end
      }
    end

  end

end