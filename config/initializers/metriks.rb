require "metriks/reporter/librato_metrics"
reporter = Metriks::Reporter::LibratoMetrics.new('doug@dougstewart.org', '9e19d956bc0cdca764c7e7689549663399741f18b51baa55882a4b71d73aac8c')
reporter.start

at_exit do
  reporter.stop
  reporter.write # write any pending metrics
end