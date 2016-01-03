require 'random_word_generator'
class WelcomeController < ApplicationController
  def index
    @rand_word = RandomWordGenerator.word
  end
end
