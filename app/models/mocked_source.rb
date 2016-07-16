class MockedSource < ActiveRecord::Base
	has_one :project, as: :project_source

end
