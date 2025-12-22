;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — chicxulub--ssg
;;; Operational playbook for SSG satellite development and maintenance

(define-module (chicxulub-ssg playbook)
  #:export (workflows operations runbooks))

;; ============================================================================
;; DEVELOPMENT WORKFLOWS
;; ============================================================================
(define workflows
  '((daily
      ((morning-standup
         (steps
           ("Review open issues and PRs")
           ("Check CI/CD status")
           ("Sync adapters from hub if needed")
           ("Run local test suite")))
       (development-cycle
         (steps
           ("Create feature branch from main")
           ("Implement changes with tests")
           ("Run `just check` before commit")
           ("Submit PR with conventional commit message")))))

    (weekly
      ((adapter-sync
         (description "Synchronize adapters from poly-ssg-mcp hub")
         (command "just sync-adapters")
         (frequency "weekly or when hub updates"))
       (dependency-review
         (description "Review and merge Dependabot PRs")
         (command "gh pr list --label dependencies")
         (frequency "weekly"))
       (security-scan
         (description "Review CodeQL findings")
         (command "gh api repos/{owner}/{repo}/code-scanning/alerts")
         (frequency "weekly"))))

    (release
      ((prepare
         (steps
           ("Update CHANGELOG.md")
           ("Bump version in STATE.scm")
           ("Run full test suite")
           ("Create release branch")))
       (publish
         (steps
           ("Tag release with SemVer")
           ("Push to registry")
           ("Update documentation")
           ("Announce release")))))))

;; ============================================================================
;; OPERATIONS
;; ============================================================================
(define operations
  '((adapter-management
      ((add-adapter
         (preconditions ("Adapter exists in poly-ssg-mcp hub"))
         (steps
           ("Run sync script: just sync-adapters")
           ("Verify adapter loads: just test-adapter <name>")
           ("Update adapters/README.md")
           ("Commit with conventional message")))
       (update-adapter
         (steps
           ("Sync from hub: just sync-adapters")
           ("Run tests: just test")
           ("Check for breaking changes")
           ("Update CHANGELOG if needed")))
       (deprecate-adapter
         (steps
           ("Add deprecation notice to adapter")
           ("Update adapters/README.md")
           ("Announce in next release notes")))))

    (testing
      ((unit-tests
         (command "just test")
         (coverage-target 70)
         (framework "deno test"))
       (integration-tests
         (command "just test-e2e")
         (requires ("All SSG binaries installed"))
         (timeout "10m"))
       (linting
         (command "just lint")
         (tools ("deno lint" "deno fmt --check")))
       (type-checking
         (command "just check")
         (tools ("deno check")))))

    (deployment
      ((staging
         (environment "staging")
         (branch "develop")
         (auto-deploy #t))
       (production
         (environment "production")
         (branch "main")
         (requires-approval #t)
         (rollback-strategy "git revert"))))))

;; ============================================================================
;; RUNBOOKS
;; ============================================================================
(define runbooks
  '((incident-response
      ((ci-failure
         (severity "medium")
         (steps
           ("Check workflow logs: gh run view")
           ("Identify failing step")
           ("Run locally to reproduce")
           ("Fix and push")
           ("Verify CI passes")))
       (security-vulnerability
         (severity "high")
         (steps
           ("Assess CVSS score")
           ("Create private security advisory")
           ("Develop fix in private fork")
           ("Coordinate disclosure")
           ("Release patch")))
       (adapter-broken
         (severity "low")
         (steps
           ("Check if SSG binary is installed")
           ("Verify adapter code matches SSG version")
           ("Sync from hub if needed")
           ("Open issue if hub adapter is broken")))))

    (maintenance
      ((update-dependencies
         (frequency "weekly")
         (steps
           ("Review Dependabot PRs")
           ("Check for breaking changes")
           ("Run test suite")
           ("Merge if passing")))
       (archive-old-branches
         (frequency "monthly")
         (command "git branch -r --merged main | grep -v main | xargs git push origin --delete"))
       (cleanup-artifacts
         (frequency "monthly")
         (steps
           ("Remove old build artifacts")
           ("Prune Docker images")
           ("Clear Deno cache if needed")))))

    (onboarding
      ((new-contributor
         (steps
           ("Read CONTRIBUTING.md")
           ("Set up development environment")
           ("Run `just setup`")
           ("Complete first-good-issue")
           ("Request Perimeter 3 access")))
       (new-maintainer
         (steps
           ("Complete contributor onboarding")
           ("Review security policies")
           ("Gain familiarity with all adapters")
           ("Request Perimeter 2 access")))))))

;; ============================================================================
;; COMMAND REFERENCE
;; ============================================================================
(define command-reference
  '((just
      ((build . "just build")
       (test . "just test")
       (test-e2e . "just test-e2e")
       (lint . "just lint")
       (fmt . "just fmt")
       (check . "just check")
       (sync-adapters . "just sync-adapters")
       (docs . "just docs")
       (clean . "just clean")))
    (deno
      ((run . "deno run --allow-read --allow-run")
       (test . "deno test --allow-all")
       (lint . "deno lint")
       (fmt . "deno fmt")
       (check . "deno check")))
    (git
      ((feature-branch . "git checkout -b feat/<name>")
       (sync-main . "git fetch origin main && git rebase origin/main")
       (signed-commit . "git commit -S -m '<message>'")))))
