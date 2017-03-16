class TodoController < ApplicationController

  def index
    if session[:state] == 'true'
     @todos = Todo.where(completed: false).order(date: :asc)
   else
     @todos = Todo.all.order(date: :asc)
   end
  end


  def create
  end

  def submit
      Todo.create(title: params[:title], date: params[:date], completed: params[:completed])
    redirect_to '/todo/index'
  end

  def hide
  end

  def update
    Todo.find(params[:id]).update(completed: params[:completed])
    redirect_to '/todo/index'
  end

  def toggle_hidden
    if params[:toggle] == 'true'
      session[:state]='true'
      redirect_to '/todo/index'
    else
      puts 'line 41 works'
      session[:state]='false'
      redirect_to '/todo/index'
    end
  end
end
