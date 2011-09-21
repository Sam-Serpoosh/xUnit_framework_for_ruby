require 'test_suite'

class TestRunner

	def initialize(test_case_name)
			@test_case_name = test_case_name
	end

	def run_tests(test_result)
			suite = TestSuite.new
			test_methods_names = get_test_methods_names
			test_methods_names.each do |method_name|
					suite.add(Object::const_get(@test_case_name).new(method_name))
			end
			suite.run(test_result)
	end

	def get_test_methods_names
			test_case = Object::const_get(@test_case_name).new("")
			all_methods_names = test_case.methods
			test_methods_names = []
			all_methods_names.each do |method_name|
				if method_name.match(/^test/)
					test_methods_names << method_name
				end
			end
			test_methods_names
	end

end
