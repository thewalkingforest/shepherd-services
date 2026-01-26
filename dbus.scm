(define* (setup-dbus path mode uid #:optional (gid uid))
  "Ensure PATH exists as a directory with MODE and owned by UID:GID."
  (cond
    ((not (access? path F_OK))
     (mkdir path mode)
     (chown path uid gid)
     #t)
    ((eq? (stat:type (stat path)) 'directory)
     (chown path uid gid)
     #t)
    (else #f)))

(define dbus
  (service
    '(dbus)
    #:start (make-forkexec-constructor
              '("dbus-daemon" "--system" "--nofork" "--nopidfile"))
    #:stop (make-kill-destructor)
    #:respawn? #t))

(when (setup-dbus "/run/dbus" #o755 22)
  (register-services (list dbus)))
