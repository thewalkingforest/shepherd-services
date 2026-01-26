(define dhcpcd
  (service
    '(dhcpcd dns)
    #:start (make-forkexec-constructor
              '("dhcpcd" "-B" "-M"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list dhcpcd))
