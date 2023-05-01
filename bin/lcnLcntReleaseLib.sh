#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"


ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntBuildLib.sh,v 1.10 2019-11-21 08:13:58 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntBuilds/fullUsagePanel-en.org::Xref-][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
** TODO New Fields To Be Added -- lcntName  articleForm
   SCHEDULED: <2019-07-18 Thu>
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

# . ${opBinBase}/opAcctLib.sh
# . ${opBinBase}/opDoAtAsLib.sh
# . ${opBinBase}/lpParams.libSh
# . ${opBinBase}/lpReRunAs.libSh

# . ${opBinBase}/lcnObjectTree.libSh
# . ${opBinBase}/lcnLcntLib.sh

lcntReleaseInfoDir="./LCNT-INFO/Release/cur"


lcntReleaseInfoFilesList=(
    "relTag"
    "versionNu"
)


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_buildsDirs
List    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_releasesDirsList {
    EH_assert [[ $# -eq 0 ]]
    find ./LCNT-INFO/Releases/ -type d -print | egrep -v './LCNT-INFO/Releases/$' | grep -v CVS | sort
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntReleaseInfoGens    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntReleaseInfoGens {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
lcntModels:: oneOf: article, pres, pres+presArt, presArt, article+pres+presArt
articleForm:: oneOf: article, book, artBook (Parts become Chapters)
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lcntInfoPrep ${cntntRawHome}
    lcntPathAnalyze ${cntntRawHome}
    
    local lcntInfoPath="./${lcntInfoDir}"

    local lcntReleaseCommonInfoBasePath="${lcntInfoPath}/Releases"

    if [ ! -d "${lcntReleaseCommonInfoBasePath}" ] ; then
        opDo mkdir "${lcntReleaseCommonInfoBasePath}"
    fi


    function fvNameValueCommonSet {
        EH_assert [[ $# -eq 2 ]]
        local fvName=$1
        local fvValue=$2
        local fvNamePath="${lcntReleaseCommonInfoBasePath}/${fvName}"
        
        if [[ ! -s "${fvNamePath}" ]]; then
            echo "${fvValue}" > "${fvNamePath}"
        else
            ANT_cooked "Exists"
        fi
    }

    function fvNameValueSpecificSet {
        EH_assert [[ $# -eq 3 ]]
        local releaseDirPath=$1
        local fvName=$2
        local fvValue=$3
        local fvNamePath="${releaseDirPath}/${fvName}"
        
        if [[ ! -s "${fvNamePath}" ]]; then
            echo "${fvValue}" > "${fvNamePath}"
        else
            ANT_cooked "Exists"
        fi
    }

    function rel0_1 {
        EH_assert [[ $# -eq 0 ]]

        local relName="0.1"
        local releaseDirPath="${lcntReleaseCommonInfoBasePath}/${relName}"

        if [ ! -d "${releaseDirPath}" ] ; then
            opDo mkdir "${releaseDirPath}"
        fi

        lpDo fvNameValueSpecificSet ${releaseDirPath} "relTag" "${relName}"
        lpDo fvNameValueSpecificSet ${releaseDirPath} "versionNu" "${relName}"

        lpDo ln -s ${relName} ${lcntReleaseCommonInfoBasePath}/cur
    }

    lpDo rel0_1

    lpReturn
}       



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  lcntReleaseInfoPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntReleaseInfoPrep {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local fvsBaseDir="$1"
    local lcntReleaseInfoPath="./LCNT-INFO/Releases/${fvsBaseDir}"

    if [ ! -d "${lcntReleaseInfoPath}" ] ; then
        EH_problem "Missing --- ${lcntReleaseInfoPath}"
    fi

    if [ -f "${lcntReleaseInfoPath}/relTag" ] ; then
        lcntBuild_relTag=$( head -1 "${lcntReleaseInfoPath}/relTag" )
    else
        lcntBuild_relTag=""
    fi

    if [ -f "${lcntReleaseInfoPath}/versionNu" ] ; then
        lcntBuild_versionNu=$( head -1 "${lcntReleaseInfoPath}/versionNu" )
    else
        lcntBuild_versionNu=""
    fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  lcntInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function lcntInfoReport {

  echo "lcntInfoDir=${lcntInfoDir}"


}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

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
