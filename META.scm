;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — chicxulub--ssg

(define-module (chicxulub-ssg meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Project in the hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers" "Multi-platform CI")))
    (adr-002
     (title . "Satellite Architecture")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "Need to provide SSG adapter interface consistent with poly-ssg-mcp hub")
     (decision . "Synchronize adapters from poly-ssg-mcp hub, maintain satellite pattern")
     (consequences . ("28 SSG adapters" "MCP protocol compatibility" "Deno runtime")))))

(define development-practices
  '((code-style (languages . ("javascript" "typescript")) (formatter . "deno fmt") (linter . "deno lint"))
    (security (sast . "CodeQL") (credentials . "env vars only") (actions . "SHA-pinned"))
    (testing (coverage-minimum . 70) (framework . "deno test"))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-rsr "RSR ensures consistency, security, and maintainability across the hyperpolymath ecosystem.")
    (why-satellite "Satellite pattern allows specialized SSG implementations while maintaining compatibility with the central hub.")
    (why-deno "Deno provides secure-by-default runtime with built-in TypeScript support for MCP adapters.")))
