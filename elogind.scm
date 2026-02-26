(define elogind
  (service
    '(elogind)
    #:start (make-forkexec-constructor
              '("/usr/libexec/elogind/elogind.wrapper"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(register-services (list elogind))
