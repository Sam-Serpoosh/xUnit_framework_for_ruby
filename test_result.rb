class TestResult

		attr :run_tests, :failed_tests

		def initialize
				@run_tests = 0
				@failed_tests = 0
		end

		def test_started
				@run_tests += 1
		end

		def test_failed
				@failed_tests += 1
		end

		def summary
				"#{@run_tests} run, #{@failed_tests} failed"
		end

end
