Trestle.resource(:email_templates) do

  menu do
    group :email_sytems, priority: :first do
      item :email_templates, icon: "fa fa-envelope"
    end
  end

  scopes do
    scope :all, default: true
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :subject
    column :html_content
    column :category
    column :created_at, align: :center
    column :active, align: :center

    actions do |toolbar, email_template, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
    end

  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |email_template|
    tab :post do
      text_field :name
      text_field :subject
      editor :html_content
      select :category, EmailTemplate.distinct.pluck(:category)
      check_box :active
      # Define custom form fields for easy re-use
    end

  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:email_template).permit(:name, ...)
  # end
end
