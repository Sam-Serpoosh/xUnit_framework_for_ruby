require 'test_case'

class TestCaseSpec < TestCase

	def test_running
		test = WasRun.new("test_method")
		assert_nil(test.was_run)
		test.run
		assert_equal(1, test.was_run)
	end
	
	def assert_equal(expected, actual)
		raise AssertException, "expected #{expected} but was: #{actual}" if actual != expected
	end
	
	def assert_nil(value)
		raise AssertException, "#{value} is not nil" if value != nil
	end

end

class AssertException < Exception
end
