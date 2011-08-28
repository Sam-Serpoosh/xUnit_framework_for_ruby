require 'test_case'

class TestCaseSpec < TestCase

	def setup
		@test = WasRun.new("test_method")
	end

	def test_running
		@test.run
		assert_equal(1, @test.was_run)
	end

	def test_setup
		@test.run
		assert_true(@test.was_setup)
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
