class UsersController < ApplicationController
  before_filter :require_latest_report

  def show
    @warnings          = @report.warnings.where(:email => current_user.emails)
    @brakeman_warnings = @warnings.select {|warning| warning.service == "brakeman" }
    @rbp_warnings      = @warnings.select {|warning| warning.service == "rails_best_practices" }
    @pendaxes_warnings = @warnings.select {|warning| warning.service == "pendaxes" }
  end
end
