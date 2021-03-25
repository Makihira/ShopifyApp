class MsgboardController < ApplicationController
  layout 'msgboard'

  # コンストラクタ
  def initialize
    super
    # テキストファイルの読み込み
    begin
      @msg_data = JSON.parse(File.read("data.txt"))
    rescue
      @msg_data = Hash.new
    end
    # 24時間経過したデータを削除
    @msg_data.each do |key,obj|
      if Time.now.to_i - key.to_i > 24*60*60 then
        @msg_data.delete(key)
      end
    end
    # テキストファイルを保存
    File.write("data.txt", @msg_data.to_json)
  end

  # 画面表示処理
  def index
    if request.post? then
      # POST送信された場合
      obj = MyData.new(msg:params['msg'], name:params['name'], mail:params['mail'])
      @msg_data[Time.now.to_i] = obj
      # JSON型式で取り出す
      data = @msg_data.to_json
      # テキストファイルに保存
      File.write("data.txt", data)
      # JSON型式のデータからRubyオブジェクトを生成
      @msg_data = JSON.parse(data)
    end
  end

end

# データ保管用クラス
class MyData
  # インスタンス変数
  attr_accessor :name
  attr_accessor :mail
  attr_accessor :msg

  # コンストラクタ
  def initialize name:name1, mail:mail1, msg:msg1
    self.name = name
    self.mail = mail
    self.msg = msg
  end

end