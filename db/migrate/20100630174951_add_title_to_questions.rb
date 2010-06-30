class AddTitleToQuestions < ActiveRecord::Migration
  def self.up
    # presentación
    Question.apply_title(:presentacion, :name, 'Nombre / colectivo')
    Question.apply_title(:presentacion, :page_url, 'Web / blog')
    Question.apply_title(:presentacion, :icon, 'Imagen / logo / gráfica con la que quieres aparecer')
    Question.apply_title(:presentacion, :location, 'Vives / trabajas en')
    Question.apply_title(:presentacion, :indi_colective, '¿Trabajas solx o en colectivo?')
    Question.apply_title(:presentacion, :interest, '¿Qué es lo que más te interesa en estos momentos y por qué?')

  end

  def self.down
  end
end
