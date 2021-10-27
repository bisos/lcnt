#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedMmUnite.sh,v 1.2 2018-04-26 19:14:10 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:dblock:lsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/opt/public/osmt/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /opt/public/osmt/bin/seedMmUnite.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /opt/public/osmt/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/mmaLib.sh
. ${opBinBase}/mmaQmailLib.sh
. ${opBinBase}/mmaDnsLib.sh

# /opt/public/osmt/bin/lcnObjectTree.libSh
. ${opBinBase}/lcnObjectTree.libSh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/lpCurrents.libSh


# PRE parameters

baseDir=""

function G_postParamHook {
    lpCurrentsGet
    bystarUid=$( bueAcctCurrent.sh -i currentAssociatedShow 2> /dev/null )
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
}

G_myPanel="/libre/ByStar/InitialTemplates/activeDocs/blee/screencasting/fullUsagePanel-en.org"


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Chapter Title" )
$( examplesSeperatorSection "Section Title" )
${G_myName} ${extraInfo} -i doTheWork
_EOF_

  typeset presPdfFile="./presentationEnFa.pdf"

  visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
---  Documentation / How-To  ---
${G_myName} ${extraInfo}  -i howTo
$( examplesSeperatorTopLabel "Presentation Dispositions" )
$( examplesSeperatorChapter "Build / Prepare The Presentation And Disposition Base" )
$( examplesSeperatorSection "ScreenCasting Preparations And Execution" )
${G_myName} ${extraInfo} -i screenCastingFullClean
${G_myName} ${extraInfo} -i screenCastingFullUpdate
$( examplesSeperatorChapter "Dispositions/Playing/Recording Examples" )
$( examplesSeperatorSection "Presentation Play Raw Commands" )
acroread ${presPdfFile}
pdfpc ${presPdfFile}
impressive ${presPdfFile}
$( examplesSeperatorSection "Presentation Play (impressive)" )
${G_myName} ${extraInfo} -f -i presPlaySize 1280x720 ${presPdfFile} slideShowRepeat
${G_myName} ${extraInfo} -f -i presPlaySize 1280x720 ${presPdfFile} presenter
${G_myName} ${extraInfo} -i presPlaySize 1280x720 ${presPdfFile} voiceOver
${G_myName} ${extraInfo} -f -i presPlaySize 1280x720 ${presPdfFile} voiceOver
$( examplesSeperatorSection "Presentation Play And Record (impressive)" )
${G_myName} ${extraInfo} -i presPlayRecSize topLeft720 1280x720 ${presPdfFile} voiceOver
$( examplesSeperatorChapter "Disposition Setup/Set/Update" )
/de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py
iimBeamerImpressiveEmacs.py
iimBeamerImpressiveEmacs.py -v 30 -i latexSrcToDispositionUpdate ${presPdfFile}
impiimBeamerImpressiveEmacs.py -v 30 -i dispositionToImpressiveInfoStdout  voiceOver presenter         # Args specify purpose
iimBeamerImpressiveEmacs.py -v 30 -i dispositionToImpressiveInfoStdout  voiceOver
$( examplesSeperatorChapter "Screen Capture Preparations And Control" )
bx-vlcRecScreen
bx-vlcRecScreen -h -v -n showRun -p apps=blee -p locSize=topLeft720 -i  prepareApps
bx-vlcRecScreen -h -v -n showRun -p locSize=topLeft720 -i  recordStart
bx-desktopCapture -h -v -n showRun -i  recordEnd
$( examplesSeperatorChapter "Play the Just Recorded Video" )
mplayer ./out.ogv
totem ./out.ogv
vlc ./out.ogv
ls -dt out*.ogv | head -1
$( examplesSeperatorTopLabel "pdfpc Notes Generator (Pdf Presentation Console)" )
sed -i -e  's/\\\\/\n/g' -e  's/\\par/\n\n/g'  presentationEnFa.pdfpc 
pdfpc presentationEnFa.pdf  # Two Screens
pdfpc -S presentationEnFa.pdf  # One Screen
$( examplesSeperatorTopLabel "Audio Base Setup" )
${G_myName} ${extraInfo} -i startAudio
$( examplesSeperatorSection "Process Impressive Tags Of LaTeX Input" )
${G_myName} ${extraInfo} -i impressiveTagsUpdate
iimBeamerImpressiveEmacs.py -v 30 --load ./presentationEnFa-itags.py -i loadProc
$( examplesSeperatorSection "Developer Examples" ) 
${G_myName} ${extraInfo} -i devExamples
$( examplesSeperatorSection "Release / Stage For Publication/Export" ) 
${G_myName} ${extraInfo} -i pdfOutImages \$( lcntProc.sh -i  docsList )
${G_myName} ${extraInfo} -i videoResultFiles
${G_myName} ${extraInfo} -i videoResultFilesStart  # Prepare videoResults.fvd
$( examplesSeperatorSection "Full Actions" ) 
${G_myName} ${extraInfo} -i fullClean
_EOF_

  hookRun "examplesHookPost"
  
}


