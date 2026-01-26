; exec 2>&1
; [ -r conf ] && . ./conf
; exec acpid -f ${OPTS:=-l}
(define acpid
  (service
    '(acpid)
    #:start (make-forkexec-constructor
              '("acpid" "-f" "-l"))
    #:stop (make-kill-destructor)
    #:respawn? #t))
(register-services (list acpid))
