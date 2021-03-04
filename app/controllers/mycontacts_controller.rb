class MycontactsController < ApplicationController
  before_action :set_mycontact, only: %i[ show edit update destroy ]

  # トップページの表示
  def index
    # 全データを取得
    @mycontacts = Mycontact.all
  end

  # 「Show」リンク押下時処理
  def show
  end

  # 新規登録
  def new
    # Mycontactモデルのインスタンスを生成
    @mycontact = Mycontact.new
  end

  # 「Edit」リンク押下時処理
  def edit
  end

  # 新規登録時のPOST処理
  def create
    @mycontact = Mycontact.new(mycontact_params)

    #クライアントのフォーマットごとに処理を設定
    respond_to do |format|
      if @mycontact.save
        format.html { redirect_to @mycontact, notice: "Mycontact was successfully created." }
        format.json { render :show, status: :created, location: @mycontact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # 更新時のPOST処理
  def update
    #クライアントのフォーマットごとに処理を設定
    respond_to do |format|
      if @mycontact.update(mycontact_params)
        format.html { redirect_to @mycontact, notice: "Mycontact was successfully updated." }
        format.json { render :show, status: :ok, location: @mycontact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mycontact.errors, status: :unprocessable_entity }
      end
    end
  end

  # 「Destroy」リンク押下時処理
  def destroy
    @mycontact.destroy
    respond_to do |format|
      format.html { redirect_to mycontacts_url, notice: "Mycontact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # アクションメソッドの前に実行する処理
    def set_mycontact
      #渡されたIDのデータを検索
      @mycontact = Mycontact.find(params[:id])
    end

    # 送信データにパーミッションを設定
    def mycontact_params
      params.require(:mycontact).permit(:name, :age, :nationality, :mail)
    end
end
