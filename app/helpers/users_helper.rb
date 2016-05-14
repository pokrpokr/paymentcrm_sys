module UsersHelper
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  REAL_NAME_REGEX = /\A([a-zA-z]+)|([a-zA-z]+\s+)\z/
  USER_TYPE_REGEX = /\A[123]\z/
  PHONE_REGEX = /(\d{0,9})|(\d{13})/
  def search_user
    if params[:search].present? && params[:commit] == "搜索"
      if params[:search] == "管理员"
        params[:search] = "3"
      elsif params[:search] == "用户"
        params[:search] = "1"
      elsif params[:search] == "商户"
        params[:search] = "2"
      end

      if params[:search] =~ EMAIL_REGEX
        user = User.where(:email => params[:search])
      elsif params[:search] =~ REAL_NAME_REGEX
        user = User.where(:real_name => params[:search])
      elsif params[:search] =~ USER_TYPE_REGEX
        user = User.where(:user_type => params[:search])
      elsif params[:search] =~ PHONE_REGEX
        user = User.where(:phone => params[:search])
      end
      @users = user.paginate(page: params[:page]).per_page(10)
    elsif params[:search].nil? && params[:commit] == "搜索"
      @users = {}
    elsif params[:search].nil? && params[:commit].nil?
      @users = User.paginate(page: params[:page]).per_page(10)
    end
  end

end
