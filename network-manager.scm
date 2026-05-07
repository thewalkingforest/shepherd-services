(register-services (list
  (service
    '(network-manager)
    #:requirement '(dbus)
    #:start (make-forkexec-constructor
              '("NetworkManager" "-n"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
