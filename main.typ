#import "/globals.typ": *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.author,
  config-info(
    title: [Nix/NixOs],
    subtitle: [A yocto alternative?],
    author: [Guillaume Fournier],
    date: datetime.today(),
    // institution: [Institution],
    // logo: image("nix-logo.svg", width: 50%),
   )
)


#title-slide()


== Nix overview
  Developed by Eleco Dolstra in 2004 as PhD research
  - Nix: The domain-specifc language used to write nix expressions
  - Nix: The package manager
  - Nixpkgs: The official Nix package repository
  - NixOs: Linux distribution based upon nix package manager

#include "nix-language.typ"

== Nix package manager
  Package manager that allows to build packages from recipies that are written in nix language.
  - Purly functional: Packages are defined as functions that describe:
      - What inputs (dependencies, source code, environment variables, ...) they need.
      - How to produce the outputs (the compiled package, runtime artifacts, ...)
  - Deterministic: The same inputs always produce the same output



== Nixpkgs
  - Repository containing:
    - Package recipies (>110.000 July 2024)
    - NixOs modules
    - Standard library

#focus-slide[
  Example!\
  derivation.nix
]

== Why another build tool?
=== Problem
  - Builds depend on the environment where they are executed
  - Issues arise when dependencies change, or systems are configured differently
  - System-wide package managers and shared libraries cause dependency hell
  - Different projects requiring conflicting versions of a dependency are hard to resolve

== Why another build tool?
=== Nix as solution
  - Explicit Dependencies: Dependencies are represented as direct acyclic graph (DAG) 
  - No global state: Dependencies are stored in isolated, versioned paths in `/nix/store`
  - Hash-based storage: Each package path is derived from a hash of all its inputs

#include "nix-store.typ"
#include "nixos.typ"
