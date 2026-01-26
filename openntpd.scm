(define openntpd
  (service
    '(openntpd ntpd)
    #:requirement '(dns)
    #:start (make-forkexec-constructor
              '("openntpd" "-d"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list openntpd))
