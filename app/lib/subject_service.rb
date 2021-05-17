module SubjectService
  class << self
    def send_subject(subject)
      return unless subject

      response = Faraday.post(ENV['SUBJECT_SERVICE_URL']) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = { subject: subject }.to_json
      end
      response.status == 201
    end
  end
end