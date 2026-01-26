; exec xdm -error /dev/stdout -nodaemon 2>&1
(define xdm
  '(xdm)
  #:start (make-forkexec-constructor
	    '("xdm" "-error" "/dev/stdout" "-nodaemon"))
  #:stop (make-kill-destructor)
  #:respawn? #t)
(register-services (list xdm))
