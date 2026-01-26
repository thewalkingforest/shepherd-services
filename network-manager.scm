(define network-manager
  (service
    '(network-manager dns)
    #:requirement '(dbus)
    #:start (make-forkexec-constructor
              '("NetworkManager" "-n"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list network-manager))
