class PapersController < ApplicationController
  def new
  end

  def create
    @paper = Paper.new(paper_params)

    @paper.save
    redirect_to @paper
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end
