class FeedbacksController < ApplicationController
	def new
		@feedback = Feedback.new
	end

	def create
		feedback = Feedback.new(local_resource_id: params[:local_resource_id], user_id: params[:user_id], receiving_support: params[:receiving_support], contacted_local_resources: params[:contacted_local_resources])
		if feedback.save
			flash[:alert] = "Feedback submitted"
			redirect_to resources_path
		end
	end
end
