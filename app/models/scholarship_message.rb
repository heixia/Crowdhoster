class ScholarshipMessage < MailForm::Base
  attribute :name          
  attribute :title
  attribute :program
  attribute :email
  attribute :message_body


  def headers
    {
      :subject => "Funding A Scholarship",
      :to => "devocracyorg@gmail.com",
      :from => "A potential funder"
    }
  end

end
