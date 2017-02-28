class Api::V1::TasksController < Api::V1::BaseController

	def index
		respond_with Task.all
	end

	def create
		respond_with :api, :v1, Task.create(item_params)
	end

	def destroy
		respond_with Task.destroy(params[:id])
	end

	def update
		item = Task.find(params[:id])
		item.update_attributes(item_params)
		respond_with item, json: item 
	end

	private

	def item_params
		params.require(:task).permit(:id, :description, :urgent)
	end


end

