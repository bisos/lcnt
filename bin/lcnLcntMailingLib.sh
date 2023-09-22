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
${G_myName} ${extraInfo}  -p cntntRawHome=. -i buildNameFvUpdate auto mailing
${G_myName} ${extraInfo} -f -i mailingAsBuildName
$( examplesSeperatorSection "Generate ailing File = mailingHeaderGen + mailingBodyPartsRefresh + mailingsDblockUpdate" )
${G_myName} ${extraInfo} -p pdf=pdf -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGen
${G_myName} ${extraInfo} -p headerFile=${selectedAasMarmeeHeaders} -i mailingFileGen
$( examplesSeperatorSection "Mailing Headers" )
${G_myName} ${extraInfo} -i mailingHeaderGen curBuild # curBuild is default, specify other lcntBuildInfoPath
${G_myName} ${extraInfo} -f -i mailingHeaderGen
${G_myName} ${extraInfo} -p headerFile=${selectedAasMarmeeHeaders} -i mailingHeaderGen
$( examplesSeperatorSection "Body Parts Refresh" )
${G_myName} ${extraInfo} -i mailingBodyPartsRefresh  # Creates appropriate empty dblock for html content + perhaps pdf attachement
${G_myName} ${extraInfo} -p pdf=pdf -i mailingBodyPartsRefresh # Creates appropriate empty dblock for html content + perhaps pdf attachement
$( examplesSeperatorChapter "Mailing --- curBuild=${curBuildEndLink} curRelease=${curReleaseEndLink} mailing=${lcntBuild_mailingFile}" )
${G_myName} ${extraInfo} -p pre="clean" -p extent="build+view" -i lcntBuild cur  # Runs dblock
${G_myName} ${extraInfo} -p extent="compose" -i lcntBuild cur
${G_myName} ${extraInfo} -p extent="originate" -i lcntBuild cur
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledList" -p extent="compose" -i lcntBuild all  # Using enabled list
${G_myName} ${extraInfo} -p enabled="./LCNT-INFO/Builds/enabledList" -p extent="build+view+release+compose" -i lcntBuild all  # Using enabled list
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

    if [ ! -f "${headerFile}" ] ; then
        EH_problem "Missing headerFile=${headerFile}"
        lpReturn 103
    fi

    ANT_raw "Creating ${lcntBuild_mailingFile} ..."

    cat "${headerFile}" > "${lcntBuild_mailingFile}"

    cat  << _EOF_ >> ${lcntBuild_mailingFile}
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

    if [ -z  "${lcntBuild_mailingFile}" ] ; then
        lpReturn 101
    fi

    lpDo lcntBuildsBaseFVsPrep

    lpDo lcntReleaseInfoPrep "cur"

    local mailingFileName="${lcntBuild_mailingFile}"

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

    for each in ${lcntBuild_mailings} ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(mcdt:setup-and-compose/with-file \"${each}\")"
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

    for each in ${lcntBuild_mailings} ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(mcdt:setup-and-compose/with-file \"${each}\")"
    done
}


function vis_mailingOriginate {
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

    for each in ${lcntBuild_mailings} ; do
        if [ ! -f "${each}" ] ; then
            EH_problem "Missing ${each}"
            continue
        fi
        lpDo ${thisEmacsClient} -e  "(mcdt:setup-and-originate/with-file \"${each}\")"
    done
}



function vis_mailingNamePlaceHolder {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local mailingFileName="./content.mail"
    local mailingName="unspecifiedMailingName"

    if [ ! -f "${mailingFileName}" ] ; then
        EH_problem "Missing mailingName"
    else
        mailingName=$( egrep '^X-MailingName:' content.mail | cut -d : -f 2 )
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
