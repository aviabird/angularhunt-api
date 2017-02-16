module Api::V0
  class Api::V0::ProjectsController < ApiController
    before_action :authenticate_user!, only: [:upvote]
    before_action :set_project, only: [:upvote]
    include CommonConcern

    def all_projects
      projects = Project.all
      render_success(projects)
    end

    # POST /projects/upvote
    def upvote
      @project.toggle_like(current_user)
      render json: @project
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end
  end
end