function vis_devExamples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  typeset presPdfFile="./presentationEnFa.pdf"

  visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorChapter "Obsoleted" )
$( examplesSeperatorSection "Convert Video For Distribution" )
mencoder ./out.ogv -vf scale=640:480 -af volnorm=1:0.5 -ovc lavc -oac twolame -o final.avi  # NOTYET
$( examplesSeperatorChapter "Sound Setup/Update" )
${G_myName} ${extraInfo} -i soundsSetup                         # Create the ./sounds directory
${G_myName} ${extraInfo} -i soundsFullUpdate 
$( examplesSeperatorChapter "Presenter Tools -- Presenter Console" ) 
$( examplesSeperatorSection "Impressive Presenter" ) 
${G_myName} ${extraInfo} -i presenterSetup                      # Setup The presenter Environment
${G_myName} ${extraInfo} -i presenterClean                      # Cleanup the presenter environment
${G_myName} ${extraInfo} -i presenterBrowser                    # Play -- Full Screen
_EOF_

}


noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  buildPre    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function buildPre {
  #if [[ ! -d tables ]] ; then ln -s ../Q1-2007-BusPlan/tables tables; fi
  lcntSourceTypeBaseDir="${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/${lcntAttrPermanence}"
  if [[ ! -d figures ]] ; then ln -s ${lcntSourceTypeBaseDir}/common/figures figures; fi
  return
}


