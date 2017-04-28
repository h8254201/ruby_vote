class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  # 新增一個User的物件，放入實體user給view用
  def new
    @user = User.new
  end

  # GET /users/1/edit
  # 編輯
  def edit
  end

  # POST /users
  # POST /users.json

  # 傳過來的資料會被new在user_params裡，
  # 呼叫 save 方法準備存檔。如果存檔成功，便轉往候選人列表頁（redirect_to），
  # 並帶有一提示訊息"User was successfully created."；如果失敗，則重新 render 新增頁面，並顯示錯誤訊息。
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  # 把清洗過的檔案更新，若編輯存檔成功，將會到user頁面然後顯示'User was successfully updated.'，若失敗則重新回到編輯頁面。
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  
  # 清洗工作-只允許user的三個參數(name, email, password)通過，其他不能
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
