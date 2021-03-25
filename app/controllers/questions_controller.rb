class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  layout 'Q&A'

  # 質問の一覧表示（トップページ）
  def index
    # 全質問を取得（投稿日時の降順）
    @questions = Question.all.order created_at: :desc
  end

  # 質問と回答の表示
  def show
    @answer = Answer.new
    @answer.question_id = params[:id]
  end

  # 新しい質問の投稿
  def new
    @question = Question.new
  end

  # 送信されたフォームの内容をQuestionに保存
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to '/questions' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new } 
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
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
    def set_question
      @question = Question.find(params[:id])
    end

    # params(question)の項目チェック
    def question_params
      params.require(:question).permit(:title, :content, :name, :finished)
    end
end
