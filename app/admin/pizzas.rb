ActiveAdmin.register Pizza do
  # Permit parameters for creating/updating Pizza records
  permit_params :name, :price, :size, :category

  # Define the Pizza index page
  index do
    selectable_column
    id_column
    column :name
    column :category
    column :size
    column :price
    column :created_at
    column :updated_at
    actions
  end

  # Add filters for the Pizza page
  filter :name
  filter :category
  filter :size
  filter :price
  filter :created_at
  filter :updated_at

  # Show page for Pizza
  show do
    attributes_table do
      row :id
      row :name
      row :category
      row :size
      row :price
      row :created_at
      row :updated_at
    end
  end

  # Form for creating/editing Pizza
  form do |f|
    f.inputs do
      f.input :name
      f.input :category, as: :select, collection: ["Vegetarian", "Non-Vegetarian"]
      f.input :size, as: :select, collection: ["Regular", "Medium", "Large"]
      f.input :price
    end
    f.actions
  end
end
