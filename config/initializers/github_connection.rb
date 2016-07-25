Octokit.configure do |c|
	c.connection_options[:ssl] = { :verify => false }
end