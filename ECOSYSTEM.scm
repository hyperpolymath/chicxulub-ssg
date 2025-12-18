;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — chicxulub--ssg

(ecosystem
  (version "1.0.0")
  (name "chicxulub--ssg")
  (type "satellite")
  (purpose "Static Site Generator satellite with 28 SSG adapters via MCP protocol")

  (position-in-ecosystem
    "Satellite SSG implementation in the hyperpolymath ecosystem. Synchronizes adapters from poly-ssg-mcp hub. Follows RSR guidelines.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28 SSGs - provides adapter interface")
      (differentiation
        "poly-ssg-mcp = Hub with all SSG adapters via MCP
         chicxulub--ssg = Satellite SSG implementation using the hub"))
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is "Satellite SSG adapter implementation providing MCP-compatible interface to 28 static site generators")
  (what-this-is-not "- NOT the hub (poly-ssg-mcp is the hub)\n- NOT exempt from RSR compliance"))
