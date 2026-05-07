(use-modules (blackcat shepherd utils))

(when (setup-dir "/run/dbus" #o755 "dbus")
  (register-services (list
    (service
      '(dbus)
      #:start (make-forkexec-constructor
                '("dbus-daemon" "--system" "--nofork" "--nopidfile"))
      #:stop (make-kill-destructor)
      #:respawn? #t))))
