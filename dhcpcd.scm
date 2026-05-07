(register-services (list
  (service
    '(dhcpcd)
    #:start (make-forkexec-constructor
              '("dhcpcd" "-B" "-M"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
