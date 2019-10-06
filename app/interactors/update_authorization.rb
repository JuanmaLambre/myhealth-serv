class UpdateAuthorization < BaseInteractor

  def initialize(authorization_params:, current_user:)
    @authorization_params = authorization_params
    @current_user = current_user
  end

  def execute
    authorization = Authorization.find(@authorization_params[:id])
    update_params = @authorization_params[:authorization]
    if (update_params[:status].present? && Authorization.statuses[authorization.status] != update_params[:status])
      authorization.processed_time = Time.now
      authorization.authorizer = @current_user
    end
    authorization.save!
    authorization.update! update_params.permit(:comment, :status, :image)
    authorization
  end
end