Trestle.resource(:num_contents) do
  search do |query|
    if query
      NumContent.where("subject ILIKE ?", "%#{query}%")
    else
      NumContent.all
    end
  end

  menu do
    group :content_number_management, priority: :first do
      item :num_contents, icon: "fa fa-star"
    end
  end

  scopes do
    scope :all, default: true
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :number
    column :category
    column :subject
    column :content
    column :advise
    column :created_at, align: :center
    column :active, align: :center

    actions do |toolbar, num_content, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
    end

  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |num_content|
    tab :post do
      select :category, NumContent::CATEGORY.map{|x| x[:value]}
      text_field :number
      text_field :subject
      editor :content
      editor :advise
      check_box :active
      # Define custom form fields for easy re-use
    end

  end
  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |num_content|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:num_content).permit(:name, ...)
  # end
end
