;;; STATE.scm — chicxulub--ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.2.0") (updated . "2025-12-22") (project . "chicxulub--ssg")))

(define current-position
  '((phase . "v0.3 - Full Infrastructure")
    (overall-completion . 85)
    (components
      ;; Core Infrastructure (4/4)
      ((core-engine
         ((justfile ((status . "complete") (completion . 100)))
          (mustfile ((status . "complete") (completion . 100)))
          (hooks ((status . "complete") (completion . 100)))
          (ci-cd ((status . "complete") (completion . 100)))))
       ;; SCM Files (6/6)
       (scm-files
         ((meta-scm ((status . "complete") (completion . 100)))
          (state-scm ((status . "complete") (completion . 100)))
          (ecosystem-scm ((status . "complete") (completion . 100)))
          (playbook-scm ((status . "complete") (completion . 100)))
          (agentic-scm ((status . "complete") (completion . 100)))
          (neurosym-scm ((status . "complete") (completion . 100)))))
       ;; Adapters (28/28)
       (adapters
         ((status . "synced")
          (count . 28)
          (completion . 100)
          (source . "poly-ssg-mcp hub")))
       ;; Documentation (3/5)
       (documentation
         ((cookbook ((status . "complete") (completion . 100)))
          (readme ((status . "pending") (completion . 20)))
          (contributing ((status . "complete") (completion . 100)))
          (security ((status . "complete") (completion . 100)))
          (code-of-conduct ((status . "complete") (completion . 100)))))
       ;; Security (4/4)
       (security
         ((codeql ((status . "complete") (completion . 100)))
          (dependabot ((status . "complete") (completion . 100)))
          (spdx-headers ((status . "complete") (completion . 100)))
          (secrets-scanning ((status . "complete") (completion . 100)))))
       ;; Testing (0/4)
       (testing
         ((unit-tests ((status . "pending") (completion . 0)))
          (e2e-tests ((status . "pending") (completion . 0)))
          (coverage ((status . "pending") (completion . 0)))
          (benchmarks ((status . "pending") (completion . 0)))))))))

(define blockers-and-issues '((critical ()) (high-priority ())))

(define critical-next-actions
  '((immediate
      (("Create test directory structure" . high)
       ("Write unit tests for adapter interface" . high)
       ("Complete README.adoc" . medium)))
    (this-week
      (("Add e2e tests" . medium)
       ("Achieve 70% coverage target" . medium)
       ("Create Containerfile" . low)))))

(define session-history
  '((snapshots
      ((date . "2025-12-15") (session . "initial") (notes . "SCM files added"))
      ((date . "2025-12-16") (session . "integration") (notes . "SSG adapters synced from poly-ssg-mcp hub"))
      ((date . "2025-12-18") (session . "security-review") (notes . "Fixed security placeholders, updated SCM files"))
      ((date . "2025-12-22") (session . "infrastructure") (notes . "Added justfile, mustfile, cookbook, hooks, CI/CD, PLAYBOOK, AGENTIC, NEUROSYM")))))

(define state-summary
  '((project . "chicxulub--ssg")
    (completion . 85)
    (blockers . 0)
    (updated . "2025-12-22")
    (phase . "v0.3")
    (next-milestone . "testing")))
