class GroupsController < ActionController::Base

  def index
    @users = User.all
    @user = current_user
    @all_groups = Group.all
    @groups = []
    @all_groups.each do |grp|
      if grp.user_id == @user.id
        @groups << grp
      end
      @groups
    end
      @groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group Added!"
      redirect_to groups_path
    else
      flash[:errors] = @group.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:success] = "Group Updated!"
      redirect_to @group
    else
      flash[:errors] = @group.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      flash[:success] = "Group Deleted!"
      redirect_to groups_path
    else
      flash[:errors] = @group.errors.full_messages.join(". ")
      redirect_to @group
    end
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :description).merge(user_id: current_user.id)
  end
end
