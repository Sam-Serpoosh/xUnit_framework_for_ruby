require 'test_case'

class TestCaseSpec < TestCase

	def test_template_method
		test = WasRun.new("test_method")
		test.run
		assert_equal("setup test_method tear_down", test.log)
	end
	
	def assert_equal(expected, actual)
		raise AssertException, "expected #{expected} but was: #{actual}" if actual != expected
	end
	
	def assert_nil(value)
		raise AssertException, "#{value} is not nil" if value != nil
	end

	def assert_true(value)
		raise AssertException, "#{value} is not true" if value != true
	end

end

class AssertException < Exception
end
