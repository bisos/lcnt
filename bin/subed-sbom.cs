#!/usr/bin/env python

from bisos.sbom import pkgsSeed  # pkgsSeed.plantWithWhich("seedSbom.cs")
ap = pkgsSeed.aptPkg
pp = pkgsSeed.pipPkg

aptPkgsList = [
    ap("espeak"),               # used by aeneas
    ap("libespeak-dev"),        # used by aeneas
    ap("mpv"),                  # used by subed.el
    ap("wdiff"),                  # used by subed.el
    # ap("", instFn=someFunc),
]

pipPkgsList = [
    pp("numpy"),                # used by aeneas
    pp("aeneas"),
]

pipxPkgsList = [
    # pp("bisos.marmee"),
]

pkgsSeed.setup(
    aptPkgsList=aptPkgsList,
    pipPkgsList=pipPkgsList,
    pipxPkgsList=pipxPkgsList,
    # examplesHook=qmail_binsPrep.examples_csu,
)
