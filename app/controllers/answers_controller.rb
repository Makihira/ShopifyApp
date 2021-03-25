class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  layout 'Q&A'

  def new
    @answer = Answer.new
  end

  # 送信されたフォームの内容をAnswerに保存
  def create
    end_counter = 10  # 終了にする回答数
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        num = Answer.where('question_id = ?', @answer.question_id).count
        # 回答数が10以上の場合、ステータスを「終了」に更新
        if num >= end_counter then
          q = Question.find @answer.question_id
          q.finished = true
          q.save
        end
        format.html { redirect_to '/questions/' + @answer.question_id.to_s }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # 未使用のアクション（トップページに移動）
  def index
    redirect_to '/questions'
  end

  # 未使用のアクション（トップページに移動）
  def show
    redirect_to '/questions'
  end

  # 未使用のアクション（トップページに移動）
  def edit
    redirect_to '/questions'
  end
  
  # 未使用のアクション（トップページに移動）
  def update
    redirect_to '/questions'
  end

  # 未使用のアクション（トップページに移動）
  def destroy
    redirect_to '/questions'
  end

  private
    # 指定されたIDの回答を取得
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # params(answer)の項目チェック
    def answer_params
      params.require(:answer).permit(:question_id, :content, :name)
    end
end
