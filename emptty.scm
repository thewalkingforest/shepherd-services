; exec setsid /usr/bin/emptty -d
; NOTE: unsure if setsid is needed
(register-services (list
  (service
    '(emptty)
    #:start (make-forkexec-constructor
              '("setsid" "/usr/bin/emptty" "-d"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
