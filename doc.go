// Package external makes source available from the Go standard libraries
// internal package. It contains a lot of very useful code in pprof/profile and
// trace it's well worth losing the go1compat[1] promise for me. I don't suggest
// using this package, copy the makefile and pick out the internals you want.
//
// [1] https://golang.org/doc/go1compat
package external
