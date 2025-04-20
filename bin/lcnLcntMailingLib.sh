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

pdf=""
headerFile=""


mailingDefaultsBaseEn="/bisos/apps/defaults/mailing/compose/enFa/lcntMailing"
mailingDefaultsBaseFa="/bisos/apps/defaults/mailing/compose/faEn/lcntMailing"
selectedComposeBase="$( echo ~/bpos/usageEnv/selected/mailings/compose )"
#selectedAasMarmeeHeaders="$( echo ~/bpos/usageEnvs/selected/aas/marmee/selected/control/outMail/headers.mail )"
selectedAasMarmeeHeaders="$( echo ~/bpos/usageEnvs/selected/mailings/templates/marmee/selected/headers.mail )"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_exportExamples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_mailingExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"

    typeset curBuildEndLink=$( FN_nonDirsPart $(  FN_absolutePathGet ./curBuild ))
    typeset curReleaseEndLink=$( FN_nonDirsPart $(  FN_absolutePathGet ./LCNT-INFO/Releases/cur ))
    typeset curExportEndLink=$( FN_nonDirsPart $(  FN_absolutePathGet ./curExport ))

    opDo lcntBuildInfoPrep curBuild

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
${G_myName} ${extraInfo}  -p cntntRawHome=. -i buildNameFvUpdate auto mailing  # Sets ALL Builds/mailing s to baseDir
${G_myName} ${extraInfo} -f -i mailingAsBuildName  # Sets curBuild/mailings to arg1 (defaults to baseDir)
$( examplesSeperatorSection "Generate Mailing File = mailingHeaderGen + mailingBodyPartsRefresh + mailingsDblockUpdate" )
${G_myName} ${extraInfo} -p pdf=pdf -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGen
${G_myName} ${extraInfo} -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGen
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGenEnabled
$( examplesSeperatorSection "Mailing Headers -- Used by mailingFileGen" )
${G_myName} ${extraInfo} -i mailingHeaderGen curBuild # curBuild is default, specify other lcntBuildInfoPath
${G_myName} ${extraInfo} -f -i mailingHeaderGen
${G_myName} ${extraInfo} -p headerFile=${selectedAasMarmeeHeaders} -i mailingHeaderGen
$( examplesSeperatorSection "Body Parts Refresh" )
${G_myName} ${extraInfo} -i mailingBodyPartsRefresh  # Creates appropriate empty dblock for html content + perhaps pdf attachement
${G_myName} ${extraInfo} -p pdf=pdf -i mailingBodyPartsRefresh # Creates appropriate empty dblock for html content + perhaps pdf attachement
$( examplesSeperatorChapter "Mailing --- curBuild=${curBuildEndLink} curRelease=${curReleaseEndLink} mailing=${lcntBuild_mailingFile}" )
${G_myName} ${extraInfo} -p cntntRawHome=. -i buildEnabledMailingsSet mailings
${G_myName} ${extraInfo} -p cntntRawHome=.-i buildEnabledMailingsSet mailings+
cat "./LCNT-INFO/Builds/enabledList"
cat "./LCNT-INFO/Builds/enabledMailings"
${G_myName} ${extraInfo} -p pre="clean" -p extent="build+view" -i lcntBuild cur  # Runs dblock
${G_myName} ${extraInfo} -p extent="mailingPrep" -i lcntBuild cur
${G_myName} ${extraInfo} -p extent="compose" -i lcntBuild cur
${G_myName} ${extraInfo} -p extent="extCompose" -i lcntBuild cur
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="mailingPrep" -i lcntBuild all  # Using enabled list
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="compose" -i lcntBuild all  # Using enabled list
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="build+view+release+compose" -i lcntBuild all  # Using enabled list
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="build+view+release" -i lcntBuild all  # Using enabled list
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="build+view+release+mailingPrep" -i lcntBuild all  # Using enabled list
_EOF_

    vis_mailingFullPrepExamples

    vis_mailingComposeExamples

    lpReturn
}


function vis_mailingFullPrepExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName=$( vis_hereMailFilesList |  tr " " "\n" | head -1 )
    [[ -z "${mailingFileName}" ]] && mailingFileName="mailing.orgMsg"

    cat  << _EOF_
