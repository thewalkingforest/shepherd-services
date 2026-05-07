(register-services (list
  (service
    '(openntpd)
    #:requirement '(dns)
    #:start (make-forkexec-constructor
              '("openntpd" "-d"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
