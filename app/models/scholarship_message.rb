class ScholarshipMessage < MailForm::Base
  attribute :name,          :validate => true
  attribute :email,         :validate => true
  attribute :message_title, :validate => true
  attribute :message_body,  :validate => true

  def headers
    {
      :subject => "#{message_title}",
      :to => "devocracyorg@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end

end
