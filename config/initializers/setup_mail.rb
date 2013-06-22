ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    address:              "mail.altaviel.ru",
    port:                 "25",
    domain:               "altaviel.ru",
    user_name:            "noreply@altaviel.ru",
    password:             "",
    openssl_verify_mode:  'none',
    authentication:       :plain,
    enable_starttls_auto: true
}

ActionMailer::Base.sendmail_settings = {
:location       => '/usr/sbin/sendmail',
:arguments      => '-i -t'
}
