(use-modules (blackcat shepherd-utils))

(define dbus
  (service
    '(dbus)
    #:start (make-forkexec-constructor
              '("dbus-daemon" "--system" "--nofork" "--nopidfile"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(when (setup-dir "/run/dbus" #o755 "dbus")
  (register-services (list dbus)))
