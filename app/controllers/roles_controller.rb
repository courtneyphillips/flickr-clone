class RolesController <ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @roles = Role.all
  end

  def show
    if @role.users.length == 0
      @associated_users = "None"
    else
      @associated_users = @role.users.map(&:name).join(", ")
    end
  end

  def new
  end

  def edit
  end

  def create
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end
