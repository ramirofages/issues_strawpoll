class User::SourcesController < ApplicationController

  load_and_authorize_resource :project, :through => :current_user
  before_action :authorize_source_creation, only: [:new, :create]
  before_action :authorize_source_actions, except: [:new, :create]

  def show
  end

	def new
  	@project.project_source = create_source
	end

  def edit
  end

	def create
    source = build_source
    source.project = @project 

    respond_to do |format|
      if source.save
        format.html { redirect_to polymorphic_path([:user, @project, @project.project_source]), notice: 'Source was successfully created.' }
      else

        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @project.project_source.update(source_params)
        format.html { redirect_to polymorphic_path([:user, @project, @project.project_source]), notice: 'Source was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  protected 


    def source_params
      raise "no definiste el source params"
    end

    def create_source
      controller_name.classify.constantize.new
    end

    def build_source
      controller_name.classify.constantize.new source_params
    end

  private 



    def authorize_source_actions
      action = controller_name.classify.constantize.model_name.param_key + "_actions"
      action = action.to_sym # :mocked_source_actions, :github_source_actions, etc
      authorize! action, @project
    end 

    def authorize_source_creation
      authorize! :create_source, @project
    end


end
