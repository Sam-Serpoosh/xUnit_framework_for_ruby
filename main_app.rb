require './r_unit_spec'

#normal way of testing methods before TesRunner exists
main_result = TestResult.new
TestCaseSpec.new("test_normal_flow_of_test_method").run(main_result)
TestCaseSpec.new("test_report_of_collected_result").run(main_result)
TestCaseSpec.new("test_failure_should_increase_number_of_failed_tests").run(main_result)
TestCaseSpec.new("test_report_for_failed_tests").run(main_result)
TestCaseSpec.new("test_tear_down_should_be_called_even_if_exception_occured").run(main_result)
TestCaseSpec.new("test_running_suite_of_tests").run(main_result)
TestCaseSpec.new("test_collecting_test_methods_of_a_test_class").run(main_result)
TestCaseSpec.new("test_running_all_test_methods_of_a_class_and_report_result").run(main_result)
puts main_result.summary

#after existance of TestRunner but I kept the both ways
runner_result = TestResult.new
TestRunner.new("TestCaseSpec").run_tests(runner_result)
puts runner_result.summary
