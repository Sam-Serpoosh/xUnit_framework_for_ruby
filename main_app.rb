require 'r_unit_spec'

TestCaseSpec.new("test_template_method").run
TestCaseSpec.new("test_report_of_collected_result").run
TestCaseSpec.new("test_failure_should_increase_number_of_failed_tests").run
TestCaseSpec.new("test_report_for_failed_tests").run
TestCaseSpec.new("test_tear_down_should_be_called_even_if_exception_occured").run
