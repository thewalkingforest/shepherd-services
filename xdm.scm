; exec xdm -error /dev/stdout -nodaemon 2>&1
(register-services (list
  (service
    '(xdm)
    #:start (make-forkexec-constructor
              '("xdm" "-error" "/dev/stdout" "-nodaemon"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
