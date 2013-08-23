class Api::TodosController < ApplicationController
  # GET /todos
  def index
    @todos = Todo.all
    render json: @todos
  end

  # # GET /todos/1
  def show
    render json: todo
  end

  # # POST /todos
  # def create
  #   @todo = Todo.new(todo_params)

  #   if @todo.save
  #     redirect_to @todo, notice: 'Todo was successfully created.'
  #   else
  #     render action: 'new'
  #   end
  # end

  # # PATCH/PUT /todos/1
  # def update
  #   if @todo.update(todo_params)
  #     redirect_to @todo, notice: 'Todo was successfully updated.'
  #   else
  #     render action: 'edit'
  #   end
  # end

  # # DELETE /todos/1
  # def destroy
  #   @todo.destroy
  #   redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  # end

  private
    def todo
      @todo ||= Todo.find(params[:id])
    end

  #   # Only allow a trusted parameter "white list" through.
  #   def todo_params
  #     params.require(:todo).permit(:title)
  #   end

  def default_serializer_options
    { root: false }
  end

end
