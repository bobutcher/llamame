class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.create(company_params)
    redirect_to company_path(id: @company.id)
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to company_path(id: @company.id)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy!
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:notes, :salesperson)
  end
end
