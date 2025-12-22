;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; NEUROSYM.scm — chicxulub--ssg
;;; Neurosymbolic reasoning patterns for SSG adapter intelligence

(define-module (chicxulub-ssg neurosym)
  #:export (reasoning-patterns knowledge-base inference-rules))

;; ============================================================================
;; KNOWLEDGE BASE - SSG Domain
;; ============================================================================
(define knowledge-base
  '((ssg-taxonomy
      ((rust-based
         (members ("zola" "cobalt" "mdbook"))
         (characteristics
           ("fast compilation" "single binary" "zero dependencies"))
         (config-format ("toml")))
       (haskell-based
         (members ("hakyll" "ema"))
         (characteristics
           ("pure functional" "strong types" "stack/cabal build"))
         (config-format ("yaml" "haskell-dsl")))
       (clojure-based
         (members ("cryogen" "perun" "babashka"))
         (characteristics
           ("jvm-based" "lisp syntax" "leiningen build"))
         (config-format ("edn" "clojure")))
       (julia-based
         (members ("franklin" "documenter" "staticwebpages"))
         (characteristics
           ("scientific computing" "literate programming" "Pkg.jl"))
         (config-format ("toml" "julia")))
       (elixir-based
         (members ("serum" "nimble-publisher" "tableau"))
         (characteristics
           ("beam vm" "functional" "mix build"))
         (config-format ("elixir" "toml")))
       (racket-based
         (members ("frog" "pollen"))
         (characteristics
           ("lisp family" "macro-heavy" "raco build"))
         (config-format ("racket")))
       (scala-based
         (members ("laika" "scalatex"))
         (characteristics
           ("jvm" "sbt build" "type-safe"))
         (config-format ("scala" "hocon")))))

    (file-patterns
      ((config-detection
         (("config.toml" "zola.toml") . "zola")
         (("_config.yml") . "hakyll")
         (("project.clj" "deps.edn") . "cryogen")
         (("Package.toml" "Project.toml") . "franklin")
         (("mix.exs" "serum") . "serum")
         (("book.toml") . "mdbook")
         (("info.rkt") . "frog")
         (("pollen.rkt") . "pollen")))
       (content-patterns
         (("content/" "posts/") . "blog-structure")
         (("docs/" "src/") . "documentation-structure")
         (("pages/") . "page-structure"))))

    (error-patterns
      ((common-errors
         ((pattern "ENOENT.*config")
          (meaning "Configuration file not found")
          (suggestion "Run init command or create config file"))
         ((pattern "command not found")
          (meaning "SSG binary not installed")
          (suggestion "Install the SSG: brew install <ssg> or cargo install <ssg>"))
         ((pattern "syntax error.*template")
          (meaning "Template syntax error")
          (suggestion "Check template delimiters and variable names"))
         ((pattern "port.*in use")
          (meaning "Development server port conflict")
          (suggestion "Use --port flag to specify different port")))))))

