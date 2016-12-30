filter-pkg = $(call filter-testdata, $(call filter-testfiles,$(1)))
filter-testdata = $(filter-out testdata, $(1))
filter-testfiles = $(foreach v,$(1),$(if \
	$(findstring _test.go,$(v)),,$(v)))

pkgs := trace pprof/profile

pkg-trace := $(call filter-pkg,$(wildcard $(GOROOT)/src/internal/trace/*.go))
pkg-trace-targets := $(addprefix trace/, $(notdir $(pkg-trace)))
pkg-targets := $(pkg-trace-targets)

pkg-profile := $(call filter-pkg,$(wildcard $(GOROOT)/src/internal/pprof/profile/*.go))
pkg-profile-targets := $(addprefix pprof/profile/, $(notdir $(pkg-profile)))
pkg-targets += $(pkg-profile-targets)

all: $(pkgs) $(pkg-targets)
	$(info $(pkg-targets))

$(pkgs):
	mkdir -p $(pkgs)

$(pkg-trace-targets): $(pkg-trace)
	cp -a $(+) $(@D)

$(pkg-profile-targets): $(pkg-profile)
	cp -a $(+) $(@D)

.PHONY:
clean:
	rm -rf $(pkgs)
