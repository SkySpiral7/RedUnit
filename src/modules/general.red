Red [
    Package: "RedUnit"
    Title: "General module"
    Description: "Public interface, to be used globally."
    Author: "Mateusz Palichleb"
    File: %general.red
]

; you should use that public interface to test your code
#include %internal.red

context [
    run: func [
        path[file!]
    ] [
        internal/require-path-exist path
        internal/clear-context

        internal/print-bordered-header "RedUnit v0.0.3"
        prin newline

        case [
            dir? path [ internal/run-dir path ]
            file? path [ internal/run-file path ]
        ]

        internal/print-summary

        comment {
            CLI exit code for continuous integration
            (0 - success, 1 - failure)
        }
        internal/quit-when-errors
    ]

    set-test-filename-prefix: func [
        text[string!]
    ] [
        prefix: text
    ]

    set-test-filename-postfix: func [
        text[string!]
    ] [
        postfix: text
    ]
]
