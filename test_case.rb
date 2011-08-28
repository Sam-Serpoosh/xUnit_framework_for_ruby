class TestCase

	attr_reader :test_method_name

	def initialize(test_method_name)
		@test_method_name = test_method_name
	end
	
	def run
		send(@test_method_name)
	end

end

class WasRun < TestCase

	attr_reader :was_run

	def test_method
		@was_run = 1
	end

end
