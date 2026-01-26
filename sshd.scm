(define sshd-forkexec
  (service
    '(sshd-forkexec sshd ssh-daemon)
    #:start (make-forkexec-constructor
	      '("sshd" "-D"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list sshd-forkexec))
