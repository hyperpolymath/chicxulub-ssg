;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; ROADMAP.scm — chicxulub--ssg

(define roadmap
  '((version . "1.0.0")
    (last-updated . "2025-12-18")
    (project . "chicxulub--ssg")))

;; ============================================================================
;; PHASE 1: Foundation (v0.1) - COMPLETE
;; ============================================================================
(define phase-1
  '((name . "Foundation")
    (version . "v0.1")
    (status . "complete")
    (completion . 100)
    (milestones
      ((milestone "RSR Compliance Setup"
         (status . "complete")
         (items
           ("SHA-pinned GitHub Actions" . complete)
           ("SPDX licensing headers" . complete)
           ("Dependabot configuration" . complete)
           ("CodeQL security scanning" . complete)
           (".gitignore and .gitattributes" . complete)))
       (milestone "Initial Repository Structure"
         (status . "complete")
         (items
           ("META.scm architecture decisions" . complete)
           ("STATE.scm project state" . complete)
           ("ECOSYSTEM.scm ecosystem position" . complete)
           ("CONTRIBUTING.md guidelines" . complete)))))))

;; ============================================================================
;; PHASE 2: Security & Integration (v0.2) - CURRENT
;; ============================================================================
(define phase-2
  '((name . "Security & Integration")
    (version . "v0.2")
    (status . "in-progress")
    (completion . 80)
    (milestones
      ((milestone "Security Policy"
         (status . "complete")
         (items
           ("SECURITY.md - vulnerability reporting" . complete)
           ("CODE_OF_CONDUCT.md - community standards" . complete)
           ("Security placeholders replaced" . complete)))
       (milestone "SSG Adapter Integration"
         (status . "complete")
         (items
           ("28 SSG adapters synced from poly-ssg-mcp" . complete)
           ("MCP protocol compatibility" . complete)
           ("Adapter README documentation" . complete)))
       (milestone "CI/CD Verification"
         (status . "pending")
         (items
           ("Verify CodeQL workflow triggers" . pending)
           ("Test Dependabot updates" . pending)
           ("Validate build pipeline" . pending)))))))

;; ============================================================================
;; PHASE 3: Testing & Quality (v0.3) - NEXT
;; ============================================================================
(define phase-3
  '((name . "Testing & Quality")
    (version . "v0.3")
    (status . "planned")
    (completion . 0)
    (milestones
      ((milestone "Test Infrastructure"
         (status . "planned")
         (items
           ("Deno test framework setup" . planned)
           ("Unit tests for adapter interface" . planned)
           ("Integration tests for MCP protocol" . planned)
           ("70% code coverage target" . planned)))
       (milestone "Code Quality"
         (status . "planned")
         (items
           ("deno fmt formatting" . planned)
           ("deno lint linting" . planned)
           ("Type checking with TypeScript" . planned)))))))

;; ============================================================================
;; PHASE 4: Documentation (v0.4)
;; ============================================================================
(define phase-4
  '((name . "Documentation")
    (version . "v0.4")
    (status . "planned")
    (completion . 0)
    (milestones
      ((milestone "User Documentation"
         (status . "planned")
         (items
           ("README.adoc main documentation" . planned)
           ("Usage examples for each adapter" . planned)
           ("API reference documentation" . planned)))
       (milestone "Developer Documentation"
         (status . "planned")
         (items
           ("Architecture overview" . planned)
           ("Contributing guide improvements" . planned)
           ("Adapter development guide" . planned)))))))

;; ============================================================================
;; PHASE 5: Release & Publish (v1.0)
;; ============================================================================
(define phase-5
  '((name . "Release & Publish")
    (version . "v1.0")
    (status . "planned")
    (completion . 0)
    (milestones
      ((milestone "Release Preparation"
         (status . "planned")
         (items
           ("CHANGELOG.md" . planned)
           ("Version tagging" . planned)
           ("Release notes" . planned)))
       (milestone "Publishing"
         (status . "planned")
         (items
           ("npm/deno.land package" . planned)
           ("GitHub release" . planned)
           ("Documentation site" . planned)))))))

;; ============================================================================
;; IMMEDIATE PRIORITIES (Next 2 Weeks)
;; ============================================================================
(define immediate-priorities
  '((priority . "high")
    (items
      (("Verify CI/CD pipeline works" . "Run tests on main branch")
       ("Add basic test suite" . "Unit tests for adapter interface")
       ("Complete README.adoc" . "Project overview and usage instructions")))))

;; ============================================================================
;; SUMMARY
;; ============================================================================
(define roadmap-summary
  '((phases
      ((phase-1 . "Foundation - COMPLETE (100%)")
       (phase-2 . "Security & Integration - IN PROGRESS (80%)")
       (phase-3 . "Testing & Quality - PLANNED (0%)")
       (phase-4 . "Documentation - PLANNED (0%)")
       (phase-5 . "Release & Publish - PLANNED (0%)")))
    (overall-progress . 40)
    (target-v1-release . "Q1 2025")))
