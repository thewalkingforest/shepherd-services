(define seatd
  (service
    '(seatd)
    #:start (make-forkexec-constructor
              '("seatd" "-g" "_seatd"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list seatd))
