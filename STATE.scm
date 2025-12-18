;;; STATE.scm — chicxulub--ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.1.0") (updated . "2025-12-18") (project . "chicxulub--ssg")))

(define current-position
  '((phase . "v0.2 - Security & SCM Fixes")
    (overall-completion . 40)
    (components
      ((rsr-compliance ((status . "complete") (completion . 100)))
       (security-policy ((status . "complete") (completion . 100)))
       (code-of-conduct ((status . "complete") (completion . 100)))
       (adapters ((status . "synced") (completion . 100)))
       (ci-cd ((status . "configured") (completion . 80)))
       (testing ((status . "pending") (completion . 0)))
       (documentation ((status . "in-progress") (completion . 30)))))))

(define blockers-and-issues '((critical ()) (high-priority ())))

(define critical-next-actions
  '((immediate
      (("Add test suite" . high)
       ("Complete README.adoc" . medium)))
    (this-week
      (("Verify CI/CD pipeline" . high)
       ("Add integration tests" . medium)))))

(define session-history
  '((snapshots
      ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
      ((date . "2025-12-16") (session . "integration") (notes . "SSG adapters synced from poly-ssg-mcp hub"))
      ((date . "2025-12-18") (session . "security-review") (notes . "Fixed security placeholders, updated SCM files")))))

(define state-summary
  '((project . "chicxulub--ssg") (completion . 40) (blockers . 0) (updated . "2025-12-18")))
