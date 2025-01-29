# app/admin/inventories.rb
ActiveAdmin.register Inventory do
  permit_params :item_type, :item_name, :quantity, :crust_id, :side_id, :topping_id

  index do
    selectable_column
    id_column
    column :item_type
    column :item_name
    column :quantity
    column :created_at
    column :updated_at
    actions
  end

  filter :item_type
  filter :item_name
  filter :quantity
  filter :created_at

  form do |f|
    f.inputs do
      f.input :item_type, as: :select, collection: ['Crust', 'Side', 'Topping']
      f.input :item_name
      f.input :quantity
      f.input :crust, as: :select, collection: Crust.all, include_blank: true
      f.input :side, as: :select, collection: Side.all, include_blank: true
      f.input :topping, as: :select, collection: Topping.all, include_blank: true
    end
    f.actions
  end

  # Custom logic to update or delete expired stock
  member_action :mark_as_expired, method: :put do
    resource.update(quantity: 0) # Mark the stock as expired by setting the quantity to 0
    redirect_to collection_path, notice: "Inventory item marked as expired"
  end

  action_item :mark_as_expired, only: :show do
    link_to 'Mark as Expired', mark_as_expired_admin_inventory_path(inventory), method: :put
  end
end
