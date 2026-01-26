; install -d -m0711 -olightdm -glightdm /run/lightdm
(define lightdm
  (service
    '(lightdm)
    #:requirement '(dbus)
    #:start (make-forkexec-constructor '("lightdm"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list lightdm))