$( examplesSeperatorSection "Mailing Full Prep --- " )
${G_myName} ${extraInfo} -p cntntRawHome=. -i mailingFullPrep  # mailingName=$( basename $(pwd) )
${G_myName} ${extraInfo}  -p cntntRawHome=. -i mailingFullPrep $( basename $(pwd) )
_EOF_

    lpReturn
}


function vis_mailingOrgMsgExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName="mailing.orgMsg"
    local mailingName="mailingName"
    local dateTag=$( date +%y%m%d%H%M%S )

    cat  << _EOF_
$( examplesSeperatorChapter "Generate OrgMsg Mailing File = marmeeHeaders + mailingHeaderGen + mailingBodyParts" )
${G_myName} ${extraInfo} -i mailingOrgMsgGen ${mailingName} ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingOrgMsgGen ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingOrgMsgGenRtl ${dateTag}.orgMsg
_EOF_

    lpReturn
}

function vis_mailingComposeExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName=$( vis_hereMailFilesList |  tr " " "\n" | head -1 )
    [[ -z "${mailingFileName}" ]] && mailingFileName="mailing.orgMsg"

    cat  << _EOF_
$( examplesSeperatorSection "Mailing Invocation (.orgMsg and .mail) -- compose/extCompose" )
${G_myName} ${extraInfo} -i hereMailFilesList
${G_myName} ${extraInfo} -i hereMailFilesComposeOffer # $(vis_hereMailFilesList)
${G_myName} ${extraInfo} -i withMailFilesCompose ${mailingFileName}
${G_myName} ${extraInfo} -i withMailFilesOrignate ${mailingFileName}
${G_myName} ${extraInfo} -i mtdtSelectMailing ${mailingFileName}
_EOF_

    lpReturn
}