;; ============================================================================
;; REASONING PATTERNS
;; ============================================================================
(define reasoning-patterns
  '((ssg-detection
      (type "classification")
      (description "Determine which SSG a project uses")
      (algorithm
        ((step-1 "Check for config file patterns")
         (step-2 "Analyze project structure")
         (step-3 "Check package manager files")
         (step-4 "Fallback to content analysis")))
      (confidence-threshold 0.8))

    (error-diagnosis
      (type "root-cause-analysis")
      (description "Identify cause of build failures")
      (algorithm
        ((step-1 "Parse error message")
         (step-2 "Match against known patterns")
         (step-3 "Check recent changes")
         (step-4 "Suggest remediation")))
      (learning-enabled #t))

    (migration-planning
      (type "transformation")
      (description "Plan SSG migration strategy")
      (algorithm
        ((step-1 "Analyze source structure")
         (step-2 "Map content types")
         (step-3 "Identify incompatibilities")
         (step-4 "Generate migration script")))
      (requires-approval #t))

    (optimization
      (type "performance-analysis")
      (description "Suggest build optimizations")
      (algorithm
        ((step-1 "Profile build time")
         (step-2 "Identify bottlenecks")
         (step-3 "Compare with benchmarks")
         (step-4 "Recommend improvements"))))))

;; ============================================================================
;; INFERENCE RULES
;; ============================================================================
(define inference-rules
  '((ssg-compatibility
      ((rule "rust-ssg-fast"
         (antecedent (ssg-type . "rust-based"))
         (consequent (build-speed . "fast") (memory-usage . "low")))
       (rule "jvm-ssg-slow-start"
         (antecedent (ssg-type . ("scala-based" "clojure-based")))
         (consequent (startup-time . "slow") (build-speed . "medium")))
       (rule "haskell-ssg-type-safe"
         (antecedent (ssg-type . "haskell-based"))
         (consequent (type-safety . "high") (error-messages . "precise")))))

    (content-mapping
      ((rule "markdown-universal"
         (antecedent (content-format . "markdown"))
         (consequent (compatibility . "all-ssgs")))
       (rule "rst-limited"
         (antecedent (content-format . "rst"))
         (consequent (compatibility . ("sphinx" "documenter"))))
       (rule "org-mode-limited"
         (antecedent (content-format . "org"))
         (consequent (compatibility . ("hakyll" "hugo"))))))

    (build-strategy
      ((rule "incremental-preferred"
         (antecedent (site-size . "large") (change-scope . "small"))
         (consequent (strategy . "incremental")))
       (rule "full-rebuild-safe"
         (antecedent (config-changed . #t))
         (consequent (strategy . "full-rebuild")))
       (rule "parallel-multi-lang"
         (antecedent (multi-language . #t))
         (consequent (strategy . "parallel-per-language")))))))

;; ============================================================================
;; SYMBOLIC REPRESENTATIONS
;; ============================================================================
(define symbolic-representations
  '((site-structure
      (grammar
        "Site := Config Content* Template* Static*
         Config := TomlConfig | YamlConfig | JsonConfig
         Content := Markdown | RST | Org | HTML
         Template := Jinja | Tera | Liquid | Custom
         Static := Image | CSS | JS | Font"))

    (build-pipeline
      (grammar
        "Pipeline := Parse -> Transform -> Render -> Write
         Parse := ReadContent | ReadTemplate | ReadConfig
         Transform := ApplyTemplate | ProcessMarkdown | OptimizeAssets
         Render := GenerateHTML | GenerateSitemap | GenerateFeed
         Write := OutputFiles | CopyStatic"))

    (adapter-interface
      (grammar
        "Adapter := Connect Disconnect Tools*
         Connect := CheckBinary | InitState
         Tools := Name Description Schema Execute
         Execute := RunCommand | ParseOutput | ReturnResult"))))

;; ============================================================================
;; LEARNING COMPONENTS
;; ============================================================================
(define learning-components
  '((pattern-recognition
      (description "Learn from successful builds and failures")
      (data-sources
        ("build-logs" "error-messages" "user-corrections"))
      (update-frequency "per-session")
      (storage "local-embeddings"))

    (preference-learning
      (description "Learn user preferences for SSG choices")
      (signals
        ("explicit-choice" "usage-frequency" "successful-builds"))
      (model "collaborative-filtering"))

    (error-clustering
      (description "Cluster similar errors for better diagnosis")
      (algorithm "hierarchical-clustering")
      (features ("error-type" "ssg" "file-pattern" "resolution")))))

;; ============================================================================
;; HYBRID REASONING
;; ============================================================================
(define hybrid-reasoning
  '((neural-symbolic-bridge
      (neural-components
        ("error-message-embedding" "code-similarity" "intent-classification"))
      (symbolic-components
        ("rule-based-diagnosis" "grammar-validation" "type-checking"))
      (integration-strategy "neural-guides-symbolic"))

    (confidence-calibration
      (low-confidence-threshold 0.5)
      (high-confidence-threshold 0.9)
      (actions
        ((below-low "Ask user for clarification")
         (low-to-high "Proceed with explanation")
         (above-high "Proceed automatically"))))

    (explanation-generation
      (levels ("brief" "detailed" "technical"))
      (components
        ("reasoning-chain" "evidence" "alternatives" "confidence")))))
