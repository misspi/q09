module AdminSurveysHelper
    YESNO = {:yes => 'Sí', :no => 'No'}

  def yesno
    YESNO
  end

  class SurveyView < BlockHelpers::Base



    def initialize(user, group)
      @survey = UserSurvey.find(group.to_s, user.id)
    end

    def label(name)
      "<label>pregunta - #{name} : #{@survey.qt(name)}</label>"
    end

    def text_field(name, options = {})
      value = @survey.answer(name).value
      value = value.blank? ? '(Sin contestar)' : value
      value = ERB::Util::h value
      lines = ""
      value.each {|l| lines = lines + l + '<br/>'}
      "<span class='answer'>#{lines}</span>"
    end
    
    def upload_file(name, options = {})
      puts "#{name}"
    end

    def radio_button(name, values, options = {})
      value = @survey.answer(name).value
      value = value.blank? ? '(Sin contestar)' : value
      value = values[value.to_sym] if values[value.to_sym]
      "<span class='answer'>#{value}</span>"
    end

    def check_box(name, options = {})
      value = @survey.answer(name).value
      value = value == '1' ? 'Si' : 'No'
      "<span class='answer'>#{value}</span>"
    end

    def text_area(name, options = {})
      text_field(name, options)
    end
  end


end
