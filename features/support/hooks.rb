After do |scenario|
  on_error scenario if scenario.failed?
end