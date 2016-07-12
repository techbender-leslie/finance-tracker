class StocksController < ApplicationController

	def search
		if params[:stock]
			@stock = Stock.find_by_ticker(params[:stock]) #if it exists
			@stock ||= Stock.new_from_lookup(params[:stock]) #if it is new
		end

		if @stock
			#render json: @stock
			render partial: 'lookup'
		else
			render status: :not_found, nothing: true
		end
	end
end
