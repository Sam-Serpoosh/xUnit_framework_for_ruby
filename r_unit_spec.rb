require 'test_case'

class TestCaseSpec < TestCase

	def test_template_method
		test = WasRun.new("test_method")
		test.run
		assert_equal("setup test_method tear_down", test.log)
	end

	def test_report_of_collected_result
		test = WasRun.new("test_method")
		result = test.run
		assert_equal("1 run, 0 failed", result.summary)
	end

	def test_failure_should_increase_number_of_failed_tests
		result = TestResult.new
		result.test_started
		result.test_failed
		assert_equal("1 run, 1 failed", result.summary)
	end

	def test_report_for_failed_tests
		test = WasRun.new("test_failing_method")
		result = test.run
		assert_equal("1 run, 1 failed", result.summary)
	end

	def test_tear_down_should_be_called_even_if_exception_occured
		test = WasRun.new("test_failing_method")
		result = test.run
		assert_equal("setup test_failing_method tear_down", test.log)
		assert_equal("1 run, 1 failed", result.summary)
	end

	def assert_equal(expected, actual)
		puts "expected #{expected} but was: #{actual}" if actual != expected
	end
	
	def assert_nil(value)
		puts "#{value} is not nil" if value != nil
	end

	def assert_true(value)
		puts "#{value} is not true" if value != true
	end

end

class AssertException < Exception
end
