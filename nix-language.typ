#import "/globals.typ": *

== Nix language
  #slide[
  Nix is a ...
  - declarative
  - purely functional
  - lazily evaluated
  - dynamically typed
  ... programming language
  ][
  ```nix
  {
    string = "foo";
    integer = 1;
    float = 3.141;
    bool = true;
    null = null;
    list = [ 1 "two" false ];
    attribute-set = { 
      a = "bar";
    };
  }

  ```
  ]

  // Functional: Functions can be passed as function arguments, and returned as results\
  // Pure: Functions can not cause side effects. The only result is the one a function returns\
  // Lazy: Functions and data collections are not evaluated until they are needed to complete a computation\
  // Declarative: Describing a system outcome, instead of instructing the computer how to achieve the outcome\
  // Reproducible: An operation that is performed twice yields the same result. The same inputs map to the same outputs\

