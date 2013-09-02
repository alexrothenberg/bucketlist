class Api::TodosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # GET /todos
  def index
    @todos = Todo.by_rating
    render json: @todos
  end

  # # GET /todos/1
  def show
    render json: todo
  end

  # POST /todos
  def create
    todo_params = params.permit(:title, :rating, :endorsed)
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo
    else
      render json: todo, status: 500
    end
  end

  # # PATCH/PUT /todos/1
  def update
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo, status: 500
    end
  end

  # # DELETE /todos/1
  # def destroy
  #   @todo.destroy
  #   redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  # end

  private
    def todo
      @todo ||= Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :rating, :endorsed)
    end

  def default_serializer_options
    { root: false }
  end

end
