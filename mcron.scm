(define mcron
  (service
    '(mcron crond cron)
    #:start (make-forkexec-constructor '("mcron"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list mcron))
