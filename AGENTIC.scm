;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — chicxulub--ssg
;;; Agentic AI patterns for SSG adapter automation and orchestration

(define-module (chicxulub-ssg agentic)
  #:export (agent-capabilities tool-definitions orchestration-patterns))

;; ============================================================================
;; AGENT CAPABILITIES
;; ============================================================================
(define agent-capabilities
  '((core-functions
      ((adapter-discovery
         (description "Discover and enumerate available SSG adapters")
         (inputs ())
         (outputs ("adapter-list" "adapter-metadata"))
         (implementation "List adapters/ directory, parse exports"))
       (adapter-connection
         (description "Connect to a specific SSG adapter")
         (inputs ("adapter-name"))
         (outputs ("connection-status" "available-tools"))
         (implementation "Import adapter, call connect()"))
       (tool-execution
         (description "Execute a tool from an adapter")
         (inputs ("adapter-name" "tool-name" "parameters"))
         (outputs ("result" "stdout" "stderr" "exit-code"))
         (implementation "Call tool.execute(params)"))
       (multi-adapter-orchestration
         (description "Coordinate actions across multiple SSG adapters")
         (inputs ("action-plan" "adapter-list"))
         (outputs ("aggregated-results"))
         (implementation "Parallel/sequential execution based on dependencies"))))

    (mcp-protocol
      ((tool-listing
         (method "tools/list")
         (description "List all available tools across all adapters")
         (schema . "MCP Tool List Response"))
       (tool-call
         (method "tools/call")
         (description "Execute a specific tool with parameters")
         (schema . "MCP Tool Call Request/Response"))
       (resource-access
         (method "resources/read")
         (description "Read generated site content")
         (schema . "MCP Resource Response"))))

    (autonomous-actions
      ((site-generation
         (trigger "User requests site build")
         (steps
           ("Detect SSG type from config")
           ("Connect to appropriate adapter")
           ("Execute build command")
           ("Report results"))
         (fallback "Suggest manual steps if adapter fails"))
       (error-diagnosis
         (trigger "Build failure detected")
         (steps
           ("Parse error message")
           ("Identify common patterns")
           ("Suggest fixes")
           ("Offer to apply fix"))
         (requires ("error-pattern-knowledge")))
       (migration-assistance
         (trigger "User wants to change SSG")
         (steps
           ("Analyze current site structure")
           ("Map to target SSG conventions")
           ("Generate migration plan")
           ("Execute with user approval")))))))

;; ============================================================================
;; TOOL DEFINITIONS (MCP Format)
;; ============================================================================
(define tool-definitions
  '((meta-tools
      ((list_adapters
         (name "list_adapters")
         (description "List all available SSG adapters with their metadata")
         (inputSchema
           (type "object")
           (properties ())
           (required ())))
       (get_adapter_info
         (name "get_adapter_info")
         (description "Get detailed information about a specific adapter")
         (inputSchema
           (type "object")
           (properties
             ((adapter (type "string") (description "Adapter name"))))
           (required ("adapter"))))
       (connect_adapter
         (name "connect_adapter")
         (description "Connect to an SSG adapter and verify it's available")
         (inputSchema
           (type "object")
           (properties
             ((adapter (type "string") (description "Adapter name to connect"))))
           (required ("adapter"))))
       (execute_tool
         (name "execute_tool")
         (description "Execute a tool from a connected adapter")
         (inputSchema
           (type "object")
           (properties
             ((adapter (type "string") (description "Adapter name"))
              (tool (type "string") (description "Tool name"))
              (params (type "object") (description "Tool parameters"))))
           (required ("adapter" "tool"))))))

    (orchestration-tools
      ((build_site
         (name "build_site")
         (description "Build a static site using the detected or specified SSG")
         (inputSchema
           (type "object")
           (properties
             ((path (type "string") (description "Path to site root"))
              (ssg (type "string") (description "SSG to use (auto-detect if omitted)"))))
           (required ("path"))))
       (serve_site
         (name "serve_site")
         (description "Start a development server for the site")
         (inputSchema
           (type "object")
           (properties
             ((path (type "string") (description "Path to site root"))
              (port (type "number") (description "Port number"))
              (ssg (type "string") (description "SSG to use"))))
           (required ("path"))))
       (migrate_site
         (name "migrate_site")
         (description "Migrate a site from one SSG to another")
         (inputSchema
           (type "object")
           (properties
             ((source_path (type "string") (description "Source site path"))
              (source_ssg (type "string") (description "Current SSG"))
              (target_ssg (type "string") (description "Target SSG"))
              (target_path (type "string") (description "Output path"))))
           (required ("source_path" "source_ssg" "target_ssg"))))))))

