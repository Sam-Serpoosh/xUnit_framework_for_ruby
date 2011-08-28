class TestCase

	attr_reader :test_method_name

	def setup
	end

	def initialize(test_method_name)
		@test_method_name = test_method_name
	end
	
	def run
		setup	
		send(@test_method_name)
	end

end

class WasRun < TestCase

	attr_reader :was_run, :was_setup
	
	def setup
		@was_run = nil
		@was_setup = true
	end

	def test_method
		@was_run = 1
	end

end
