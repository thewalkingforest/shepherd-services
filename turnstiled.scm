(register-services (list
  (service
    '(turstiled)
    #:start (make-forkexec-constructor
              '("turstiled"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