_CommentBegin_
*      ################ /Features/
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_dispositionFullClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_dispositionFullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  impressiveCommonArgs    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function impressiveCommonArgs {
    echo "-f --nologo --darkness 10 --spot-radius 32 "
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presPlaySize    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presPlaySize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
\$1 is sizeGeometry
\$2 is presentationFile
\$3 is presPurpose  -- defaults to ${presentationFile}.info
_EOF_
    }
    EH_assert [[ $# -lt 4 ]]   # No more than 3
    EH_assert [[ $# -gt 1 ]]   # No less than 2

    typeset sizeGeometry=${1}
    typeset presentationFile=${2}

    if [ ! -f "${presentationFile}" ] ; then
	EH_problem "Missing Input: ${presentationFile}"
	lpReturn 101
    fi

    if [ $# -eq 2 ] ; then
	opDo impressive $(impressiveCommonArgs) --geometry ${sizeGeometry} ${presentationFile}
    else
	presPurpose=${3}
	typeset thisInfoFile=""
	#typeset iimBeamerImpressiveEmacs="/de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py"
	typeset iimBeamerImpressiveEmacs="beamerExternalExtensions.py"	
	typeset impressiveInfoBaseDir="./impressive.gened"

	opDo FN_dirCreatePathIfNotThere  ${impressiveInfoBaseDir}

	case ${presPurpose} in
	"interactive")
		thisInfoFile=$( FN_absolutePathGet ./${impressiveInfoBaseDir}/interactive )
		if [[ "${G_forceMode}_" == "force_" ]] ; then
		    opDo eval "${iimBeamerImpressiveEmacs} -v 30 -i dispositionToImpressiveInfoStdout  interactive" \> "${thisInfoFile}"
		else
		    if [ ! -f "${thisInfoFile}" ] ; then
			EH_problem "Missing Input: ${thisInfoFile}"
			EH_problem "Perhaps Use '-f' option to create the info file"
			lpReturn 101
		    fi
		fi
		opDo impressive $(impressiveCommonArgs) -I ${thisInfoFile} --geometry ${sizeGeometry} ${presentationFile}
		;;
	"presenter")
		thisInfoFile=$( FN_absolutePathGet ./${impressiveInfoBaseDir}/presenter )
		if [[ "${G_forceMode}_" == "force_" ]] ; then
		    opDo eval "${iimBeamerImpressiveEmacs} -v 30 -i dispositionToImpressiveInfoStdout  presenter" \> "${thisInfoFile}"
		else
		    if [ ! -f "${thisInfoFile}" ] ; then
			EH_problem "Missing Input: ${thisInfoFile}"
			EH_problem "Perhaps Use '-f' option to create the info file"
			lpReturn 101
		    fi
		fi
		opDo impressive $(impressiveCommonArgs) -I ${thisInfoFile} --geometry ${sizeGeometry} ${presentationFile}
		;;
	"voiceOver")
		thisInfoFile=$( FN_absolutePathGet ./${impressiveInfoBaseDir}/voiceOver )
		if [[ "${G_forceMode}_" == "force_" ]] ; then
		    opDo eval "${iimBeamerImpressiveEmacs} -v 30 -i dispositionToImpressiveInfoStdout  voiceOver" \> "${thisInfoFile}"
		else
		    if [ ! -f "${thisInfoFile}" ] ; then
			EH_problem "Missing Input: ${thisInfoFile}"
			EH_problem "Perhaps Use '-f' option to create the info file"
			lpReturn 101
		    fi
		fi
		opDo impressive $(impressiveCommonArgs) -I ${thisInfoFile} --geometry ${sizeGeometry} ${presentationFile}
		;;
	"slideShow")
		# Auto advance in 5 seconds
		opDo impressive -a 5 -f --geometry ${sizeGeometry} ${presentationFile}
		;;
	"slideShowRepeat")
		# Auto advance in 5 seconds
		opDo impressive -a 5 -w -f ${sizeGeometry} ${presentationFile}
		;;
	*)
		EH_problem "Unexpected this=${presPurpose}"
		lpReturn 1
		;;
	esac
    fi

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presPlayRecSize    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presPlayRecSize {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
\$1 is locGeometryName  -- Location
\$2 is sizeGeometry
\$3 is presentationFile
\$4 is presPurpose  -- defaults to ${presentationFile}.info
_EOF_
    }
    EH_assert [[ $# -eq 4 ]]

    typeset locGeometryName=${1}
    typeset sizeGeometry=${2}
    typeset presentationFile=${3}
    typeset presPurpose=${4}    

    opDo vis_presPlaySize ${sizeGeometry} ${presentationFile} ${presPurpose} &

    #opDo bx-desktopCapture -h -v -n showRun -p locSize=${locGeometryName} -i  recordStart

    lpReturn
}


_CommentBegin_
*      ################ /Self-Update/
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_videoResultFilesStart    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_videoResultFilesStart {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    opDo mkdir -p videoResults.fvd
    
    opDo eval echo ${here}/pres.mp4 \> videoResults.fvd/mp4
    opDo eval echo ${here}/pdfOutImages-presentationEnFa/page0001.png \> videoResults.fvd/poster

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_videoResultFiles    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_videoResultFiles {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This should be expanded. 
If the results are not in-place, do what it takes to rebuild them from scratch
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset here=$( pwd )

    if [ ! -d videoResults.fvd ] ; then
	EH_problem "Missing videoResults.fvd"
	lpReturn 101
    fi

    echo ${here}/videoResults.fvd
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pdfOutImages    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pdfOutImages {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    for thisOne in ${@} ; do
	typeset thisPrefix=$( FN_prefix ${thisOne} )
	typeset thisExtension=$( FN_extension ${thisOne} )
	
	if [ ! -f ${thisPrefix}.pdf ] ; then
	    ANT_raw "Missing ${thisPrefix}.pdf -- Skipped"
	    continue
	fi
	
	if lcntProc.sh -i isPresentation ${thisOne} ; then
	    opDo impressive -o pdfOutImages-${thisPrefix} ${thisPrefix}.pdf
	else
	    ANT_raw "Will NOT process ${thisOne} -- Not A Presentation"
	fi
	
    done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_pdfOutImagesClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_pdfOutImagesClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    for thisOne in ${@} ; do
	typeset thisPrefix=$( FN_prefix ${thisOne} )
	typeset thisExtension=$( FN_extension ${thisOne} )
	
	if [ -d pdfOutImages-${thisPrefix} ] ; then
	    ANT_raw "Removing pdfOutImages-${thisPrefix} directory"
	    opDo rm -r -f pdfOutImages-${thisPrefix}
	else
	    ANT_raw "pdfOutImages-${thisPrefix} Not Found -- Cleaning Skipped"
	fi
	
    done

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_fullClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_fullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset docsList=$( lcntProc.sh -i docsList )

    for thisOne in ${docsList} ; do
	opDo vis_pdfOutImagesClean ${thisOne}
    done

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_screenCastingFullClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_screenCastingFullClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo lcntProc.sh -i fullClean

    opDo FN_fileRmIfThere ./screenCasting.el

    opDo FN_dirDeleteIfThere ./disposition.gened
    opDo FN_dirDeleteIfThere ./impressive.gened

    inBaseDirDo ./audio mmUniteAudio.sh -h -v -n showRun -i fullClean

    inBaseDirDo ./video mmUniteVideo.sh -h -v -n showRun -i fullClean

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_screenCastingFullUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_screenCastingFullUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #typeset iimBeamerImpressiveEmacs=/de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py
    
    #typeset iimBeamerImpressiveEmacs="beamerExternalExtensions.py"
    typeset iimBeamerImpressiveEmacs="/de/bx/nne/dev-py/pypi/pkgs/bisos/lcnt/dev/bin/beamerExternalExtensions.py"

    opDo lcntProc.sh -i fullClean

    opDo eval echo t \> ./screenCasting.el

    opDo lcntProc.sh -i dblockUpdateFile presentationEnFa.ttytex
    opDo lcnLcntInputProc.sh -p inFormat=xelatex -p outputs=pdf -i buildDocs presentationEnFa.ttytex

    opDo ${iimBeamerImpressiveEmacs} -v 30 -i latexSrcToDispositionUpdate ./presentationEnFa.pdf
    opDo vis_impressiveTagsUpdate
    #opDo ${iimBeamerImpressiveEmacs} -v 30 --load ./presentationEnFa-itags.py -i loadProc

    if [ ! -d ./audio ] ; then
	opDo vis_startAudio
    fi

    inBaseDirDo ./audio mmUniteAudio.sh -h -v -n showRun -i fullUpdate
    
    if [ ! -d ./video ] ; then
	opDo vis_startVideo
    fi

    inBaseDirDo ./video mmUniteVideo.sh -h -v -n showRun -i fullUpdate

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_latexInputFilesList  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_latexInputFilesList {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Outputs list of files that have gone in $1
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local mainLatexFile="$1"
    local thisPrefix=$( FN_prefix "${mainLatexFile}" )
    local thisExtension=$( FN_extension "${mainLatexFile}" )

    opDo xelatex -recorder "${mainLatexFile}" 2> /dev/null 1> /dev/null

    local filesList=$( echo $( egrep '(^INPUT )([a-z|A-Z]|\.)' "${thisPrefix}.fls"  | sort | uniq | egrep -v 'aux$' | cut -d ' ' -f 2 ) )
    
    local effectiveFilesList=""
    local isGood=""
    for each in ${filesList} ; do
	isGood=$( echo ${each} | egrep -v '\.vrb$' | egrep -v '\.out$'| egrep -v '\.bbl$'| egrep -v '\.nav$' | egrep -v '\.cut$'  )
	if [ ! -z "${isGood}" ] ; then
	    effectiveFilesList="${effectiveFilesList} ${isGood}"
	fi
    done
    
    echo "${effectiveFilesList}" 

    lpReturn
}	



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_impressiveTagsUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_impressiveTagsUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Creates presentationEnFa-itags.py based on %BxPy: tags in  .tex files
so that, they can be loaded with --load.
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo beamerExternalExtensions.py -i beamerExternalTagsUpdateAsFPs ./presentationEnFa.ttytex  

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startAudio    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startAudio {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo mkdir ./audio

    #opDo cp /libre/ByStar/InitialTemplates/lcnt/dispositions/audioPresProc.sh ./audio
    
    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUniteAudio.sh ./audio/mmUniteAudio.sh

    lpReturn
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_startVideo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_startVideo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]


    opDo mkdir ./video
    
    opDo cp /libre/ByStar/InitialTemplates/begin/templates/purposed/lcnt/bash/mmUniteVideo.sh ./video/mmUniteVideo.sh
    
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_baseSetup    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_baseSetup    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_baseSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo mkdir ./control.fpd

    lpReturn
}


_CommentBegin_
*      ################ /Junk Yard -- Obsoleted/
_CommentEnd_


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Presenter Setup/Update
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presenterSetup    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presenterSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Creates 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    #opDo /usr/local/bin/impressive-presenter.sh ./presentationEnFa.pdf
    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presenterClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presenterClean {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    
    opDo FN_fileRmIfThere ./json.txt
    opDo FN_fileRmIfThere ./jquery-1.3.2.min.js
    opDo FN_fileRmIfThere ./presenter.html

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presenterBrowser    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presenterBrowser {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo rm ./json.txt

    opDo bx-browse-url.sh -i openUrlNewTab   file://$( pwd )/presenter.html
    lpReturn
}



_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Obsoleted -- Start/Play Presention -- presPlaySize presPlay720 
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_presPlay720    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_presPlay720 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 3 ]]
    EH_assert [[ $# -gt 0 ]]

    opDo vis_presPlaySize 1280x720 $@

    lpReturn
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
