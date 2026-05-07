(register-services (list
  (service
    '(mcron)
    #:start (make-forkexec-constructor '("mcron"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
