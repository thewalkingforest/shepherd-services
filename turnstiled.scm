(define turstiled
  (service
    '(turstiled)
    #:start (make-forkexec-constructor
              '("turstiled"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list turstiled))
