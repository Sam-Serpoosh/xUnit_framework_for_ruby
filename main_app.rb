require 'r_unit_spec'

main_result = TestResult.new

TestCaseSpec.new("test_template_method").run(main_result)
TestCaseSpec.new("test_report_of_collected_result").run(main_result)
TestCaseSpec.new("test_failure_should_increase_number_of_failed_tests").run(main_result)
TestCaseSpec.new("test_report_for_failed_tests").run(main_result)
TestCaseSpec.new("test_tear_down_should_be_called_even_if_exception_occured").run(main_result)
TestCaseSpec.new("test_running_suite_of_tests").run(main_result)

puts main_result.summary
