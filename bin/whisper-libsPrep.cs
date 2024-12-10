#!/usr/bin/env python

####+BEGIN: b:prog:file/particulars :authors ("./inserts/authors-mb.org")
""" #+begin_org
* *[[elisp:(org-cycle)][| Particulars |]]* :: Authors, version
** This File: /bisos/core/lcnt/bin/subed-binsPrep.cs
** Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
#+end_org """
####+END:

""" #+begin_org
* Panel::  [[file:/bisos/panels/bisos-apps/lcnt/lcntScreencasting/subTitles/_nodeBase_/fullUsagePanel-en.org]]
* Overview and Relevant Pointers
* https://github.com/openai/whisper
#+end_org """

from bisos.binsprep import binsprep
ap = binsprep.aptPkg
pp = binsprep.pipPkg

aptPkgsList = [
    ap("ffmpeg"),               # used by whisper
]

pipPkgsList = [
    pp("openai-whisper"),
]

pipxPkgsList = [
    # pp("openai-whisper"),
]


binsprep.setup(
    aptPkgsList=aptPkgsList,
    pipPkgsList=pipPkgsList,
    pipxPkgsList=pipxPkgsList,
    # examplesHook=qmail_binsPrep.examples_csu,
)


####+BEGIN: b:py3:cs:seed/binsprep :origin "pipx"
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  seed       [[elisp:(outline-show-subtree+toggle)][||]] <<pipx>>   [[elisp:(org-cycle)][| ]]
#+end_org """

__file__ = '/bisos/git/bxRepos/bisos-pip/binsprep/py3/bin/seedBinsPrep.cs'
with open(__file__) as f:
    exec(compile(f.read(), __file__, 'exec'))

####+END:
