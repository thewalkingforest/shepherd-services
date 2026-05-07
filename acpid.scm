; exec 2>&1
; [ -r conf ] && . ./conf
; exec acpid -f ${OPTS:=-l}
(register-services (list
  (service
    '(acpid)
    #:start (make-forkexec-constructor
              '("acpid" "-f" "-l"))
    #:stop (make-kill-destructor)
    #:respawn? #t)))
