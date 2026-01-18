;; SPDX-License-Identifier: MPL-2.0
;; PLAYBOOK.scm - Operational runbook

(define playbook
  `((version . "1.0.0")
    (procedures
      ((build . ("Run main source file"))
       (test . ("Verify HTML output"))
       (deploy . ("Copy to web server"))))
    (alerts . ())
    (contacts . ())))
