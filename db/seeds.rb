# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Problem.create(output: "hello!", desc: "return a given string with ! appended at the end", input:"hello", func_type: "String", signature: "String myfunc(String s) { return null; }")
Problem.create(output: "3", desc: "Return the given input + 1", input: "2", func_type: "int", signature: "int myfunc(int x) { return x + 1; }")
