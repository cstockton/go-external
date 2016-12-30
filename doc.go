// Package external makes source available from the Go standard libraries
// internal package. Based on my observations the API is more stable than most
// Go packages in the wild, add the fact it contains a lot of very useful code
// in pprof/profile and trace it's well worth losing the go1compat[1] promise
// for me.
//
// [1] https://golang.org/doc/go1compat
package external
