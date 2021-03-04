class PeopleController < ApplicationController
  layout "people"

  #全件全項目表示
  def index
    @msg = 'Person data.'
    @data = Person.all
  end

  #IDを指定して検索
  def show
    @msg = 'Indexed data.'
    @data = Person.find(params[:id])
  end

  #データ新規作成画面
  def add
    @msg = 'add new data.'
    @person = Person.new
  end

  #データ新規作成
  def create
    if request.post? then
      #Personモデルにデータを追加
      Person.create(person_params)
    end
    redirect_to '/people'
  end

  #'/edit'にアクセスした時の処理
  def edit
    #表示メッセージの設定
    @msg = "edit data.[id = " + params[:id] + "]"
    #表示するPersonデータを設定
    @person = Person.find(params[:id])
  end

  #データ更新
  def update
    #更新対象データの抽出
    obj = Person.find(params[:id])
    #データを更新
    obj.update(person_params)
    #トップページに戻る
    redirect_to '/people'
 end

 #データ削除
 def delete
    obj = Person.find(params[:id])
    obj.destroy
    redirect_to '/people'
 end

 #データ検索
 def find
    @msg = 'please type search word...'
    @people = Array.new
    if request.post? then
      f = params[:find].split(',')
      @people = Person.all.limit(f[0]).offset(f[1])
    else
      @people = Person.all
    end
 end

  private
  #パーミッション済のparamsを取得
  def person_params
    params.require(:person).permit(:name,:age,:mail)
  end

end
