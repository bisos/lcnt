#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: siteSynergycManage.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/siteSynergyManage.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*      ################ CONTENTS-LIST ################
*      ======[[elisp:(org-cycle)][Fold]]====== *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*      ======[[elisp:(org-cycle)][Fold]]====== *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents 
**      ====[[elisp:(org-cycle)][Fold]]==== [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]]
*      ======[[elisp:(org-cycle)][Fold]]====== *[Module Description:]*
**      ====[[elisp:(org-cycle)][Fold]]==== SYNERGY MODEL:

_EOF_
}

_CommentBegin_
*      ################      *Seed Extensions*
_CommentEnd_

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Prefaces (Imports/Libraries)
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/bpo_lib.sh
. ${opBinBase}/bpoId_lib.sh

. ${opBinBase}/bxeDesc_lib.sh

. ${opBinBase}/bystarHook.libSh

. ${opBinBase}/bystarLib.sh

. ${opBinBase}/lcnFileParams.libSh

# . ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/platformBases_lib.sh

. ${opBinBase}/unisosAccounts_lib.sh
. ${opBinBase}/bisosGroupAccount_lib.sh
. ${opBinBase}/bisosAccounts_lib.sh

. ${opBinBase}/bxioCommon_lib.sh

. ${opBinBase}/bisosCurrents_lib.sh

. ${opBinBase}/site_lib.sh

. ${opBinBase}/l3_lib.sh
. ${opBinBase}/sysChar_lib.sh

. ${opBinBase}/siteNetworks_lib.sh

. ${opBinBase}/usgBpos_lib.sh


# PRE parameters

baseDir=""

function G_postParamHook {
     return 0
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Examples
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    local oneBpoId="pip_lcnt_bystarCommon"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Site Lcnt General Information" )
${G_myName} ${extraInfo} -i moduleDescription | emlVisit
$( examplesSeperatorChapter "Activate LCNT BPOs" )
${G_myName} -i lcntBposAvailable
${G_myName} -i lcntBposAvailable | bpoActivate.sh -i bpoActivate
$( examplesSeperatorChapter "Realize A New LCNT-BPO" )
bxieProvision.sh -h -v -n showRun -p privacy="priv" -p kind="info" -p type="project" -p parent="pip_bystar" -p name="lcnt_bystarOverview"  -i startToPrivRealize
$( examplesSeperatorChapter "LCNT Repos Manage" )
echo bpoReposManage.sh -h -v -n showRun -i repoCreateAndPushBasedOnPath .  # From new repos
${G_myName} ${extraInfo} -p bpoId="${oneBpoId}" -i repoBaseCreate_lcnt lgpc/permanent/bystar/
${G_myName} ${extraInfo} -p bpoId="${oneBpoId}" -i repoBasePush_lcnt
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Synergyc Start/Stop/Status/Logs
_CommentEnd_


function vis_lcntBposAvailable {
    G_funcEntry
    function describeF {  cat  << _EOF_
** Crude convention based model.
*** Should be revisited and made more specific.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpDo eval bxoGitlab.py -v 30 -i acctList  \| grep lcnt

}

function vis_repoBasePush_lcnt {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    local bpoHome=$( FN_absolutePathGet ~${bpoId} )
    local repoBase="${bpoHome}/lcnt"

    lpDo vis_repoCreateAndPushBasedOnPath "${repoBase}"

    lpReturn
}


function vis_repoBaseCreate_lcnt {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    local bpoHome=$( FN_absolutePathGet ~${bpoId} )
    local repoBase="${bpoHome}/lcnt"

    if [ ! -d "${repoBase}" ] ; then
        lpDo mkdir "${repoBase}"
    fi

    lpDo bx-gitRepos -h -v -n showRun -i baseUpdateDotIgnore "${repoBase}"

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local baseName=$1

        local basePath="${repoBase}/${baseName}"

        lpDo mkdir -p "${basePath}"
        if [ ! -f "${basePath}/readme.org" ] ; then
            lpDo touch "${basePath}/readme.org"
        fi
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:


    lpReturn 0
}



_CommentBegin_
*      ################      *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]======  /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
