require './test_case'
require './test_suite'
require './test_result'
require './test_runner'

class TestCaseSpec < TestCase

		def setup
				@result = TestResult.new
		end

		def test_normal_flow_of_test_method
				test = WasRun.new("test_method")
				test.run(@result)
				assert_equal("setup test_method tear_down", test.log)
		end

		def test_report_of_collected_result
				test = WasRun.new("test_method")
				test.run(@result)
				assert_equal("1 run, 0 failed", @result.summary)
		end

		def test_failure_should_increase_number_of_failed_tests
				@result.test_started
				@result.test_failed
				assert_equal("1 run, 1 failed", @result.summary)
		end

		def test_report_for_failed_tests
				test = WasRun.new("test_failing_method")
				test.run(@result)
				assert_equal("1 run, 1 failed", @result.summary)
		end

		def test_tear_down_should_be_called_even_if_exception_occured
				test = WasRun.new("test_failing_method")
				test.run(@result)
				assert_equal("setup test_failing_method tear_down", test.log)
		end

		def test_running_suite_of_tests
				suite = TestSuite.new
				suite.add(WasRun.new("test_method"))
				suite.add(WasRun.new("test_failing_method"))
				suite.run(@result)
				assert_equal("2 run, 1 failed", @result.summary)
		end

		def test_collecting_test_methods_of_a_test_class
				runner = TestRunner.new("TestClassForTestRunner")
				test_methods_names = runner.get_test_methods_names
				assert_equal(2, test_methods_names.length)
				assert_true(contains?(test_methods_names, "test_first"))
				assert_true(contains?(test_methods_names, "test_second"))
		end

		def test_running_all_test_methods_of_a_class_and_report_result
				runner = TestRunner.new("TestClassForTestRunner")
				runner.run_tests(@result)
				assert_equal("2 run, 1 failed", @result.summary)
		end

		private

		def assert_equal(expected, actual)
				raise Exception, "expected #{expected} but was: #{actual}" if actual != expected
		end

		def assert_nil(value)
				raise Exception, "#{value} is not nil" if value != nil
		end

		def assert_true(value)
				raise Exception, "#{value} is not true" if !value.eql?(true)
		end

		def contains?(collection, item)
				collection.each do |element|
						if element.to_s.eql?(item)
								return true
						end
				end
				false
		end 

end

class AssertException < Exception
end

class TestClassForTestRunner < TestCase

		def test_first
				raise Exception
		end

		def test_second
		end

		def third
		end

end
