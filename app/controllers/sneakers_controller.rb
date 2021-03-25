class SneakersController < ApplicationController
  layout 'sneakers'

  # 全商品の一覧表示を行うホーム画面
  def index
    # 全商品情報を取得
    @sneakers = Sneaker.all
  end

  # 選択した商品の内容を表示
  def show
    # 指定されたIDの商品情報を取得
    @sneaker = Sneaker.find(params[:id])
  end

  # 商品情報の追加
  def add
    @msg = '※登録する商品データを入力してください。'
    if request.post? then
      # データを登録
      @sneaker = Sneaker.new sneaker_params
      if @sneaker.save then
        #ホーム画面へ戻る
        goback
      end
    else
      @sneaker = Sneaker.new
    end
  end

  # 商品情報の更新
  def edit
    # 指定されたIDの商品情報を取得
    @sneaker = Sneaker.find(params[:id])
    if request.patch? then
      # データを更新
      @sneaker.update(sneaker_params)
      goback
    end
  end

  # 商品情報の削除
  def delete
    # 指定されたIDのデータを削除
    Sneaker.find(params[:id]).destroy
    goback
  end

  # Privateメソッド
  private
  # params（sneaker）の項目チェック
  def sneaker_params
    params.require(:sneaker).permit(:name,:maker,:color,:price,:memo)
  end

  # ホーム画面に戻る
  def goback
    redirect_to '/sneakers'
  end

end
