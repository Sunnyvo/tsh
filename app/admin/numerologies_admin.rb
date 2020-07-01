Trestle.resource(:numerologies) do

  menu do
    group :custommers_management, priority: :first do
      item :numerologies, icon: "fa fa-file-text-o"
    end
  end
  scopes do
    scope :all, default: true
  end

  # Customize the table columns shown on the index view.

  table do
    column :name, header: "Họ và tên", align: :center
    column :day_of_birth, header: "Ngày sinh", align: :center
    column :email, header: "Email", align: :center
    column :phone, header: "Điện thoại", align: :center

    # column :sent_demo, align: :center do |numerology|
    #   status_tag(icon("fa fa-square-o"), :success) if (numerology.name == "vo tan phu")
    # end

    # column :sent_full, align: :center do |numerology|
    #   status_tag(icon("fa fa-check"), :success) if (numerology.name != "vo tan phu")
    # end
    column :updated_at, header: "Cập nhật", align: :center
    column :created_at, header: "Ngày tạo", align: :center

    actions do |toolbar, numerology, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
      toolbar.link 'Gửi email', numerology, action: :send_demo_tsh, method: :get, style: :primary, icon: "fa fa-square-o"  if (numerology.sent_mail == false)
      toolbar.link 'Gửi email', numerology, action: :send_demo_tsh, method: :get, style: :primary, icon: "fa fa-check"  if (numerology.sent_mail == true)
    end
    # column :address
    # actions
  end

  form do
    # Organize fields into tabs and sidebars
    tab :numerology do
      text_field :name
      datetime_field :day_of_birth
      text_field :email
      text_field :phone
      text_area :desire
      hidden_field :user_id, {:value => current_user.id}

    end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #

  controller do
    def send_demo_tsh
      puts "hello:"
      # puts params
      numerology = Numerology.find_by_id(params["id"])
      puts numerology
      numerology.update!(sent_mail: true)
      # file = "#{Rails.root}/app/data/out.pdf"
      # send_file(file, disposition: 'attachment',type: "application/pdf")
      UserMailer.send_demo(email: numerology.email,
      name: numerology.name,
      id: numerology.id).deliver_later
      flash[:message] = "bạn đã gửi email cho khách hàng thành công"
      redirect_to numerologies_admin_index_path
    end
  end

  routes do
    get :send_demo_tsh, on: :member
    get :send_full, on: :member
  end

  params do |params|
    params.require(:numerology).permit(:name, :day_of_birth, :email, :phone, :desire, :user_id)
  end
end
