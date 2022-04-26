class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_before_action :authenticate_user!
  layout :layout_for_page



  def home
  end

  def public_toilets_survey
    send_file "#{Rails.root}/app/assets/documents/Survey+Report+Public+Toilets.docx", type: "application/docx", x_sendfile: true
  end

  def facts_figures
    send_file "#{Rails.root}/app/assets/documents/Winchelsea+Facts+&+Figures+(2)+(4).docx", type: "application/docx", x_sendfile: true
  end

  def gta_report
    send_file "#{Rails.root}/app/assets/documents/11138+-+Winchelsea+Traffic+Management+Plan+-+EM+8.12.21+(2).pdf", type: "application/pdf", x_sendfile: true
  end

  def gta_report_response
    send_file "#{Rails.root}/app/assets/documents/Traffic+Calming+Working+Group+Options+Study+response+271221+draft+.1.docx", type: "application/docx", x_sendfile: true
  end

  def wra_constitution
    send_file "#{Rails.root}/app/assets/documents/Winchelsea+RA+Constitution+(3)+(1).docx", type: "application/docx", x_sendfile: true
  end

  private

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end


