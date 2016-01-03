class Problem < ActiveRecord::Base
  # returns a random id
  def self.random_id
    return self.ids.sample
  end

  def self.test(id, user_solution)
    current_problem = self.find id

    checker_dir = "#{Dir.pwd}/checker"
    if current_problem.func_type == "int"
      file_name = "#{checker_dir}/CheckerInt.java"
      template_name = "CheckerIntTemplate"
    else
      file_name = "#{checker_dir}/CheckerString.java"
      template_name = "CheckerStringTemplate"
    end


    # Generates Checker.java
    system "cp #{checker_dir}/#{template_name} #{file_name}"
    if !$?.success?
      raise 'Error while copying CheckerTemplate to /tmp/Checker.java.'
    end

    # Replace $s in Checker.java to user_solution
    text = File.read(file_name)
    new_contents = text.gsub("$s", user_solution)

    File.open(file_name, "w") {|file| file.puts new_contents }

    # Compiling...
    system "javac #{file_name}"
    if !$?.success?
      return 'Did not compile'
    end

    # Runs it
    input           = current_problem.input
    expected_output = current_problem.output
    if current_problem.func_type == "int"
      system ("java -cp #{checker_dir} CheckerInt " + input + ' ' + expected_output)
    else
      system ("java -cp #{checker_dir} CheckerString " + input + ' ' + expected_output)
    end
    if !$?.success?
      return 'Wrong output'
    end
    return 'Correct answer!'
  end
end
