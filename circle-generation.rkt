#lang racket

(require yaml)

(define (for-yaml d)
  (display (yaml->string d #:style 'block ))  ; #:scalar-style '#\|)) <-- every scalar, not just long strings!
 )

(for-yaml

; do not use #hash() here as it is only literal and will quote_everything_. And the literal DSL kinda sucks....
(hash
  "version" 2
  "orbs"   (hash "node" "circleci/node@5.0.1")
  "jobs" (hash
        "build" (hash
            "executor" "default"
            "steps" (list
               "checkout"
               (hash "run" (hash
                "name"    "echo"
                "command" (string-join '("echo \"hello\"" "uptime") "; ")
                 )
               )
             )
        )
   )
)
)