
require 'yaml'


class Translater
  def initialize
    @translate = YAML.load_file("#{File.dirname(__FILE__)}/config/locales/es.cuestionario.yml")['es']['cuestionario']
    #    ['presentacion', 'tumisma', 'experiencias', 'dineros', 'autoria', 'habitat', 'red', 'comun'].each do |group|
    transa
  end

  def transa
    Question.all.each do |question|
      value = @translate[question.group][question.name]
      puts "[#{question.group}] #{question.name} => #{value}" unless value
    end
  end


end

Translater.new