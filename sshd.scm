(register-services (list
  (service
    '(sshd)
    #:start (make-forkexec-constructor
              '("sshd" "-D"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
