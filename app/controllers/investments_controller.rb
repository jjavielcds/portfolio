# frozen_string_literal: true

class InvestmentsController < ApplicationController
  before_action :investment, only: %i[show edit]

  def index
    @investments = Investment.all
    render json: Investment.all.to_json
  end

  def show; end

  def new
    @investment = Investment.new
  end

  def edit; end

  def bulk_load; end

  def create_bulk_investments
    data = Roo::Spreadsheet.open(params.require(:investments)['investments_xlsx'])
    # ["Fecha", "Librador", "Moneda", "Monto", "Vencimiento", "Compra", "Margen neto", "TIR inversor"]
    data.each_with_index do |row, index|
      next if index.zero?

      investment_data = {
        start_date: row[0],
        name: row[1],
        coin: row[2].include?('UY') ? 'peso' : 'dolar',
        final_value: row[3],
        end_date: row[4],
        initial_value: row[3] - row[6],
        tir: row[7],
        kind: 'cheque',
        user: current_user
      }
      Investment.create(investment_data)
    end
    redirect_to investments_path, notice: 'Investments was successfully created.'
  end

  def create
    @investment = Investment.new(investment_params)

    if @investment.save
      redirect_to @investment, notice: 'Investment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if investment.update(investment_params)
      redirect_to investment, notice: 'Investment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    investment.destroy
    redirect_to investments_url, notice: 'Investment was successfully destroyed.'
  end

  private

  def investment
    @investment ||= Investment.find(params[:id])
  end

  def investment_params
    params.require(:investment).permit!.merge(extra_params)
  end

  def extra_params
    { user: current_user }
  end
end
