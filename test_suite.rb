require './test_result'

class TestSuite

	def initialize
		@tests = []
	end

	def add(test_case)
		@tests << test_case
	end

	def run(result)
		@tests.each do |test_case|
			test_case.run(result)
		end
		result
	end

end
