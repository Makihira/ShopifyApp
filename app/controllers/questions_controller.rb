class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]
  layout 'Q&A'

  def index
    @questions = Question.all.order created_at: :desc
  end

  def show
    @answer = Answer.new
    @answer.question_id = params[:id]
  end

  def new
    @question = Question.new
  end

  def edit
    # トップページに移動
    redirect_to '/questions'
  end

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

  def update
    # トップページに移動
    redirect_to '/questions'
  end

  def destroy
    # トップページに移動
    redirect_to '/questions'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :name, :finished)
    end
end
