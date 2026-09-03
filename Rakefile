require "rspec/core/rake_task"
require "simplecov"
require "simplecov-console"

task(:format) { sh "rubocop -A" }

task(:typecheck) { sh "steep check" }

task(:test) {
  FileUtils.rmtree("coverage")
  sh "COVERAGE=true rspec --format=documentation"
}

task(:check_coverage) {
  SimpleCov.collate(Dir["coverage/.resultset.json"]) {
    enable_coverage :branch
    minimum_coverage line: 100, branch: 100
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::Console,
    ])
  }
}

task default: [:format, :typecheck, :test, :check_coverage]
