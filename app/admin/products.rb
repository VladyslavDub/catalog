ActiveAdmin.register Product do
    permit_params :name, :description, :meta_title, :meta_description, :keywords, :price, :category_id, :maker_id, :available, :image, images: []
  
    includes :maker, :category
  
    filter :name
    filter :description
    filter :price
    filter :category
    filter :maker
    filter :available
    filter :created_at
    filter :updated_at
  
    scope :all
    scope :availables
    scope :unavailables
  
    index do
      selectable_column
      id_column
      column :name
      column :meta_title
      column :available
      column :price
      column :category
      column :maker
      column :created_at
      actions
    end
  
    show do
      attributes_table do
        row :name
        row :available
        row :price
        row :maker
        row :category
        row :description
  
        row :meta_title
        row :meta_description
        row :keywords
  
  
        row :image do
          image_tag product.image if product.image.attached?
        end
        row :images do
           product.images.each do |image|
             div image_tag image
           end
        end
        row :created_at
        row :updated_at
      end
    end
  
  
    form do |f|
      tabs do
        tab 'BASE' do
          f.inputs do
            f.input :name
            f.input :available
            f.input :price
            f.input :maker
            f.input :category
            f.input :description, as: :text
  
            f.input :image, as: :file
            f.input :images, as: :file, multiple: true
          end
        end
        tab 'META' do
          f.inputs do
            f.input :meta_title
            f.input :meta_description, as: :text
            f.input :keywords
          end
        end
      end
      f.actions
    end
  
  
  end