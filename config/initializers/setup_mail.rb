config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
        address:          "smtp.gmail.com", 
        port:             "587", 
        authentication:   "plain",
        domain:           "altaviel.ru", 
        user_name:        "kalinon7@gmail.com",
        password:         "Djkit,cndj",
        enable_starttls_auto: true
}