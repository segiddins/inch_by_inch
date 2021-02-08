require 'rake'
require 'rake/tasklib'

require 'inch_by_inch/progress_enumerable'

module InchByInch
  class RakeTask < Rake::TaskLib
    attr_accessor :failing_grades
    attr_accessor :codebase_dir

    # Initializes a rake task
    #
    # @param [#to_s] task_name
    #        the name of the rake task.
    #
    def initialize(task_name = :inch)
      @failing_grades = %I(B C)
      @codebase_dir = Dir.pwd

      yield self if block_given?

      install_task(task_name)
    end

    private

    def install_task(task_name)
      desc 'Lint the completeness of the documentation with Inch' unless ::Rake.application.last_description
      task(task_name) do
        require 'inch'
        require 'inch/cli'
        verify_docs!
      end
    end

    def verify_docs!
      install_ui_hooks

      puts 'Parsing docs…'

      codebase = Inch::Codebase.parse(codebase_dir, Inch::Config.codebase)
      context = Inch::API::List.new(codebase, {})

      failing_grade_symbols = failing_grades.map(&:to_sym)
      failing_grade_list = context.grade_lists.select { |g| failing_grade_symbols.include?(g.to_sym) }
      Inch::CLI::Command::Output::List.new(options, context.objects, failing_grade_list) # just initializing will run the command
      puts
      if context.objects.any? { |o| failing_grade_symbols.include?(o.grade.to_sym) }
        puts red('✗ Lint of Documentation failed: Please improve above suggestions.')
        exit 1
      else
        puts green('✓ Nothing to improve detected.')
      end
    end

    def install_ui_hooks
      YARD::Parser::SourceParser.before_parse_file do |_|
        print green('.') # Visualize progress
      end

      Inch::Codebase::Objects.class_eval do
        alias_method :old_init, :initialize
        def initialize(language, objects)
          puts "\n\nEvaluating…"
          old_init(language, ProgressEnumerable.new(objects))
        end
      end
    end

    def options
      @options ||= Inch::CLI::Command::Options::List.new.tap do |options|
        options.show_all = true
        options.ui = Inch::Utils::UI.new
      end
    end

    def green(string)
      "\033[0;32m#{string}\e[0m"
    end

    def red(string)
      "\033[0;31m#{string}\e[0m"
    end
  end
end
