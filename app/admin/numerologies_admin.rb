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

    column :name2, header: "Crush", align: :center
    column :day_of_birth2, header: "Ngày sinh crush", align: :center
    column :updated_at, header: "Cập nhật", align: :center
    column :created_at, header: "Ngày tạo", align: :center

    actions do |toolbar, numerology, admin|
      toolbar.edit if admin && admin.actions.include?(:edit)
      toolbar.delete if admin && admin.actions.include?(:destroy)
      toolbar.link 'Tải demo', numerology, action: :download_demo_pdf, method: :get, style: :info, icon: "fa fa-cloud-download"
      toolbar.link 'Tải full', numerology, action: :download_full_pdf, method: :get, style: :info, icon: "fa fa-download"
      toolbar.link 'Gửi demo', numerology, action: :send_demo_tsh, method: :get, style: :primary, icon: " #{numerology.sent_demo == false ? "fa fa-square-o" : "fa fa-check" }"
      toolbar.link 'Gửi full', numerology, action: :send_full_tsh, method: :get, style: :primary, icon: " #{numerology.sent_full == false ? "fa fa-square-o" : "fa fa-check" }"
    end
    # column :address
    # actions
  end

  form do
    # Organize fields into tabs and sidebars
    tab :numerology do
      text_field :name, header: "Tên bạn"
      date_field :day_of_birth
      text_field :name2
      date_field :day_of_birth2
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
      numerology = Numerology.find_by_id(params["id"])
      numerology.update!(sent_demo: true)
      UserMailer.send_demo(email: numerology.email,
      name: numerology.name,
      id: numerology.id).deliver_later
      flash[:message] = "bạn đã gửi bài demo cho khách hàng thành công"
      redirect_to numerologies_admin_index_path
    end

    def send_full_tsh
      numerology = Numerology.find_by_id(params["id"])
      numerology.update!(sent_full: true)
      UserMailer.send_full(email: numerology.email,
      name: numerology.name,
      id: numerology.id).deliver_later
      flash[:message] = "bạn đã gửi bài full cho khách hàng thành công"
      redirect_to numerologies_admin_index_path
    end

    def download_demo_pdf
      numerology = Numerology.find_by_id(params["id"])
      numerology.attach_pdf_demo
      file = "#{Rails.root}/app/data/demo.pdf"
      send_file(file, disposition: 'attachment',type: "application/pdf")
    end

    def download_full_pdf
      numerology = Numerology.find_by_id(params["id"])
      numerology.attach_pdf_full
      file = "#{Rails.root}/app/data/full.pdf"
      send_file(file, disposition: 'attachment',type: "application/pdf")
    end
  end

  routes do
    get :send_demo_tsh, on: :member
    get :download_demo_pdf, on: :member
    get :download_full_pdf, on: :member
    get :send_full_tsh, on: :member
  end

  params do |params|
    params.require(:numerology).permit(:name, :day_of_birth, :email, :phone, :desire, :user_id, :name2, :day_of_birth2)
  end
end
