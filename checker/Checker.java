/* 
  Checker class
  myfunc should be replaced with a user's solution
  This should be called as "java Checker <input> <expected output>"
  The main function exits with an exit code 0 if the solution is correct.
  Otherwise, it terminates with an exit code 1.
*/
import java.util.*;

class Checker {
  public static void main(String[] args) throws Exception {
    if (args.length != 2) {
      throw new Exception("Wrong number of command line arguments.");
    }
    String input          = args[0];
    String userOutput     = myfunc(input);
    String expectedOutput = args[1];
    if (userOutput == null || !userOutput.equals(expectedOutput)) {
      throw new Exception("Expected output: " + expectedOutput + " Actual output: " + userOutput);
    }
    return; // reaching here means the solution is correct
  }

  /*
    This is where user's solution will be.
  */ 
  static String myfunc(String input){
  return input.toLowerCase();
}

}
