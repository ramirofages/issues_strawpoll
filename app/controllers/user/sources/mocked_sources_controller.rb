class User::Sources::MockedSourcesController < SourcesController
  

	protected


    def source_params
      params.require(:mocked_source).permit(:url)
    end



end
