(use-modules (blackcat shepherd-utils))

(define lightdm
  (service
    '(lightdm)
    #:requirement '(dbus)
    #:start (make-forkexec-constructor '("lightdm"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(when (setup-dir "/run/lightdm" #o711 "lightdm")
  (register-services (list lightdm)))
