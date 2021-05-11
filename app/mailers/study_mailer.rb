class StudyMailer < ApplicationMailer

    def success_email
        binding.pry
        @study = params[:study]
        mail(to: 'pmundhe@mdsol.com', subject: 'Study created successfully')
    end
end
