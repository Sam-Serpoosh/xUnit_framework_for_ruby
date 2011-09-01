require 'test_result'

class TestCase

	attr_reader :test_method_name

	def setup
	end

	def initialize(test_method_name)
		@test_method_name = test_method_name
	end
	
	def run(result)
		result.test_started
		begin
			setup	
			send(@test_method_name)
		rescue Exception 
			result.test_failed
		end
		tear_down
	end

	def tear_down
	end

end

class WasRun < TestCase

	attr_reader :was_run, :log
	
	def setup
		@log = "setup"
	end

	def test_method
		@log += " test_method"
	end

	def test_failing_method
		@log += " test_failing_method"
		raise Exception, "this is test_failing_method"
	end

	def tear_down
		@log += " tear_down"
	end

end
