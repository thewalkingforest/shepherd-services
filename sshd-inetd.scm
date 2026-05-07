;; Will wait for a connection on port 22 before starting
(register-services (list
  (service
    '(sshd-inetd)
    #:start (make-inetd-constructor
              '("sshd" "-D" "-i")
	          (list (endpoint (make-socket-address AF_INET INADDR_ANY 22))
                    (endpoint (make-socket-address AF_INET6 IN6ADDR_ANY 22)))
	          #:max-connections 10)
    #:stop (make-inetd-destructor)
    #:respawn? #t)))
