require 'random_word_generator'
class WelcomeController < ApplicationController
  def index
    @username = RandomWordGenerator.word
    @weapon   = "java"
  end
end