function vis_mailingFullPrep {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local argMailingName=$(basename $(pwd))

    if [ $# -eq 1 ] ; then
        argMailingName="$1"
    fi

    lpDo vis_buildNameFvUpdate ${argMailingName} mailing
    lpDo vis_buildEnabledMailingsSet mailings
    lpDo vis_mailingAsBuildName # ${argMailingName}

    lpDo lcntProc.sh -v -n showRun -p enabled="./LCNT-INFO/Builds/enabledMailings" -p extent="build+view+release" -i lcntBuild all  # Using enabled list

    lpDo vis_mailingAsBuildName # ${argMailingName}

    lpDo lcntProc.sh -v -n showRun  -p pdf=pdf -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGen
}


function mailingOrgMsgGenCommon {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 4  ]]

    local argCaller="$1"
    local argMailingFile="$2"
    local argMailingName=$( FN_prefix $(basename "${argMailingFile}") )

    if [ $# -eq 3 ] ; then
        argMailingName="$3"
    fi

    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${argMailingFile}-${dateTag}

    if [ -f "${argMailingFile}" ] ; then
        if [[ "${G_forceMode}_" == "force_" ]] ; then
            lpDo mv ${argMailingFile} ${savedMailingFileName}
        else
            EH_problem "${argMailingFile} exists and forceMode not specified -- not overriding it."
            lpReturn 102
        fi
    fi

    if [ ! -f "${headerFile}" ] ; then
        EH_problem "Missing headerFile=${headerFile}"
        lpReturn 103
    fi

    ANT_raw "Creating ${argMailingFile} ..."

    lpDo eval cat "${headerFile}" \> "${argMailingFile}"

    cat  << _EOF_ >> ${argMailingFile}
Subject: NO SUBJECT
X-MailingName: ${argMailingName}
X-MailingDoc: nil
X-MailingParams: :compose native :extSrcBase nil
X-ComposeFwrk: orgMsg
X-MailingPurpose: Mailing
--text follows this line--
#+OPTIONS: html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \n:t d:nil
#+STARTUP: hidestars indent inlineimages
:PROPERTIES:
:reply-to: nil
:attachment: nil
:alternatives: (text html)
:END:

#+BEGIN: bx:mtdt:content/actions
#+BEGIN_COMMENT
  [[elisp:(call-interactively 'org-msg-preview)][Browser Preview]] | [[elisp:(message-mode)][message-mode]] | [[elisp:(mtdt:setup-and-compose/with-curBuffer)][Compose]] | [[elisp:(mtdt:setup-and-extCompose/with-curBuffer)][ExtCompose]]
#+END_COMMENT
#+END:

_EOF_

    if [ "${argCaller}" == "vis_mailingOrgMsgGenRtl" ] ; then
        cat  << _EOF_ >> ${argMailingFile}
#+BEGIN_EXPORT html
<DIV dir="rtl">
#+END_EXPORT

سلام،

امیدوارم خوب و خوش باشید.


#+BEGIN_EXPORT html
</DIV>
#+END_EXPORT

_EOF_
    fi

    lpDo ls -l "${argMailingFile}"
}

function vis_mailingOrgMsgGen {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingOrgMsgGenCommon ${G_thisFunc} $@
}

function vis_mailingOrgMsgGenRtl {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingOrgMsgGenCommon ${G_thisFunc} $@
}


function vis_mailingHtmlExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName="mailing-html.mail"
    local mailingName="mailingName"
    local dateTag=$( date +%y%m%d%H%M%S )

    cat  << _EOF_
$( examplesSeperatorChapter "Generate Html Mailing File = marmeeHeaders + mailingHeaderGen + mailingBodyParts" )
${G_myName} ${extraInfo} -i mailingHtmlGen ${mailingName} ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingHtmlGen ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingHtmlGenRtl ${dateTag}.orgMsg
_EOF_

    lpReturn
}


function mailingHtmlGenCommon {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 4  ]]

    local argCaller="$1"
    local argMailingFile="$2"
    local argMailingName=$( FN_prefix $(basename "${argMailingFile}") )

    if [ $# -eq 3 ] ; then
        argMailingName="$3"
    fi

    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${argMailingFile}-${dateTag}

    if [ -f "${argMailingFile}" ] ; then
        if [[ "${G_forceMode}_" == "force_" ]] ; then
            lpDo mv ${argMailingFile} ${savedMailingFileName}
        else
            EH_problem "${argMailingFile} exists and forceMode not specified -- not overriding it."
            lpReturn 102
        fi
    fi

    if [ ! -f "${headerFile}" ] ; then
        EH_problem "Missing headerFile=${headerFile}"
        lpReturn 103
    fi

    ANT_raw "Creating ${argMailingFile} ..."

    lpDo eval cat "${headerFile}" \> "${argMailingFile}"

    cat  << _EOF_ >> ${argMailingFile}
Subject: NO SUBJECT
X-MailingName: ${argMailingName}
X-MailingDoc: nil
X-MailingParams: :compose native :extSrcBase nil
X-ComposeFwrk: orgMsg
X-MailingPurpose: Mailing
--text follows this line--
#+OPTIONS: html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \n:t d:nil
#+STARTUP: hidestars indent inlineimages
:PROPERTIES:
:reply-to: nil
:attachment: nil
:alternatives: (text html)
:END:

#+BEGIN: bx:mtdt:content/actions
#+BEGIN_COMMENT
  [[elisp:(call-interactively 'org-msg-preview)][Browser Preview]] | [[elisp:(message-mode)][message-mode]] | [[elisp:(b:mtdt:setup-and-compose/with-curBuffer)][Compose]] | [[elisp:(b:mtdt:setup-and-extCompose/with-curBuffer)][ExtCompose]]
#+END_COMMENT
#+END:

_EOF_

    if [ "${argCaller}" == "vis_mailingOrgMsgGenRtl" ] ; then
        cat  << _EOF_ >> ${argMailingFile}
#+BEGIN_EXPORT html
<DIV dir="rtl">
#+END_EXPORT

سلام،

امیدوارم خوب و خوش باشید.


#+BEGIN_EXPORT html
</DIV>
#+END_EXPORT

_EOF_
    fi

    lpDo ls -l "${argMailingFile}"
}

function vis_mailingHtmlGen {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingHtmlGenCommon ${G_thisFunc} $@
}

function vis_mailingHtmlGenRtl {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingOrgMsgGenCommon ${G_thisFunc} $@
}


function vis_mailingTextExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName="mailing-text.mail"
    local mailingName="mailingName"
    local dateTag=$( date +%y%m%d%H%M%S )

    cat  << _EOF_
$( examplesSeperatorChapter "Generate Text Mailing File = marmeeHeaders + mailingHeaderGen + mailingBodyParts" )
${G_myName} ${extraInfo} -i mailingTextGen ${mailingName} ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingTextGen ${mailingFileName}
${G_myName} ${extraInfo} -f -p headerFile=${selectedAasMarmeeHeaders} -i mailingTextGenRtl ${dateTag}.mail
_EOF_

    lpReturn
}


function mailingTextGenCommon {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 4  ]]

    local argCaller="$1"
    local argMailingFile="$2"
    local argMailingName=$( FN_prefix $(basename "${argMailingFile}") )

    if [ $# -eq 3 ] ; then
        argMailingName="$3"
    fi

    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${argMailingFile}-${dateTag}

    if [ -f "${argMailingFile}" ] ; then
        if [[ "${G_forceMode}_" == "force_" ]] ; then
            lpDo mv ${argMailingFile} ${savedMailingFileName}
        else
            EH_problem "${argMailingFile} exists and forceMode not specified -- not overriding it."
            lpReturn 102
        fi
    fi

    if [ ! -f "${headerFile}" ] ; then
        EH_problem "Missing headerFile=${headerFile}"
        lpReturn 103
    fi

    ANT_raw "Creating ${argMailingFile} ..."

    lpDo eval cat "${headerFile}" \> "${argMailingFile}"

    cat  << _EOF_ >> ${argMailingFile}
Subject: NO SUBJECT
X-MailingName: ${argMailingName}
X-MailingDoc: nil
X-MailingParams: :compose native :extSrcBase nil
X-ComposeFwrk: orgMsg
X-MailingPurpose: Mailing
--text follows this line--
#+OPTIONS: html-postamble:nil H:5 num:nil ^:{} toc:nil author:nil email:nil \n:t d:nil
#+STARTUP: hidestars indent inlineimages
:PROPERTIES:
:reply-to: nil
:attachment: nil
:alternatives: (text html)
:END:

#+BEGIN: bx:mtdt:content/actions
#+BEGIN_COMMENT
  [[elisp:(call-interactively 'org-msg-preview)][Browser Preview]] | [[elisp:(message-mode)][message-mode]] | [[elisp:(b:mtdt:setup-and-compose/with-curBuffer)][Compose]] | [[elisp:(b:mtdt:setup-and-extCompose/with-curBuffer)][ExtCompose]]
#+END_COMMENT
#+END:

_EOF_

    if [ "${argCaller}" == "vis_mailingOrgMsgGenRtl" ] ; then
        cat  << _EOF_ >> ${argMailingFile}
#+BEGIN_EXPORT html
<DIV dir="rtl">
#+END_EXPORT

سلام،

امیدوارم خوب و خوش باشید.


#+BEGIN_EXPORT html
</DIV>
#+END_EXPORT

_EOF_
    fi

    lpDo ls -l "${argMailingFile}"
}

function vis_mailingTextGen {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingTextGenCommon ${G_thisFunc} $@
}

function vis_mailingTextGenRtl {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3  ]]

    lpDo mailingTextGenCommon ${G_thisFunc} $@
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_lcntExportInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIF            :: vis_composeStart |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_mailingStartLcntExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    local extraInfo="-v -n showRun"
    local mailingFileName="mailing-text.mail"
    local mailingName="mailingName"
    local dateTag=$( date +%y%m%d%H%M%S )
    local selectedComposeBase="~/bpos/usageEnv/selected/mailings/compose"

    cat  << _EOF_
$( examplesSeperatorChapter "startMailingLcnt -- LaTeX-Static Mailings Starting Point Generator" )
$( examplesSeperatorSection "LaTeX-Mailing Start -- With Default Parameters" )
${G_myName} ${extraInfo} -i composeStart                         # Creates Dir -- Mailing Name Will Be Date Tagged
${G_myName} ${extraInfo} -i composeStart dated                   # Creates Dir -- Mailing Name Will Be Date Tagged
${G_myName} ${extraInfo} -p pdf=pdf -i composeStart dated        # RUN THIS (Commonly)
${G_myName} ${extraInfo} -i composeStart mailingName ""          # Creates Dir -- mailingName is specified
${G_myName} ${extraInfo} -p base=. -i composeStart mailingName ""       # mailingName is specified
$( examplesSeperatorSection "LaTeX-Mailing Start Globish -- EnFa -- With Specified Parameters" )
${G_myName} ${extraInfo} -p base=${selectedComposeBase} -p template="${mailingDefaultsBaseEn}" -p header="${selectedAasMarmeeHeaders}" -i composeStart mailingName
${G_myName} ${extraInfo} -p base=${selectedComposeBase} -p template="${mailingDefaultsBaseEn}" -i composeStart mailingName ""
${G_myName} ${extraInfo} -p pdf=pdf -p base=. -p template="${mailingDefaultsBaseEn}" -i composeStart basicLaTeX pdf
${G_myName} ${extraInfo} -p base=. -p template="${mailingDefaultsBaseEn}" -i composeStart basicLaTeX ""
$( examplesSeperatorSection "LaTeX-Mailing Start Farsi -- FaEn -- With Specified Parameters" )
${G_myName} ${extraInfo} -p base=${selectedComposeBase} -p template="${mailingDefaultsBaseFa}" -i composeStart mailingName
${G_myName} ${extraInfo} -p base=${selectedComposeBase} -p template="${mailingDefaultsBaseFa}" -i composeStart mailingName ""
${G_myName} ${extraInfo} -p pdf=pdf -p base=. -p template="${mailingDefaultsBaseFa}" -i composeStart basicLaTeX pdf
${G_myName} ${extraInfo} -p base=. -p template="${mailingDefaultsBaseFa}" -i composeStart basicLaTeX ""
$( examplesSeperatorSection "Add Mailing To Existing LCNT -- NOTYET -- Done through existing lcntProc.sh" )
lcntProc.sh mailing  # mailingAsBuildName, mailingFileGen
$( examplesSeperatorChapter "Show Mailing Defaults" )
${G_myName} ${extraInfo} -i showMailingDefaults
_EOF_

    lpReturn
}



function vis_composeStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Example:  ${G_myName} -p base=~/bpos/usageEnvs/selected/mailings/com/example/statics -p header=~/bpos/usageEnvs/selected/mailings/com/example/johnDoe/content.mail -p template=baseDir -i composeStart mailName
**
** -p base=~/bpos/usageEnvs/selected/mailings/compose  -- Specifies where the mailing will be created in
** -p header=~/bpos/usageEnvs/selected/mailings/mohsenProfessional/common/content.mail  -- Mail header fields will be extracted from this -- Body will be ignored
** -p template=~/bpos/usageEnvs/selected/mailings/templates/static/enFa/generic  -- Starting point body as mailing.ttytex
** \$1 : Optional ICM Arg1 specifies the mailing name. If None, dateTag is used as name
** \$2 : Optional ICM Arg2 specifies the dateTag over-write name extention -- "" means just mailngName. If None, dateTag is appended to mailingName.
_EOF_
    }
    EH_assert [[ $# -le 2 ]]  # 0=dateTagIt 1=nameIt+datTag 2=nameIt+Qualifier

    local thisEmacsClient=$( vis_thisEmacsClient )

    # Output base directory
    typeset baseDir="$( FN_absolutePathGet ~/bpos/usageEnvs/selected/mailings/compose )"
    if [ ! -z "${base:-}" ] ; then
        baseDir="$( FN_absolutePathGet ${base} )"
    fi

    # mailingName and mailingBaseDir
    typeset mailingBaseDir
    typeset mailingName
    typeset dateTag=$( DATE_nowTag )
    if [ $# -gt  0 ] ; then
        mailingName=$1
        if [ -z mailingName ] ; then
            mailingName=${dateTag}
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${dateTag}  # The specified name is also date tagged.
        fi
    else  # Which means $# == 0
        mailingName=${dateTag}
        mailingBaseDir=${baseDir}/${mailingName}
    fi

    if [ $# == 2 ] ; then
        if [ -z "$2" ] ; then
            mailingBaseDir=${baseDir}/${mailingName}
        else
            mailingBaseDir=${baseDir}/${mailingName}-${2}
        fi
    fi

    ### Mailing Template

    typeset templateBaseDir="${mailingDefaultsBaseEn}"
    if [ ! -z "${template:-}" ] ; then
        templateBaseDir=${template}
    fi

    if [ ! -d "${templateBaseDir}" ] ; then
        EH_problem "Missing Template BaseDir: ${templateBaseDir}"
        lpReturn 101
    fi

    ### headerFile
    typeset headerFile="$( FN_absolutePathGet ${templateBaseDir}/content.mail )"
    if [ ! -z "${header}" ] ; then
        headerFile="$( FN_absolutePathGet ${header} )"
        if [ ! -f ${headerFile} ] ; then
            EH_problem "Missing Header File: ${headerFile}"
            lpReturn 101
        fi
    fi
    if [ ! -f "${headerFile}" ] ; then
        headerFile="${selectedAasMarmeeHeaders}"
        if [ ! -f ${headerFile} ] ; then
            EH_problem "Missing Header File: ${headerFile}"
            lpReturn 101
        fi
    fi

    if [ -d  "${mailingBaseDir}" ] ; then
        EH_problem "${mailingBaseDir} Already In Place -- Will Not Overwrite, Force It With:"
        ANT_raw "rm -r -f ${mailingBaseDir}"
        lpReturn

    else
        opDoRet mkdir -p ${mailingBaseDir}
    fi

    ls -ldt ${mailingBaseDir}
    ls -ldt ${templateBaseDir}
    ls -ldt ${headerFile}

    # inBaseDirDo ${templateBaseDir} eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imdv)"
    inBaseDirDo ${templateBaseDir} eval "find . -print | grep -v CVS | egrep -v ~\$ | cpio -o | (cd ${mailingBaseDir}; cpio -imd)"

    # inBaseDirDo ${mailingBaseDir}  cp "${headerFile}" .

    # All ./LCNT-Info/Builds/mailing-*/buildName are now set to basename of ${mailingBaseDir}
    # arg1=auto means use basename of directory as buildName -- arg2=mailing means do this for all build names matching "mailing"
    inBaseDirDo ${mailingBaseDir}  lcntProc.sh -v -n showRun  -p cntntRawHome=. -i buildNameFvUpdate auto mailing

    # We can now create the mailingFile based on buildName
    inBaseDirDo ${mailingBaseDir}  lcntProc.sh -v -n showRun  -i mailingAsBuildName

    inBaseDirDo ${mailingBaseDir} lcntProc.sh -p pdf=${pdf} -p headerFile=${headerFile} -v -n showRun -i mailingFileGen

    #opDo ${thisEmacsClient} -n -e "(progn (find-file \"${mailingBaseDir}/mailing.ttytex\") (blee:ppmm:org-mode-content-list))"
    # opDo ${thisEmacsClient} -n -e "(progn (find-file \"${mailingBaseDir}/content.mail\"))"

    echo "===================="
    echo "$( FN_nonDirsPart ${mailingBaseDir} ) is ready to be configured."
    echo "+ ${mailingBaseDir}; lsf"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  showDefaults    [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_showMailingDefaults {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #if vis_reRunAsRoot G_thisFunc $@ ; then lpReturn globalReRunRetVal; fi;

    ANT_raw "mailingDefaultsBaseEn=${mailingDefaultsBaseEn}"
    ANT_raw "mailingDefaultsBaseFa=${mailingDefaultsBaseFa}"
    ANT_raw "selectedComposeBase=${selectedComposeBase}"
    ANT_raw "selectedAasMarmeeHeaders=${selectedAasMarmeeHeaders}"

    lpReturn
}



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

    echo "baseDir=$( basename $(pwd) )"
    echo "lcntBuild_buildName=${lcntBuild_buildName}"

    echo "lcntBuild_mailingFile=${lcntBuild_mailingFile}"
    for each in ${lcntBuild_mailings} ; do
        echo "lcntBuild_mailings=${each}"
    done
}

function vis_mailingAsBuildName {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
MailingName is derived from BuildName and stored in the build profile.
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    lpDo eval echo "${lcntBuild_buildName}.mail" \> "${lcntBuildInfoPath}"/mailings
}

function vis_mailingFileGenEnabled {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0  ]]

    inFilesList=$( vis_enabledBuildsDirsList )
    for inFile in ${inFilesList}; do
        lpDo vis_mailingFileGen ${inFile}
    done

    lpReturn
}



function vis_mailingFileGen {
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

    #echo pdf=$pdf
    #echo headerFile=${headerFile}

    lpDo vis_mailingHeaderGen "${lcntBuildInfoPath}"

    lpDo vis_mailingBodyPartsRefresh "${lcntBuildInfoPath}"

    lpDo vis_mailingsDblockUpdate "${lcntBuildInfoPath}"

    lpReturn
}

function vis_mailingHeaderGen {
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

    if [ -z  "${lcntBuild_mailings}" ] ; then
        ANT_cooked "Blank lcntBuild_mailings"
        lpReturn 101
    fi

    for each in ${lcntBuild_mailings} ; do
        lpDo mailingHeaderGenOne ${each}
    done
}


function mailingHeaderGenOne {
    #set -x
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local mailingFile="$1"

    if [ -z  "${mailingFile}" ] ; then
        lpReturn 101
    fi

    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${mailingFile}-${dateTag}


    if [ -f "${mailingFile}" ] ; then
        if [[ "${G_forceMode}_" == "force_" ]] ; then
            lpDo mv ${mailingFile} ${savedMailingFileName}
        else
            EH_problem "${mailingFile} exists and forceMode not specified -- not overriding it."
            lpReturn 102
        fi
    fi

    if [ ! -f "${headerFile}" ] ; then
        EH_problem "Missing headerFile=${headerFile}"
        lpReturn 103
    fi

    ANT_raw "Creating ${mailingFile} ..."

    cat "${headerFile}" > "${mailingFile}"

    cat  << _EOF_ >> ${mailingFile}
Subject: NO SUBJECT
X-MailingName: ${lcntBuild_buildName}
X-MailingDoc: ${lcntBuild_docSrc}
X-MailingParams: :type compose :extSrcBase nil
X-ComposeFwrk: message
--text follows this line--

_EOF_

#
}


function vis_mailingBodyPartsRefresh {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used to be called vis_bodyPartsRefresh.
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    lpDo lcntBuildsBaseFVsPrep

    lpDo lcntReleaseInfoPrep "cur"

    if [ -z  "${lcntBuild_mailings}" ] ; then
        ANT_cooked "Blank lcntBuild_mailings"
        lpReturn 101
    fi

    for each in ${lcntBuild_mailings} ; do
        lpDo mailingBodyPartsRefreshOne ${each}
    done
}


function mailingBodyPartsRefreshOne {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used to be called vis_bodyPartsRefresh.
_EOF_
    }

    EH_assert [[ $# -eq 1  ]]

    local mailingFileName="$1"

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing ${mailingFileName}"
        lpReturn 101
    fi

    # local mailingDoc=$( vis_mailingDoc )
    local dateTag=$( date +%y%m%d%H%M%S )
    local savedMailingFileName=${mailingFileName}.${dateTag}

    lpDo mv ${mailingFileName} ${savedMailingFileName}

    lpDo eval "sed '/--text follows this line--/q' ${savedMailingFileName} > ${mailingFileName}"

    lpDo rm ${savedMailingFileName}

    function relDestFilePath {
        EH_assert [[ $# -eq 1 ]]
        local resultType="$1"
        local dashLcntNu=""
        if [ ! -z  "${lcnt_lcntNu}" ] ; then
          dashLcntNu="-${lcnt_lcntNu}"
        fi

        case ${resultType} in
            "pdf")
                echo "${lcntBuild_releaseBaseDir}/${lcntBuild_relTag}/c${dashLcntNu}-${lcntBuild_relTag}-${lcntBuild_buildName}.${resultType}"
                ;;
            "html")
                echo "${lcntBuild_releaseBaseDir}/${lcntBuild_relTag}/c${dashLcntNu}-${lcntBuild_buildName}-${resultType}/index.html"
                ;;
            *)
                EH_problem "Unknown ${eachResult}"
                lpReturn
        esac
    }

    local pdfFilePath=$(relDestFilePath "pdf")
    local htmlFilePath=$(relDestFilePath "html")

    cat  << _EOF_ >> ${mailingFileName}
<#part type="text/html" disposition=inline>
<!--  [[elisp:(find-file "./${lcntBuild_docSrc}")][Visit ./${lcntBuild_docSrc}]]  -->
<!-- ####+BEGIN: bx:dblock:global:file-insert-process :file "${htmlFilePath}" :load "./dblockProcess.el" :exec "bx:dblock:body-process"
-->
<!-- ####+END: -->
<#/part>
_EOF_

    if [ "${pdf}" == "pdf" ] ; then
	   cat  << _EOF_ >> ${mailingFileName}
<#part type="application/pdf" filename="${pdfFilePath}" disposition=attachment description="Pdf File">
<#/part>
_EOF_
    fi

}


function vis_mailingsDblockUpdate {
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

    if [ -z  "${lcntBuild_mailings}" ] ; then
        ANT_cooked "Blank lcntBuild_mailings"
        lpReturn 101
    fi

    for each in ${lcntBuild_mailings} ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo vis_dblockUpdateFile ${each}  # We now do it twice. Once sometimes does not work
        # lpDo vis_dblockUpdateFile ${each}
    done
}

function vis_mailingCompose {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )
    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    if [ -z  "${lcntBuild_mailings}" ] ; then
        lpReturn 101
    fi

    lpDo vis_withMailFilesCompose ${lcntBuild_mailings}
}


function vis_mailingExtCompose {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )
    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    if [ -z  "${lcntBuild_mailings}" ] ; then
        lpReturn 101
    fi

    lpDo vis_withMailFilesExtCompose ${lcntBuild_mailings}
}

function vis_mailingPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )
    local lcntBuildInfoPath=curBuild

    if [ $# -eq 1 ] ; then
         lcntBuildInfoPath="$1"
    fi

    opDo lcntBuildInfoPrep ${lcntBuildInfoPath}

    lpDo vis_mailingsDblockUpdate ${lcntBuildInfoPath}
}

function vis_hereMailFilesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local dotMailFiles=$(ls ./*.mail 2> /dev/null)
    local dotOrgMsgFiles=$(ls ./*.orgMsg 2> /dev/null)
    local allMailFiles="${dotMailFiles}"" ${dotOrgMsgFiles}"

    [[ "${allMailFiles}" != " " ]] && echo ${allMailFiles}
}

function vis_hereMailFilesComposeOffer {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local filesList=$( vis_hereMailFilesList )

    for each in ${filesList} ; do
        echo ${G_myName} -i withMailFilesCompose "${each}"
        echo "(b:mtdt:mfp/compose \"${each}\")"
    done
}


function vis_withMailFilesCompose {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 1  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )

    for each in "$@" ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(b:mtdt:mfp/compose \"${each}\")"
    done
}

function vis_withMailFilesExtCompose {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 1  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )

    for each in $* ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(b:mtdt:mfp/extCompose \"${each}\")"
    done
}


function vis_withMailFilesMailingPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -ge 1  ]]

    local thisEmacsClient=$( vis_thisEmacsClient )

    for each in $* ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(b:mtdt:setup-and-NOTYET/with-file \"${each}\")"
    done
}



function vis_mtdtSelectMailing {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

_EOF_
    }
    EH_assert [[ $# -eq 1  ]]

    local mailingFileName="$1"
    local thisEmacsClient=$( vis_thisEmacsClient )

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing ${mailingFileName}"
        continue
    fi

    lpDo ${thisEmacsClient} -e  "(b:mtdt:derive/fromFilesAndSelect  \"${mailingFileName}\")"
}


function vis_mailingNameOfFile {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local mailingFileName="$1"
    local mailingName="unspecifiedMailingName"

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing mailingName"
    else
        mailingName=$( egrep '^X-MailingName:' ${mailingFileName} | cut -d : -f 2 )
    fi

    if [ -z "${mailingName}" ] ; then
        EH_problem "Missing X-MailingName"
    fi

    echo ${mailingName}
}

function vis_mailingDoc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET, Incomplete
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingFileName="./content.mail"
    local mailingDoc="unspecifiedMailingName"

    echo ${mailingDoc}

    lpReturn

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing mailingName"
    else
        mailingDoc=$( egrep '^X-MailingDoc:' content.mail | cut -d : -f 2 )
    fi

    if [ -z "${mailingDoc}" ] ; then
        EH_problem "Missing X-MailingDoc: -- X-MailingName used instead"
        mailingDoc=$( vis_mailingName )
    fi

    echo ${mailingDoc}
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
