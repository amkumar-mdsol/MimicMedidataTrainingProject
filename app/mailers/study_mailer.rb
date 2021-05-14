class StudyMailer < ApplicationMailer

    def success_email
        @study = params[:study]
        mail(to: 'pmundhe@mdsol.com', subject: 'Study created successfully')
    end
end
