(define dhcpcd
  (service
    '(dhcpcd)
    #:start (make-forkexec-constructor
              '("dhcpcd" "-B" "-M"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list dhcpcd))