;; ============================================================================
;; ORCHESTRATION PATTERNS
;; ============================================================================
(define orchestration-patterns
  '((sequential
      (description "Execute tools in sequence, passing outputs to inputs")
      (use-case "Build then deploy")
      (example
        ((step-1 (adapter "zola") (tool "zola_build") (params ((path . "."))))
         (step-2 (adapter "deploy") (tool "upload") (params ((source . "public/")))))))

    (parallel
      (description "Execute independent tools concurrently")
      (use-case "Build multiple sites simultaneously")
      (example
        ((parallel
           ((adapter "zola") (tool "zola_build") (params ((path . "site-a"))))
           ((adapter "hugo") (tool "hugo_build") (params ((path . "site-b"))))))))

    (conditional
      (description "Execute tools based on conditions")
      (use-case "Different build steps for different environments")
      (example
        ((condition (env . "production"))
         (if-true (adapter "zola") (tool "zola_build") (params ((drafts . #f))))
         (if-false (adapter "zola") (tool "zola_build") (params ((drafts . #t)))))))

    (retry-with-backoff
      (description "Retry failed operations with exponential backoff")
      (use-case "Network-dependent operations")
      (config
        ((max-retries . 3)
         (initial-delay-ms . 1000)
         (backoff-multiplier . 2))))

    (fallback-chain
      (description "Try alternatives if primary fails")
      (use-case "Multiple SSG options for compatibility")
      (example
        ((try (adapter "zola") (tool "zola_build"))
         (fallback (adapter "hugo") (tool "hugo_build"))
         (fallback (adapter "jekyll") (tool "jekyll_build")))))))

;; ============================================================================
;; AGENT CONFIGURATION
;; ============================================================================
(define agent-config
  '((permissions
      ((file-system
         (read . #t)
         (write . "site-directories-only")
         (execute . "ssg-binaries-only"))
       (network
         (allow . ("localhost" "127.0.0.1"))
         (deny . "*"))
       (process
         (spawn . "ssg-processes-only")
         (max-concurrent . 4))))

    (safety-constraints
      ((max-execution-time . 300)
       (max-memory-mb . 1024)
       (sandbox-mode . #t)
       (require-user-approval
         ((destructive-operations . #t)
          (network-operations . #t)
          (new-file-creation . #f)))))

    (observability
      ((logging
         (level . "info")
         (format . "structured-json")
         (destination . "stdout"))
       (metrics
         (enabled . #t)
         (endpoint . "/metrics"))
       (tracing
         (enabled . #t)
         (sampler . "always"))))))

;; ============================================================================
;; HOOK INTEGRATION
;; ============================================================================
(define hook-integration
  '((pre-build
      (triggers ("file-change" "manual" "scheduled"))
      (actions
        ("Validate configuration")
        ("Check dependencies")
        ("Run linters")))
    (post-build
      (triggers ("build-success"))
      (actions
        ("Run tests on output")
        ("Generate sitemap")
        ("Optimize assets")))
    (on-error
      (triggers ("build-failure" "test-failure"))
      (actions
        ("Parse error")
        ("Suggest fix")
        ("Notify if configured")))
    (on-deploy
      (triggers ("deploy-request"))
      (actions
        ("Verify build exists")
        ("Run pre-deploy checks")
        ("Execute deployment")
        ("Verify deployment")))))
