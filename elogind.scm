(register-services (list
  (service
    '(elogind)
    #:start (make-forkexec-constructor
              '("/usr/libexec/elogind/elogind.wrapper"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
