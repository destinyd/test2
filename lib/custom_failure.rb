class CustomFailure < Devise::FailureApp
    def http_auth_body
      return i18n_message unless request_format
      method = "to_#{request_format}"
      if method == "to_xml"
        { :error => i18n_message }.to_xml(:root => "errors")
      elsif method == "to_js"
        self.status = 200
        "alert('#{i18n_message}')"
      elsif {}.respond_to?(method)
        { :error => i18n_message }.send(method)
      else
        i18n_message
      end
    end
end

