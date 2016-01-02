# This function takes a user's solution as a string,
# generates Checker.java with the solution in it,
# compiles it, and runs
# The return value is either 
# 'Did not compile'
# 'Wrong answer'
# 'Correct answer!'
def run_checker user_solution

  # Remove Checker.java
  system 'rm -f Checker.java'

  # Generates Checker.java
  system 'cp CheckerTemplate Checker.java'
  if !$?.success?
    raise 'Error while copying CheckerTemplate to Checker.java.'
  end

  # Replace $s in Checker.java to user_solution
  system( "sed -i 's/$s/" + user_solution + "/g' Checker.java")
  if !$?.success?
    raise "Error while inserting user's solution into Checker.java"
  end

  # Compiling...
  system 'javac Checker.java'
  if !$?.success?
    return 'Did not compile'
  end

  # Runs it
  input           = 'aBCdEfg'
  expected_output = 'abcdefg'
  system ('java Checker ' + input + ' ' + expected_output)
  if !$?.success?
    return 'Wrong output'
  end

  return 'Correct answer!'
end

# The following is for testing purpuse
result = run_checker 'String myfunc(String s) { return s.toLowerCase(); }'

puts '#####################'
puts 'result was...'
puts result
puts 'reaching end...'
