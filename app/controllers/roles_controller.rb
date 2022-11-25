class RolesController < InheritedResources::Base

  def update
    update!(:notice => "Great! Role has updated successfully.") { roles_url }
  end

  def create
    create!(:notice => "Great! Role has created successfully.") { roles_url }
  end

  private

    def role_params
      params.require(:role).permit(:title)
    end

end
