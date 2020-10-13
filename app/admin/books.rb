ActiveAdmin.register Book do
  
  permit_params :book_title, author_ids: []
  includes :authors


  index do
    selectable_column
    id_column
    column :book_title
    actions
  end

  form do |f|
    f.inputs do
      f.semantic_errors *f.object.errors.keys
      f.input :book_title
      f.input :author_ids, label: 'Author', as: :select, collection: Author.all.pluck(:first_name, :id), input_html: { multiple: true }
    end
    f.actions
  end

  show do
    attributes_table do
      row :book_title
    end
    panel "Author Details" do
      table_for(book.authors) do
        column :id do |author|
          link_to author.id, admin_author_path(author)
        end
        column :first_name
        column :last_name
        column :date_of_birth
        column :created_at
        column :updated_at
      end
    end
  end

  controller do

    def create
      create! { |success,failure|
        success.html do
          redirect_to admin_books_path
        end
      }
    end

    def update
      update! { |success,failure|
        success.html do
          redirect_to admin_books_path
        end
      }
    end

  end

end