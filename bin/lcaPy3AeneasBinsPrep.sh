#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaPythonCommonBinsPrep.sh,v 1.3 2016-08-15 18:51:34 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/bsip4/bin/lcaPythonCommonBinsPrep.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@"
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*      ================ CONTENTS-LIST ================
*      ================ *[Info]* General TODO List
_CommentEnd_
function vis_describe {  cat  << _EOF_
**     ============ Essential Features TODO
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Pkgs-List]   :: Components List [[elisp:(org-cycle)][| ]]
_CommentEnd_

#apt-cache search something | egrep '^something'



function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search something | egrep '^something'")][apt-cache search something | egrep '^something']]

    itemOrderedList=(
        "espeak"
        "espeak_data"
        "libespeak1"
        "libespeak_dev"
        "festival*"
        "flac"
        "libasound2_dev"
        "libsndfile1_dev"
        "vorbis_tools"
        "libxml2_dev"
        "libxslt_dev"
        "zlib1g_dev"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()

    itemPy3Bisos3PipOrderedList=(
        "pipx"
        "unisos.gcipher"       #
        "yolk3k"               # Did not work with pipx
        # "twine"                #
    )

    itemPipxOrderedList=(
        "twine"       # for pypi uploading
        "pipreqs"     # for requirements creation
        "johnnydep"    # dependency tree
        "pipdeptree"  # dependency tree
        # See github.com/hlissner/doom-emacs/blob/develop/modules/lang/python/README.org
        "pytest"      # Used by blee and doom
        "nose"        # Used by blee and doom
        "black"       # Used by blee and doom
        "isort"       # Used by blee and doom
        #
        "mypy"        # Used in python mode
        "pylint"      # Used in python mode
        "flake8"      # Used in python mode
        "pyflakes"
        "pep8"
    )
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
${G_myName} ${extraInfo} -i repositoryAdd
_EOF_
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [ExamplesExt] :: Module Specific Additions [[elisp:(org-cycle)][| ]]
_CommentEnd_


function examplesHookPost%% {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i pipInstallCommon
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [PyPi]        :: pipInstallCommon [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pipInstallCommon {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo chgrp employee /usr/local/lib/python2.7/dist-packages
    # ;; ;; Jedi settings  -- Goes with Blee setup
    opDo pip install jedi
    #opDo pip install --user jedi
    opDo pip install epc
    #opDo pip install --user epc
    #
    opDo pip install --upgrade  lxml         # ubuntu's is not good enough for openpyxl

    opDo pip install gprof2dot                # For Profiler Graphing
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [PyPi]        :: pipInstallOpenpyxl [[elisp:(org-cycle)][| ]]
_CommentEnd_



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "espeak"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: espeak [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_espeak () { distFamilyGenerationHookRun binsPrep_espeak; }

binsPrep_espeak_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "espeak"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "espeak-data"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: espeak-data [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_espeak_data () { distFamilyGenerationHookRun binsPrep_espeak_data; }

binsPrep_espeak_data_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "espeak-data"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libespeak1"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libespeak1 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libespeak1 () { distFamilyGenerationHookRun binsPrep_libespeak1; }

binsPrep_libespeak1_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libespeak1"; }

####+END:



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libespeak-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libespeak-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libespeak_dev () { distFamilyGenerationHookRun binsPrep_libespeak_dev; }

binsPrep_libespeak_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libespeak-dev"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "festival*"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: festival* [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_festival* () { distFamilyGenerationHookRun binsPrep_festival*; }

binsPrep_festival*_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "festival*"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "flac"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: flac [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_flac () { distFamilyGenerationHookRun binsPrep_flac; }

binsPrep_flac_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "flac"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libasound2-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libasound2-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libasound2_dev () { distFamilyGenerationHookRun binsPrep_libasound2_dev; }

binsPrep_libasound2_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libasound2-dev"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libsndfile1-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libsndfile1-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libsndfile1_dev () { distFamilyGenerationHookRun binsPrep_libsndfile1_dev; }

binsPrep_libsndfile1_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libsndfile1-dev"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "vorbis-tools"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: vorbis-tools [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_vorbis_tools () { distFamilyGenerationHookRun binsPrep_vorbis_tools; }

binsPrep_vorbis_tools_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "vorbis-tools"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libxml2-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libxml2-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libxml2_dev () { distFamilyGenerationHookRun binsPrep_libxml2_dev; }

binsPrep_libxml2_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libxml2-dev"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libxslt-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libxslt-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libxslt_dev () { distFamilyGenerationHookRun binsPrep_libxslt_dev; }

binsPrep_libxslt_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libxslt-dev"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "zlib1g-dev"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: zlib1g-dev [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_zlib1g_dev () { distFamilyGenerationHookRun binsPrep_zlib1g_dev; }

binsPrep_zlib1g_dev_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "zlib1g-dev"; }

####+END:


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: py3Bisos3 pip installs
_CommentEnd_

vis_py3Bisos3PipInstalls () {
    ANT_raw "Here we process py3Bisos3PipInstalls one by one."
    local each
    for each in ${itemPy3Bisos3PipOrderedList[@]} ; do
        lpDo sudo -u bisos /bisos/bsip/bin/bisosPyVenvSetup.sh -h -v -n showRun -f -i venvDo py3 reInstall "${each}"
    done
    print
}


item_py3Bisos3PipInstalls () {
  distFamilyGenerationHookRun binsPrep_py3Bisos3PipInstalls
}

binsPrep_py3Bisos3PipInstalls_DEFAULT_DEFAULT () {
    mmaThisPkgName="py3Bisos3PipInstalls"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_py3Bisos3PipInstalls
    }
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: pipx installs
_CommentEnd_

vis_pipxInstalls () {
    ANT_raw "Here we process pipxInstalls one by one."
    #lpDo sudo -u bisos id
    local each
    for each in ${itemPipxOrderedList[@]} ; do
        lpDo sudo -u bisos env PIPX_HOME=/bisos/pipx PIPX_BIN_DIR=/bisos/pipx/bin /bisos/venv/py3/bisos3/bin/pipx install "${each}"
    done
}

item_pipxInstalls () {
  distFamilyGenerationHookRun binsPrep_pipxInstalls
}

binsPrep_pipxInstalls_DEFAULT_DEFAULT () {
    mmaThisPkgName="pipxInstalls"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_pipxInstalls
        lpReturn
    }
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

