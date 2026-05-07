(use-modules (blackcat shepherd utils))

(when (setup-dir "/run/lightdm" #o711 "lightdm")
  (register-services (list
    (service
      '(lightdm)
      #:requirement '(dbus)
      #:start (make-forkexec-constructor '("lightdm"))
      #:stop (make-kill-destructor)
      #:respawn? #t))))
