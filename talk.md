---
title: Nix/NixOs
sub_title: A Yocto alternative?
author: Guillaume Fournier
---

Nix overview
===
  * Developed by Eleco Dolstra in 2004 as PhD research
  * Functional programming language
  * Package manager
  * Reproducible development environemts 
  * Explicit graph dependecies


<!-- end_slide -->

Nix package manager
===
Functional package manager that allows to build packages from recipies that are written in nix language.
  * Packages are defined as functions that describe:
    * Inputs (dependencies, source code, environment variables, ...)
    * How to produce outputs (Build instructions, ...)
  * Deterministic: The same inputs always produce the same output
  * Declarative: Packages that should be build will be listed in .nix files

<!-- end_slide -->

Nix language
===
  * declarative, purely functional, lazily evaluated, dynamically typed programming language

Nixpkgs
===
  * more then 110.000 packages (July 2024)

<!-- end_slide -->

Derivation
===

<!-- end_slide -->

Nix store
===
  The nix store forms a directed acyclic graph (DAG) and can be seen as an graph database
  <!-- column_layout: [3, 2] -->
  <!-- column: 0 -->

  * /nix/store -> Graph
  * /nix/store/* -> immutable Nodes
  * Reference to a node forms an edge

  <!-- pause -->
  /nix/store/5d8gysj9z6xaqidxcxjdkckli6kk0vpp-`rustc-1.80.1`  
  Each node has a name.  

  /nix/store/`5d8gysj9z6xaqidxcxjdkckli6kk0vpp`-rustc-1.80.1  
  Each node has a hash.  
  For a given hash, the contents of that path will alway be indentical. Even across machines, plattforms, etc.

  The files inside this directory cant be modified after its been created!

  ![image:width:50%](nix-store-graph.png)

<!-- end_slide -->

  ```
  nix-store --query /nix/store/5d8gysj9z6xaqidxcxjdkckli6kk0vpp-rustc-1.80.1 --references

  /nix/store/5adwdl39g3k9a2j0qadvirnliv4r7pwd-glibc-2.39-52
  /nix/store/jfilhsiqdgm4nks2z6labx3iq9qd077a-gcc-13.3.0-lib
  /nix/store/35mrxhx9vwf3ms734xydxfrh3d84d9fn-llvm-18.1.8-lib
  /nix/store/4bj2kxdm1462fzcc2i2s4dn33g2angcc-bash-5.2p32
  /nix/store/5d8gysj9z6xaqidxcxjdkckli6kk0vpp-rustc-1.80.1
  ```
