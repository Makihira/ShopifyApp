class SneakersController < ApplicationController
  layout 'sneakers'

  #全データの一覧表示を行うホーム画面
  def index
    @sneakers = Sneaker.all
  end

  #選択した項目の全内容を表示
  def show
    @sneaker = Sneaker.find(params[:id])
  end

  #データの追加
  def add
    @msg = '※登録する商品データを入力してください。'
    if request.post? then
      @sneaker = Sneaker.new sneaker_params
      if @sneaker.save then
        #ホーム画面へ戻る
        goback
      end
    else
      @sneaker = Sneaker.new
    end
  end

  #データの更新
  def edit
    @sneaker = Sneaker.find(params[:id])
    if request.patch? then
      @sneaker.update(sneaker_params)
      goback
    end
  end

  #データの削除
  def delete
    Sneaker.find(params[:id]).destroy
    goback
  end

  #Privateメソッド
  private
  #paramsのパーミッション処理
  def sneaker_params
    params.require(:sneaker).permit(:name,:maker,:color,:price,:memo)
  end

  #ホーム画面に戻る
  def goback
    redirect_to '/sneakers'
  end

end
