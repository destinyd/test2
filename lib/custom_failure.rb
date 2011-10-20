class CustomFailure < Devise::FailureApp
    def respond
      if http_auth?
        http_auth
      elsif warden_options[:recall]
        recall
      else
        redirect
      end
    end
end

