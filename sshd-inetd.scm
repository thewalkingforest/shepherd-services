;; Will wait for a connection on port 22 before starting
(define sshd-inetd
  (service
    '(sshd-inetd sshd ssh-daemon)
    #:start (make-inetd-constructor
	      '("sshd" "-D" "-i")
	      (list (endpoint (make-socket-address AF_INET INADDR_ANY 22))
                    (endpoint (make-socket-address AF_INET6 IN6ADDR_ANY 22)))
	      #:max-connections 10)
    #:stop (make-inetd-destructor)
    #:respawn? #t))
(register-services (list sshd-inetd))
