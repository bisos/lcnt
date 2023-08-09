#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"


ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntExportLib.sh,v 1.10 2019-07-29 23:40:41 lsipusr Exp $"
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


# lcntMailingInfoDir="curMailing"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_exportsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_enabledExportsDirsList    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_exportExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mailingExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    extraInfo="-v -n showRun"

    cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName} :: Mailing Activity Groupings" )
$( examplesSeperatorChapter "curBuild/curExport Points To: -- Set it to:" )
$( ls -l ./curBuild )
$( ls -l ./LCNT-INFO/Releases/cur )
$( examplesSeperatorChapter "Running lcntBuild And View And Release" )
${G_myName} ${extraInfo} -p extent="build+view" -i lcntBuild cur          # Runs dblock
$( examplesSeperatorChapter "Mailing Info" )
${G_myName} ${extraInfo} -i lcntMailingInfoReport
$( examplesSeperatorChapter "Initial Setups" )
${G_myName} ${extraInfo} -i mailingContentGen
${G_myName} ${extraInfo} -f -i mailingContentGen
$( examplesSeperatorChapter "Body Parts Refresh" )
${G_myName} ${extraInfo} -i mailingBodyPartsRefresh
${G_myName} ${extraInfo} -p pdf=pdf -i mailingBodyPartsRefresh
$( examplesSeperatorChapter "Build+Release+BodyPartsRefresh " )
${G_myName} ${extraInfo} -i resultsRelease
${G_myName} ${extraInfo} -i buildResultsRelease
_EOF_

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntExportInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntMailingInfoReport {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    echo "lcntBuild_mailingFile=${lcntBuild_mailingFile}"
}

function vis_mailingContentGen {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    if [ -z  "${lcntBuild_mailingFile}" ] ; then
        lpReturn 101
    fi

    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${lcntBuild_mailingFile}-${dateTag}


    if [ -f "${lcntBuild_mailingFile}" ] ; then
        if [[ "${G_forceMode}_" == "force_" ]] ; then
            lpDo mv ${lcntBuild_mailingFile} ${savedMailingFileName}
        else
            EH_problem "${lcntBuild_mailingFile} exists and forceMode not specified -- not overriding it."
            lpReturn 102
        fi
    fi

    ANT_raw "Creating ${lcntBuild_mailingFile} ..."

    local thisLcntNu=$( cat ${lcntInfoPath}/lcntNu )
    local buildName=${lcntBuild_buildName}
    local thisMailingName=${thisLcntNu}-${lcntBuild_buildName}

    cat  << _EOF_ > ${lcntBuild_mailingFile}
From: fromMailAddrLineComesHere
Subject: SubjLine Comes Here
Bcc: bccMailAddrLineComesHere
X-Envelope: envelopeMailAddrLineComesHere
X-MailingName:  ${thisMailingName}
X-MailingDoc: ${thisMailingName}
X-MailingParams: :type originate :extSrcBase "."
--text follows this line--

_EOF_


}


function vis_mailingBodyPartsRefresh {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    if [ -z  "${lcntBuild_mailingFile}" ] ; then
        lpReturn 101
    fi

    local mailingFileName="${lcntBuild_mailingFile}"

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing ${mailingFileName}"
        lpReturn 101
    fi

    local mailingDoc=$( vis_mailingDoc )
    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${mailingFileName}.${dateTag}

    lpDo mv ${mailingFileName} ${savedMailingFileName}

    lpDo eval "sed '/--text follows this line--/q' ${savedMailingFileName} > ${mailingFileName}"

    lpDo rm ${savedMailingFileName}

    cat  << _EOF_ >> ${mailingFileName}
<#part type="text/html" disposition=inline>
<!--  [[elisp:(find-file "./mailing.ttytex")][Visit ./mailing.ttytex]]  -->
<!-- ####+BEGIN: bx:dblock:global:file-insert-process :file "./rel/mailing-html/index.html" :load "./dblockProcess.el" :exec "bx:dblock:body-process"
-->
<!-- ####+END: -->
<#/part>
_EOF_

    if [ "${pdf}" == "pdf" ] ; then
	cat  << _EOF_ >> ${mailingFileName}
<#part type="application/pdf" filename="./rel/${mailingDoc}.pdf" disposition=attachment description="Pdf File">
<#/part>
_EOF_
    fi

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
