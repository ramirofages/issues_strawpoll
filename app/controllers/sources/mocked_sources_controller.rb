class Sources::MockedSourcesController < SourcesController

	protected

		def create_source
      MockedSource.new
    end

    def build_source
	    MockedSource.new(source_params)
    end

    def source_params
      params.require(:mocked_source).permit(:url)
    end

end