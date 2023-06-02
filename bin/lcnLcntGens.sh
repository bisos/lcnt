#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcnLcntGens.sh,v 1.11 2019-07-23 03:34:09 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/lcnt/bin/lcnLcntGens.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/bisos/apps/defaults/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
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

. ${opBinBase}/lcnObjectTree.libSh
. ${lcntBinBase}/lcnLcntLib.sh

. ${lcntBinBase}/lcnLcntBuildLib.sh
. ${lcntBinBase}/lcnLcntExportLib.sh
. ${lcntBinBase}/lcnLcntReleaseLib.sh


# PRE parameters

typeset -t doc=""
typeset -t firstRun=""
typeset -t lcntNu=""

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
  if [[ "${doc}_" != "_" ]] ; then

   docList=""

   typeset thisDoc
   for thisDoc in ${doc} ; do
     docList="${docList} ${thisDoc}"
   done
  fi
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examplesBeginTemplate {
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
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
  typeset extraInfo="-n showRun"
  #typeset lcntDocNumber=11001
  typeset repubDocNumber=00001
  typeset docBaseName=main
  typeset docType=article
  typeset docFormat1=odp
  typeset docFormat2=ttytex
  typeset repubDocName=repub-070722

  if [ -z "${cntntRawHome:-}" ] ; then
    cntntRawHome=.
    lcntDocNumber=`vis_regNuShow`
    #echo EH_problem ""
  fi

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- INFO  ---
${G_myName} ${extraInfo} -i help
${G_myName} ${extraInfo} -i todo
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoReport
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntPathAnalyze
--- Document Number Assignment --
${G_myName} ${extraInfo} -p cntntRawHome=. -i numberVerify  -- NOTYET, ask MB
${G_myName} ${extraInfo} -p cntntRawHome=. -i regNuShow
${G_myName} ${extraInfo} -p cntntRawHome=. -i getNextNuForRegistration $( pwd )
${G_myName} ${extraInfo} -p cntntRawHome=. -i autoRegThisDoc  $( pwd ) primaryDocName
--- Pre-Existing Publishers  ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pdf"  -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pdf"  -i baseFullStart  # PrimaryDoc.pdf
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="html"  -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="html"  -i baseFullStart  # PrimaryDoc.html
--- Document Full Creators -- MEMO ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="memo" -p srcLangs="en" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="memo" -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="memo" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="memo" -p srcLangs="fa+en" -i baseFullStart 
--- Document Full Creators -- WebPage ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="webpage" -p lcntNu=00000 -p srcLangs="en" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="webpage" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="webpage" -p lcntNu=00000 -p srcLangs="fa+en" -i baseFullStart 
--- Document Full Creators -- mailLcnt ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="mailLcnt" -p lcntNu=00000 -p srcLangs="en" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="mailLcnt" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="mailLcnt" -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="mailLcnt" -p lcntNu=00000 -p srcLangs="fa+en" -i baseFullStart 
--- Document Full Creators -- Article Only ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art" -p srcLangs="en" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art" -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art" -p srcLangs="fa+en" -i baseFullStart 
--- Document Full Creators -- Article And Presentation ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="fa+en" -i baseFullStart 
--- Document Full Creators -- Presentation And Article ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pres+art" -p srcLangs="en" -i baseFullStart  201105011
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pres+art" -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pres+art" -p lcntNu=00000 -p srcLangs="en+fa" -i baseFullStart 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pres+art" -p srcLangs="fa+en" -i baseFullStart 
--- Document Creators ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -i baseBlankStartSteps
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="pres+art" -p srcLangs="en+fa" -i baseBlankStartSteps
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -i baseBlankStartSteps docName
${G_myName} ${extraInfo} -p cntntRawHome=. -e "Start Blank" -i lcntBaseStartMulti art+pres:fa
${G_myName} ${extraInfo} -p cntntRawHome=. -e "Start Blank" -i lcntBaseStartMulti pres+art:en+fa
${G_myName} ${extraInfo} -p cntntRawHome=. -e "Start Blank" -i lcntBaseStartMulti art+pres:fa+en
--- Document Creators Old ---
${G_myName} ${extraInfo} -p cntntRawHome=. -e "Start Blank" -i lcntBaseStart ${docFormat1} ${docBaseName}
${G_myName} ${extraInfo} -p cntntRawHome=. -e "Start Blank" -i lcntBaseStart ${docFormat2} ${docBaseName}
--- Prep Starting/Updating Document Base of Templates after lcntRefresh of LCNT-INFO ---
${G_myName} ${extraInfo} -p cntntRawHome=. -e "After lcntRefresh" -i lcntBaseConfig ${docType}
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -i lcntBaseConfigMulti
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="" -p srcLangs="" -i lcntBaseConfigMulti  # Update Based on LCNT-INFO
--- LCNT-INFO Directory Manipulators ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -i lcntRefresh
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcLangs="en" -e "Repub Start" -i lcntRefresh
${G_myName} ${extraInfo} -p cntntRawHome=.  -p srcLangs="en" -e "Must Exist, Replaces" -i lcntFullRenew
${G_myName} ${extraInfo} -p cntntRawHome=.  -i lcntNodeRefresh
--- RE-NUMBER ---
${G_myName} ${extraInfo} -p cntntRawHome=. -i reNumber  next
--- INFO Dir Generator/Verifier ---
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcLangs="en" -i lcntInfoGen  # For Repub
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoVerify
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoRenew
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoRenewCustomize
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoReport
${G_myName} ${extraInfo} -p cntntRawHome=. -e "List Entry -- .bib .html" -i lcntEntryGens
${G_myName} ${extraInfo} -p cntntRawHome=. -e "List Entry -- .bib .html" -i lcntEntryClean
--- Transition and Preparation Tools ---
${G_myName} ${extraInfo} -p cntntRawHome=. -i plpc2lcnt
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntInfoFullRenew
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntBuildInfoGens
${G_myName} ${extraInfo} -p cntntRawHome=. -i lcntExportInfoGens
${G_myName} ${extraInfo} -p cntntRawHome=. -i accessPagePublish
NOTYET: Assign the next permanant number
NOTYET: Assign a particular permanent number
_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  noArgsHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function noArgsHook {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_help    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_help {
 cat  << _EOF_

 SEE lcnLcntRoadmap.sh for the big picture.


TODO
----

add -p fname=res_mb to 
${G_myName} ${extraInfo} -p cntntRawHome=. -p srcForms="art+pres" -p srcLangs="en" -p fname="res_mb" -i baseFullStart 


   The current directory and cntnRawHome contains 
   lots of information that this program uses.

    See -i lcntPathAnalyze

   == Starting a New Document

      0) BaseStart 

      1) Register docNu

      2) Refresh

      3) BaseConfig

  == Existing Document

      0) Register docNu

      1) Refresh


## NOTYET, Text below is out of date

   - BaseStart: 
        Creates basic tempalets in a totally EMPTY directory.
        It creates starting point templates.

           - It needs a docType and docBaseName

   - FullStart: (OBSOLETE)

       It takes an EXISITING document, and makes it conform 
       to lcnt facilities.

   - FullRenew:

       It updates a LCNT document base to the latest model.

   - Refresh:

       If no, LCNT and no ./lcntProc.sh then create one if number has
       been assigned.

       Otherwise do the types of updates that are *known* to be safe.

   - InfoGen: 
        is used when a document exists, but needs 
        LCNT-INFO for processing and/or publication.



_EOF_

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_todo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_todo {
 cat  << _EOF_

 - Verify that all the info is in place to generate .bib files.
 - Better Access Page Generator
 - Better LaTeX Title Page Generator
 - docSubType  -- Document/{Book, Article}

_EOF_
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntPathAnalyze    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntPathAnalyze {

  lcntPathAnalyze `pwd`

 echo lcntSource_origin=${lcntSource_origin}
 echo lcntSource_author1=${lcntSource_author1}
 echo lcntSource_pubDestUrls=${lcntSource_pubDestUrls}
 echo lcntSource_organization=${lcntSource_organization}

 echo lcntAttrGenPub=${lcntAttrGenPub}
 echo lcntAttrSource=${lcntAttrSource}

 echo lcntAttrPermanence=${lcntAttrPermanence}

 echo lcntAttrGroup=${lcntAttrGroup}

 echo lcntAttrHomeRelBase=${lcntAttrHomeRelBase}
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_numberVerify    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_numberVerify {
  lcnLcntPre
  baseDir=${1}

  lcntInfoPath=${baseDir}/${lcntInfoDir}
  # ./LCNT-INFO/lcntNu

  cat ${lcntInfoPath}/lcntNu

  lcntPathAnalyze ${baseDir}
  
  ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/lcntSourceInfo.sh
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_autoRegThisDoc    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_autoRegThisDoc {
  EH_assert [[ $# -ge 2 ]]

  baseDir=${1}
  primaryDocName=$2

  lcnLcntPre

  lcntPathAnalyze ${baseDir}

  if [ "${lcntNu:-}" = "00000" ] ; then
      ANT_raw "lcntNu=${lcntNu}"
      lpReturn
  fi

  if [[ $# -eq 3 ]] ; then
      nextNu=$3
  else
      nextNu=$( vis_getNextNuForRegistration $1 )
  fi

  

  if [[ -z ${nextNu} ]] ; then
      EH_problem "Empty nextNu"
      return 101
  fi

  echo ${nextNu}: `pwd`/"${primaryDocName}" >> ${lcntBaseDir}${lcntAttrGenPub}/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg

  opDo ls -l ${lcntBaseDir}${lcntAttrGenPub}/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg

  opDo tail -3 ${lcntBaseDir}${lcntAttrGenPub}/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg

  ANT_raw "${nextNu} Has Been Assigned To This Document"
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_getNextNuForRegistration    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_getNextNuForRegistration {
  EH_assert [[ $# -eq 1 ]]

  lcnLcntPre
  baseDir=${1}

  lcntInfoPath=${baseDir}/${lcntInfoDir}
  # ./LCNT-INFO/lcntNu

  #cat ${lcntInfoPath}/lcntNu

  lcntPathAnalyze ${baseDir}
  
  #${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/lcntSourceInfo.sh

    case ${lcntAttrPermanence} in 
      "record"|"draft"|"permanent")
            lastUsedNu=$( sort ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/${lcntAttrPermanence}.reg  | egrep '^[0-9]'|  tail -1 | cut -d ':' -f 1 )

            if [[ -z ${lastUsedNu} ]] ; then
                EH_problem "Empty lastUsedNu"
                return 101
            fi
            integer nextNu=$( expr ${lastUsedNu} + 1 )
            echo ${nextNu}
            ;;
      "repub")      
            grep ${baseDir}/${fileName}   /lcnt/REGISTRY/repub/repub.reg | cut -d ':' -f 1
            ;;

      "sw")      
            grep ${baseDir}   /lcnt/REGISTRY/sw/sw.reg | cut -d ':' -f 1
            ;;

      *)
           EH_problem "Unknown lcntAttrPermanence: ${lcntAttrPermanence}"
           return 1
         ;;
    esac
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_regNuShow    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_regNuShow {
  #set -x

  lcnLcntPre

  baseDir=${cntntRawHome}

  cd $baseDir
  baseDir=`pwd`

  if [ "${lcntNu:-}" = "00000" ] ; then
      # echo ${baseDir}   # Changed to 00000 in 20230430 for use in Builds
      echo "00000"
      lpReturn
  fi


  lcntInfoPath=${baseDir}/${lcntInfoDir}
  # ./LCNT-INFO/lcntNu

  #cat ${lcntInfoPath}/lcntNu

  lcntPathAnalyze ${baseDir}
  

  if [[ "${lcntAttrPermanence}_" == "sw_" ]] ; then
    grep ${baseDir}   ${lcntBaseDir}REGISTRY/sw/sw.reg | cut -d ':' -f 1
    return
  else
    srcFilesList=`ls -tr *.ttytex 2> /dev/null`

    if [[ "${srcFilesList}_" == "_" ]] ; then 
      srcFilesList=`ls -tr *.odp 2> /dev/null`
    fi
    
    if [[ "${srcFilesList}_" == "_" ]] ; then 
      srcFilesList=`ls -tr *.pdf 2> /dev/null`
    fi

    if [[ "${srcFilesList}_" == "_" ]] ; then 
      srcFilesList=`ls -tr *.html 2> /dev/null`
    fi

  fi

  typeset thisDoc

  for thisDoc in ${srcFilesList} ; do
    typeset fileName=`FN_nonDirsPart ${thisDoc}`

    # /lcnt/lgpc/mohsen/SOURCE-INFO/permanent.reg 
    case ${lcntAttrPermanence} in 
      "record"|"draft"|"permanent")
            grep ${baseDir}/${fileName}   ${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/${lcntAttrPermanence}.reg | cut -d ':' -f 1
            ;;
      "repub")      
            grep ${baseDir}/${fileName}   /lcnt/REGISTRY/repub/repub.reg | cut -d ':' -f 1
            ;;

      "sw")      
            grep ${baseDir}   /lcnt/REGISTRY/sw/sw.reg | cut -d ':' -f 1
            ;;

      *)
           EH_problem "Unknown lcntAttrPermanence: ${lcntAttrPermanence}"
           return 1
         ;;
    esac
  done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  perhapsTouch    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function perhapsTouch {
  EH_assert [[ $# -eq 1 ]]

  if [[ -f ${1} ]] ; then
    EH_problem "${1} Exists"
    #opDo ls -l "${1}" 
  else
    opDo touch ${1}
    #opDo ls -l "${1}"
  fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_baseFullStart    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_baseFullStart {
  EH_assert [[ $# -le 1 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

  multiFormats="${srcForms}:${srcLangs}"

  lcnLcntPre

  lcntPathAnalyze `pwd`

  primaryDocument=$(  vis_emptyCreateMulti  2> /dev/null )

  if [[ $# -eq 1 ]] ; then
      opDo vis_autoRegThisDoc  $( pwd ) "${primaryDocument}" "$1"
  else
      opDo vis_autoRegThisDoc  $( pwd ) "${primaryDocument}"
  fi

  opDo vis_lcntRefresh

  opDo vis_lcntBaseConfigMulti 
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_emptyCreateMulti    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_emptyCreateMulti {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

  multiFormats="${srcForms}:${srcLangs}"

  lcnLcntPre

  lcntPathAnalyze `pwd`


  case ${multiFormats} in 
      "art:en+fa")
            perhapsTouch articleEnFa.ttytex
            primaryDocument="articleEnFa.ttytex"
            ;;
      "memo:en+fa")
            perhapsTouch memoEnFa.ttytex
            primaryDocument="memoEnFa.ttytex"
            ;;
      "memo:fa+en")
            perhapsTouch memoFaEn.ttytex
            primaryDocument="memoFaEn.ttytex"
            ;;
      "memo:en")
            perhapsTouch memoEn.ttytex
            primaryDocument="memoEn.ttytex"
            ;;
      "art+pres:en+fa")
          perhapsTouch articleEnFa.ttytex
          sleep 1   # So that article is older
          perhapsTouch presentationEnFa.ttytex
          perhapsTouch presArtEnFa.ttytex
          #perhapsTouch bodyEnFa.tex
          primaryDocument="articleEnFa.ttytex"
          ;;
      "pres+art:en+fa")
          perhapsTouch presentationEnFa.ttytex
          sleep 1
          perhapsTouch articleEnFa.ttytex
          perhapsTouch presArtEnFa.ttytex
          #perhapsTouch bodyEnFa.tex
          primaryDocument="presentationEnFa.ttytex"
          ;;
      "art:fa+en")
            perhapsTouch articleFaEn.ttytex
            primaryDocument="articleFaEn.ttytex"
            ;;
      "art+pres:fa+en")
          perhapsTouch articleFaEn.ttytex
          sleep 1
            perhapsTouch presentationFaEn.ttytex
            #perhapsTouch bodyFaEn.tex
            primaryDocument="articleFaEn.ttytex"
            ;;
      "pres+art:fa+en")
          perhapsTouch presentationFaEn.ttytex
          sleep 1
            perhapsTouch articleFaEn.ttytex
            #perhapsTouch bodyFaEn.tex
            primaryDocument="presentationFaEn.ttytex"
            ;;
      "art:en")
            perhapsTouch articleEn.ttytex
            primaryDocument="articleEn.ttytex"
            ;;
      "art+pres:en")
          perhapsTouch articleEn.ttytex
          sleep 1
          perhapsTouch presentationEn.ttytex
          perhapsTouch presArtEn.ttytex           
          #NOTYET perhapsTouch bodyEn.tex
          primaryDocument="articleEn.ttytex"
          ;;
      "pres+art:en")
          perhapsTouch presentationEn.ttytex
          sleep 1
          perhapsTouch articleEn.ttytex
          perhapsTouch presArtEn.ttytex   

          #NOTYET perhapsTouch bodyEn.tex
          primaryDocument="presentationEn.ttytex"
          ;;
      "art:fa")
          perhapsTouch articleFa.ttytex
          primaryDocument="articleFa.ttytex"
          ;;
      "art+pres:fa")
          perhapsTouch articleFa.ttytex
          sleep 1         
          perhapsTouch presentationFa.ttytex
          perhapsTouch presArtFa.ttytex
          
          #perhapsTouch bodyFa.tex
          primaryDocument="articleFa.ttytex"
          ;;
      "pres+art:fa")
          perhapsTouch presentationFa.ttytex
          sleep 1
          perhapsTouch articleFa.ttytex
          perhapsTouch presArtFa.ttytex   

          #perhapsTouch bodyFa.tex
          primaryDocument="presentationFa.ttytex"
          ;;
      "webpage"|"webpage:fa"|"webpage:en"|"webpage:en+fa"|"webpage:fa+en")
            perhapsTouch webpage.ttytex
            primaryDocument="webpage.ttytex"
            ;;
      "mailLcnt"|"mailLcnt:fa"|"mailLcnt:en"|"mailLcnt:en+fa"|"mailLcnt:fa+en")
          if [ "${lcntNu}" == "00000" ] ; then
              perhapsTouch mailLcnt.ttytex
              primaryDocument="mailLcnt.ttytex"
          else
              perhapsTouch webMailLcnt.ttytex
              primaryDocument="webMailLcnt.ttytex"
          fi
          ;;
      "pdf:")
          primaryDocument="PRIMARY.PDF"
          primaryDocument=$( ls -tr *.pdf 2> /dev/null | head -1 )
          ;;
      "html:")
          primaryDocument="PRIMARY.HTML"
          ;;
      *)
         EH_problem "Unknown multiFormats: ${multiFormats}"
         return 1
         ;;
    esac

    echo ${primaryDocument}
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_baseBlankStartSteps    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_baseBlankStartSteps {
  EH_assert [[ $# -le 1 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

  multiFormats="${srcForms}:${srcLangs}"

  srcBaseName=$1

  lcnLcntPre

  lcntPathAnalyze `pwd`

  vis_emptyCreateMulti

  ANT_raw "Next you need to assign this document a number by running:"
  ANT_raw "echo `pwd`/${primaryDocument} >> /lcnt/lgpc/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg"
  ANT_raw "Then assign a number in: /lcnt/lgpc/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg"

  ANT_raw "After that you need to run:"
  ANT_raw "${G_myName} -p cntntRawHome=. -p srcForms=\"${srcForms}\" -p srcLangs=\"${srcLangs}\" -i lcntRefresh"
  # NOTYET, this step can be eliminated and merged with lcntRefresh
  ANT_raw "Next run:"
  ANT_raw "${G_myName} -p cntntRawHome=. -p srcForms=\"${srcForms}\" -p srcLangs=\"${srcLangs}\" -i lcntBaseConfigMulti"

  ANT_raw "The document is now ready for customization in the ./LCNT-INFO Directory"

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntBaseStart    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBaseStart {
  EH_assert [[ $# -eq 2 ]]

  docFormat=$1

  docNameBase=$2

  lcnLcntPre

  lcntPathAnalyze `pwd`


  case ${docFormat} in 
    "ttytex"|"odp")
                    doNothing
            ;;
      *)
         EH_problem "Unknown docFormat: ${docFormat}"
         return 1
         ;;
    esac


  if [[ -f ${docNameBase}.${docFormat} ]] ; then
    EH_problem "${docNameBase}.${docFormat} Exists"
    opDo ls -l "${docNameBase}.${docFormat}"
  else
    opDo touch ${docNameBase}.${docFormat}
    opDo ls -l "${docNameBase}.${docFormat}"
  fi

  ANT_raw "Next you need to assign this document a number by running:"
  ANT_raw "echo `pwd`/"${docNameBase}.${docFormat}" >> /lcnt/lgpc/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg"
  ANT_raw "Then assign a number in: /lcnt/lgpc/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg"

  ANT_raw "After that you need to run:"
  ANT_raw "${G_myName} -p cntntRawHome=. -i lcntRefresh"

  ANT_raw "Then customize the ./LCNT-INFO Directory"

  ANT_raw "Finally run:"
  ANT_raw "${G_myName} -p cntntRawHome=. -i lcntBaseConfig article"

  return
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  configTheTemplate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function configTheTemplate {
    #set -x
    #opDo ls -l $1
    cat $1 | sed -e "s%@lcnt_mainTitle@%${lcnt_mainTitle}%g" \
       -e "s%@lcnt_subTitle@%${lcnt_subTitle}%g" \
       -e "s%@lcnt_subSubTitle@%${lcnt_subSubTitle}%g" \
       -e "s%@lcnt_version@%${lcnt_version}%g" \
       -e "s%@lcnt_url@%${lcnt_url}%g" \
       -e "s%@lcnt_author1@%${lcnt_author1}%g" \
       -e "s%@lcnt_date@%${lcnt_date}%g" \
       -e "s%@lcnt_organization@%${lcnt_organization}%g" \
       -e "s%@lcnt_lcntNu@%${lcnt_lcntNu}%g" \
       -e "s%@lcnt_shortTitle@%${lcnt_shortTitle}%g" \
       -e "s%@lcnt_type@%${lcnt_type}%g" \
       -e "s%@lcnt_url@%${lcnt_one_pubDestUrls}/${lcnt_url}%g" \
       -e "s%@lcnt_contentOrigin@%${lcnt_contentOrigin}%g" \
       -e "s%@lcnt_pubCategory@%${lcnt_pubCategory}%g" \
       -e "s%@lcnt_contentSrcFormat@%${lcnt_contentSrcFormat}%g" \
       -e "s%@lcnt_docGroup@%${lcnt_docGroup}%g" \
       -e "s%@lcnt_lcntQualifier@%${lcnt_lcntQualifier}%g" \
       -e "s%@lcnt_pubDestUrls@%${lcnt_pubDestUrls}%g" \
       -e "s%@lcnt_tag@%${lcnt_tag}%g" \
       -e "s%@lcnt_one_pubDestUrls@%${lcnt_one_pubDestUrls}%g" \
       -e "s%@lcnt_%@lcnt-%g" 

       # The last s/_/- is because latex barfs at _
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  configFormsLangsTemplate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function configFormsLangsTemplate {
    EH_assert [[ $# -eq 2 ]]
    templateFile=$1
    classSrcForms=$2

    cat ${templateFile} | sed -e "s%@srcForms@%${classSrcForms}%g" \
        -e "s%@srcLangs@%${lcnt_docSrcLangs}%g"
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntBaseConfigMulti    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBaseConfigMulti {
#set -x
  EH_assert [[ $# -le 1 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]
  EH_assert [[ "${cntntRawHome}_" != "INVALID_" ]]  

  lcntInfoPath="${cntntRawHome}/${lcntInfoDir}"
  
  if [ -z "${srcForms}" ] ; then
      if [ -f ${lcntInfoPath}/docSrcForms ] ; then
          srcForms=$( cat ${lcntInfoPath}/docSrcForms )
      else
          EH_problem "Missing ${lcntInfoPath}/docSrcForms"
          lpReturn 1
      fi
  fi

  if [ -z "${srcLangs}" ] ; then
      if [ -f ${lcntInfoPath}/docSrcLangs ] ; then
          srcLangs=$( cat ${lcntInfoPath}/docSrcLangs )
      else
          EH_problem "Missing ${lcntInfoPath}/docSrcLangs"
          lpReturn 1
      fi
  fi
  
  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  lcntInfoPath="./${lcntInfoDir}"

  multiFormats="${lcnt_docSrcForms}:${lcnt_docSrcLangs}"

  # /lcnt/lgpc/bystar/SOURCE-INFO/templates/artPresFrontEn.ttytex.start 
  docStartTemplateBase=${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/templates

  startLcntProcTemplate=""
  startLcntProcFile=""

  startDocPresArt=""
  startDocBodyArt=""
  startDocBodyPres=""

  case ${multiFormats} in 
      "memo:en+fa")
            startTemplateArticle="memoMainEnFa.ttytex.start"
            startDocArticle="memoEnFa.ttytex"
            startArtSrcForms="memo"

            startTemplatePresentation=""
            startDocPresentation=""
            startPresSrcForms=""

            startTemplateBody=""
            startDocBody=""
            startBodySrcForms=""
            ;;

      "memo:en")
            startTemplateArticle="memoMainEn.ttytex.start"
            startDocArticle="memoEn.ttytex"
            startArtSrcForms="memo"

            startTemplatePresentation=""
            startDocPresentation=""
            startPresSrcForms=""

            startTemplateBody=""
            startDocBody=""
            startBodySrcForms=""
            ;;

      "memo:fa+en")
            startTemplateArticle="memoMainFaEn.ttytex.start"
            startDocArticle="memoFaEn.ttytex"
            startArtSrcForms="memo"

            startTemplatePresentation=""
            startDocPresentation=""
            startPresSrcForms=""

            startTemplateBody=""
            startDocBody=""
            startBodySrcForms=""
            ;;

      "art+pres:en+fa"|"pres+art:en+fa")
            startTemplateArticle="artPresFrontEnFa.ttytex.start"
            startDocArticle="articleEnFa.ttytex"
            startArtSrcForms="art+pres"

            startTemplatePresentation="presArtFrontEnFa.ttytex.start"
            startDocPresentation="presentationEnFa.ttytex"
            startPresSrcForms="pres+art"

            # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/presArtMainEnFa.ttytex.begin
            startTemplatePresArt="presArtMainEnFa.ttytex.begin"
            startDocPresArt="presArtEnFa.ttytex"
            startPresArtSrcForms="pres+art"

            # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/bodyArticleEnFa.tex.begin
            startTemplateBodyArt="bodyArticleEnFa.tex.begin"
            startDocBodyArt="bodyArticleEnFa.tex"
            startBodyArtSrcForms="art+pres"

            # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/bodyPresArtEnFa.tex.begin
            startTemplateBodyPres="bodyPresArtEnFa.tex.begin"
            startDocBodyPres="bodyPresArtEnFa.tex"
            startBodyPresSrcForms="pres+art"
            ;;

      "art:en+fa"|"art:en")
            startTemplateArticle="articleFrontEnFa.ttytex.start"
            startDocArticle="articleEnFa.ttytex"
            startArtSrcForms="art"

            startTemplatePresentation=""
            startDocPresentation=""
            startPresSrcForms=""

            # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/bodyArticleOnlyEnFa.tex.begin
            startTemplateBody="bodyArticleOnlyEnFa.tex.begin"
            startDocBody="bodyArticleEnFa.tex"
            startBodySrcForms="art"
            ;;
      "art+pres:fa+en"|"pres+art:fa+en")
            startTemplateArticle="artPresFrontFaEn.ttytex.start"
            startDocArticle="articleFaEn.ttytex"
            startArtSrcForms="art+pres"

            startTemplatePresentation="artPresFrontFaEn.ttytex.start"
            startDocPresentation="presentationFaEn.ttytex"
            startPresSrcForms="pres+art"

            startTemplateBody="artPresBodyFaEn.tex.start"
            startDocBody="artPresBodyFaEn.tex"
            startBodySrcForms="art+pres"
            ;;
      "art+pres:en"|"pres+art:en")
            startTemplateArticle="artPresFrontEn.ttytex.start"
            startDocArticle="articleEn.ttytex"
            startArtSrcForms="art+pres"

            startTemplatePresentation="artPresFrontEn.ttytex.start"
            startDocPresentation="presentationEn.ttytex"
            startPresSrcForms="pres+art"

            startTemplateBody="artPresBodyEn.tex.start"
            startDocBody="artPresBodyEn.tex"
            startBodySrcForms="art+pres"
            ;;
      "art+pres:fa"|"pres+art:fa")
            startTemplateArticle="artPresFrontFa.ttytex.start"
            startDocArticle="articleFa.ttytex"
            startArtSrcForms="art+pres"

            startTemplatePresentation="artPresFrontFa.ttytex.start"
            startDocPresentation="presentationFa.ttytex"
            startPresSrcForms="pres+art"

            startTemplateBody="artPresBodyFa.tex.start"
            startDocBody="artPresBodyFa.tex"
            startBodySrcForms="art+pres"
            ;;
      "webpage"|"webpage:fa"|"webpage:en"|"webpage:en+fa"|"webpage:fa+en")
            # /lcnt/lgpc/bystar/SOURCE-INFO/templates/webPage.lcntProc.start
            startTemplateArticle="webpageMain.ttytex.start"
            startDocArticle="webpage.ttytex"
            startArtSrcForms="webpage"

            startTemplatePresentation=""
            startDocPresentation=""
            startPresSrcForms=""

            startTemplateBody=""
            startDocBody=""
            startBodySrcForms=""

            startLcntProcTemplate="webPage.lcntProc.start"
            startLcntProcFile="lcntProc.sh"

            ;;
      "mailLcnt"|"mailLcnt:en"|"mailLcnt:en+fa")
          if [ "${lcntNu}" == "00000" ] ; then
              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing00-mainEnFa.ttytex.begin
              startTemplateArticle="mailing00-mainEnFa.ttytex.begin"
              startDocArticle="mailLcnt.ttytex"
              startArtSrcForms="art+pres"

              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-bodyArticleEnFa.tex.begin
              startTemplateBodyArt="mailing-bodyArticleEnFa.tex.begin"
              startDocBodyArt="bodyArticleEnFa.tex"
              startBodyArtSrcForms="art+pres"
          else
              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-mainEnFa.ttytex.begin
              startTemplateArticle="mailing-mainEnFa.ttytex.begin"
              startDocArticle="webMailLcnt.ttytex"
              startArtSrcForms="art+pres"

              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-bodyArticleEnFa.tex.begin
              startTemplateBodyArt="mailing-bodyArticleEnFa.tex.begin"
              startDocBodyArt="bodyArticleEnFa.tex"
              startBodyArtSrcForms="art+pres"
          fi

          startTemplatePresentation=""
          startDocPresentation=""
          startPresSrcForms=""

          startTemplateBody=""
          startDocBody=""
          startBodySrcForms=""
          ;;

      "mailLcnt:fa"|"mailLcnt:fa+en")

          if [ "${lcntNu}" == "00000" ] ; then
              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing00-mainFaEn.ttytex.begin
              startTemplateArticle="mailing00-mainFaEn.ttytex.begin"
              startDocArticle="mailLcnt.ttytex"
              startArtSrcForms="art+pres"

              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-bodyArticleFaEn.tex.begin
              startTemplateBodyArt="mailing-bodyArticleFaEn.tex.begin"
              startDocBodyArt="bodyArticleFaEn.tex"
              startBodyArtSrcForms="art+pres"
          else
              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-mainFaEn.ttytex.begin
              startTemplateArticle="mailing-mainFaEn.ttytex.begin"
              startDocArticle="webMailLcnt.ttytex"
              startArtSrcForms="art+pres"

              # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/mailing-bodyArticleFaEn.tex.begin
              startTemplateBodyArt="mailing-bodyArticleFaEn.tex.begin"
              startDocBodyArt="bodyArticleFaEn.tex"
              startBodyArtSrcForms="art+pres"
          fi

          startTemplatePresentation=""
          startDocPresentation=""
          startPresSrcForms=""

          startTemplateBody=""
          startDocBody=""
          startBodySrcForms=""
          ;;

      
      "pdf:")
          ANT_cooked "StartTemplate not Applied To pdf"
          return 1
          ;;

      "html:")
          ANT_cooked "StartTemplate not Applied To html"
          return 1
          ;;
          
      *)
         EH_problem "Unknown multiFormats: ${multiFormats}"
         return 1
         ;;
    esac


   function applyTemplate {
       EH_assert [[ $# -eq 3 ]]
       templateFile=$1
       destFile=$2
       classSrcForms=$3

       if [[ -z ${templateFile} ]] ; then
           ANT_raw "empty templateFile skipped"
           return
       fi

       # /lcnt/lgpc/bystar/SOURCE-INFO/templates/
       # /lcnt/lgpc/bystar/SOURCE-INFO/templates/artPresFrontEn.ttytex.start 
       docSourceStartTemplateBase=${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/templates

       # /lcnt/lgpc/LGPC-INFO/templates
       if [[ -d ${lcntBaseDir}${lcntAttrGenPub}/LGPC-INFO/templatesOBSOLETED ]] ; then
           docLgpcStartTemplateBase=${lcntBaseDir}${lcntAttrGenPub}/LGPC-INFO/templates
       elif [[ -d /bisos/apps/defaults/begin/templates/purposed/lcnt/latex ]] ; then
           # /bisos/apps/defaults/begin/templates/purposed/lcnt/latex/
           docLgpcStartTemplateBase=/bisos/apps/defaults/begin/templates/purposed/lcnt/latex
       elif [ "${lcntNu}" = "00000" ] ; then
           # /lcnt/lgpc/bystar/SOURCE-INFO/templates/webpageMainStart.ttytex
           #docLgpcStartTemplateBase=${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/templates
           #docLgpcStartTemplateBase="/lcnt/lgpc/bystar/SOURCE-INFO/templates"
           docLgpcStartTemplateBase="/bisos/apps/defaults/begin/templates/purposed/lcnt/latex"
       else
           EH_problem "Missing /bisos/apps/defaults/begin/templates/purposed/lcnt/latex"
           return 101
       fi


       if [[ ! -f ${docSourceStartTemplateBase}/${templateFile} ]] ; then 
           if [[ ! -f ${docLgpcStartTemplateBase}/${templateFile} ]] ; then 
               if [[ ! -f /lcnt/lgpc/bystar/SOURCE-INFO/templates/${templateFile} ]] ; then 
                   EH_problem "${templateFile} Missing in ${docSourceStartTemplateBase} and ${docLgpcStartTemplateBase} and /lcnt/lgpc/LGPC-INFO/templates"
                   return 1
               else
                   templateFileFullPath=/lcnt/lgpc/bystar/SOURCE-INFO/templates/${templateFile}
               fi
           else
               templateFileFullPath=${docLgpcStartTemplateBase}/${templateFile}
           fi
       else
           templateFileFullPath=${docSourceStartTemplateBase}/${templateFile}
       fi

       if [[ -s ${destFile} ]] ; then
           FN_fileSafeKeep ${destFile}
       fi

       opDo eval "configFormsLangsTemplate ${templateFileFullPath} ${classSrcForms} > ${destFile}"

       # Capture What Template Was Used
       if [ ! -d ./LCNT-INFO/templates ] ; then
           opDo mkdir -p ./LCNT-INFO/templates
       fi
       echo "${templateFileFullPath}" > ./LCNT-INFO/templates/${destFile}
   }

   # NOTE: including args in "" is needed as empty args are sometimes passed through

   if [ ! -z "${startDocArticle}" ] ; then
       opDo applyTemplate "${startTemplateArticle}" "${startDocArticle}" "${startArtSrcForms}"
       echo ${startDocArticle} > ${lcntInfoPath}/artSrcFile
   fi

   if [ ! -z "${startDocPresentation}" ] ; then   
       opDo applyTemplate "${startTemplatePresentation}" "${startDocPresentation}" "${startPresSrcForms}"
       echo ${startDocPresentation} > ${lcntInfoPath}/presSrcFile
   fi

   if [ ! -z "${startDocPresArt}" ] ; then   
       opDo applyTemplate "${startTemplatePresArt}" "${startDocPresArt}" "${startPresArtSrcForms}"
       echo ${startDocPresArt} > ${lcntInfoPath}/presArtSrcFile
   fi

   if [ ! -z "${startDocBodyArt}" ] ; then   
       opDo applyTemplate "${startTemplateBodyArt}" "${startDocBodyArt}" "${startBodyArtSrcForms}"
   fi

   if [ ! -z "${startDocBodyPres}" ] ; then   
       opDo applyTemplate "${startTemplateBodyPres}" "${startDocBodyPres}" "${startBodyPresSrcForms}"
   fi

   # Generic -- Deprecated by startDocBodyArt and startDocBodyPres
   # MB: 2021 -- Needs to be revisited
   if [ ! -z "${startDocBody:-}" ] ; then
       opDo applyTemplate "${startTemplateBody}" "${startDocBody}" "${startBodySrcForms}"
   fi

   if [ ! -z "${startLcntProcFile}" ] ; then   
       opDo applyTemplate "${startLcntProcTemplate}" "${startLcntProcFile}" "${startArtSrcForms}"
   fi

   if [ -s ./lcntProc.sh ] ; then
       opDo chmod 775 ./lcntProc.sh
       opDo eval ./lcntProc.sh -i dblockUpdateFile $(./lcntProc.sh -i dblockApplicableFiles)
   else
       EH_problem  "Missing lcntProc.sh in $(pwd)"
   fi

   opDo vis_leafThereTag . lcntProc.sh

   opDo vis_bxtThereObjectTypeTag . "bxt.lcnt.latex.${srcForms}.${srcLangs}"

   opDo ./lcntProc.sh -v -n showRun -i lcntPrep
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntBaseConfig    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntBaseConfig {

  EH_assert [[ $# -eq 1 ]]

  docType=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  # /lcnt/lgpc/mohsen/SOURCE-INFO/templates
  docStartTemplateBase=${lcntBaseDir}${lcntAttrGenPub}/${lcntAttrSource}/SOURCE-INFO/templates

  case ${docType} in 
    "memo")
       docStartTemplate="${docStartTemplateBase}/texMemoStart.ttytex"
       ;;
    "article")
       docStartTemplate="${docStartTemplateBase}/texArticleStart.ttytex"
       ;;
    "book")
       docStartTemplate="${docStartTemplateBase}/texBookStart.ttytex"
       ;;
    *)
       EH_problem "Unknown docType: ${docType}"
       return 1
       ;;
  esac

  if [[ ! -f ${docStartTemplate} ]] ; then 
    EH_problem "${docStartTemplate} Missing"
    return 1
  fi

  lcnt_docSrcPrimary=`head -1 ./LCNT-INFO/docSrcList`

  docFileName="${lcnt_docSrcPrimary}.ttytex"

  FN_fileSafeKeep ${docFileName}

  configTheTemplate ${docStartTemplate} > ${docFileName}
  
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_reNumber    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_reNumber {

  EH_assert [[ $# -eq 1 ]]

  newNumber=$1

  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  lcntPathAnalyze ${cntntRawHome}

  lcntInfoPath="./${lcntInfoDir}"

  if [[ "${newNumber}" == "next" ]] ; then
       newNumber=$( vis_getNextNuForRegistration . )
        
  fi     
  echo ${newNumber}

  #lcntDocNumber=`vis_regNuShow`

  opDo eval "echo ${newNumber} > ${lcntInfoPath}/destPath5"
  opDo eval "echo ${newNumber} > ${lcntInfoPath}/lcntNu"
  opDo eval "echo ${lcnt_one_pubDestUrls}/${newNumber} > ${lcntInfoPath}/url"

  primaryDocPrefix=$( head -1 ${lcntInfoPath}/docSrcList )
  primaryDocName=${primaryDocPrefix}.${lcnt_contentSrcFormat}

  opDo eval "echo ${newNumber}: $( pwd )/"${primaryDocName}" >> ${lcntBaseDir}${lcntAttrGenPub}/${lcntSource_origin}/SOURCE-INFO/${lcntAttrPermanence}.reg"

  opDo ${opBinBase}/bx-dblock .

  ANT_raw "Afterwards remember to run:"
  ANT_raw "bystarLcntProc.sh -i lcntBasePrep"


}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_plpc2lcnt    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_plpc2lcnt {

  #echo $1
  lcnLcntPre

filesList="
author1
contentOrigin
date
description
docGroup
mainTitle
organization
pubCategory
pubDestUrls
shortTitle
subSubTitle
subTitle
url
version
"  
  if [[ ! -d ./LCNT-INFO ]] ; then 
    EH_problem ""
    return 1
  fi

  if [[ ! -d ./PLPC-INFO ]] ; then 
    EH_problem ""
    return 1
  fi

#set -x

 for thisFile in ${filesList[@]} ; do
   if [[ -f ./PLPC-INFO/${thisFile} ]] ; then
     FN_fileSafeKeep ./LCNT-INFO/${thisFile}
     opDo cp ./PLPC-INFO/${thisFile} ./LCNT-INFO/${thisFile}
   fi
 done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntFullRenew    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntFullRenew {

  lcnLcntPre

  FN_fileSafeKeep ./lcntProc.sh
  
  if [[ -d ./${lcntInfoDir} ]] ; then 
    docNu=`cat ./${lcntInfoDir}/lcntNu`
    FN_dirSafeKeep ./${lcntInfoDir}
  else
    EH_problem "Missing ./${lcntInfoDir}"
    return 1
  fi


  lcntDocNumber=`vis_regNuShow`
 
  if [[ "${docNu}_" != "${lcntDocNumber}_" ]] ; then 
    EH_problem "./${lcntInfoDir}/lcntNu dont match:  ${docNu} vs ${lcntDocNumber}"
    return
  fi

  vis_lcntRefresh

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntRefresh    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntRefresh {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

  multiFormats="${srcForms}:${srcLangs}"

  lcnLcntPre

  lcntDocNumber=`vis_regNuShow`

  if [[ "${lcntDocNumber}_" == "_" ]] ; then 
    EH_problem "No Document Number has been assigned for ${here:-}"
    EH_problem "Register a document number first"
    return
  fi


  if [[ -d ./${lcntInfoDir} ]] ; then 
    docNu=`cat ./${lcntInfoDir}/lcntNu`
    if [[ "${docNu}_" != "${lcntDocNumber}_" ]] ; then 
      EH_problem "./${lcntInfoDir}/lcntNu dont match:  ${docNu} vs ${lcntDocNumber}"
      return
    fi
    ANT_raw "${lcntInfoDir} -- Already In Place  -- Being Refreshed"
    # Anything else that can be safely done should be done now.

    #vis_lcntInfoGen
    opDo vis_lcntInfoRenew    # Deals with missing srcForms, srcLangs
  else
    vis_lcntInfoGen
  fi

  if [[ ! -s ${cntntRawHome}/lcntProc.sh ]]; then
      #opDo cp /opt/public/osmt/sysConfigInput/docProc/basicLcntProc.sh ./lcntProc.sh
      opDo cp /bisos/apps/defaults/begin/templates/purposed/lcnt/bash/lcntProc.leaf.sh ./lcntProc.sh
      opDo bx-dblock -i dblockUpdateFileOrIgnore ./lcntProc.sh
      opDo cp /bisos/apps/defaults/begin/templates/purposed/lcnt/org/beginPanel.org ./Panel.org
  else
      ANT_raw "lcntProc.sh -- Already In Place  -- Move it out of the way if you want it refreshed."
  fi


}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntNodeRefresh    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntNodeRefresh {
  EH_assert [[ $# -eq 0 ]]

  lcnLcntPre

  if [[ ! -s ${cntntRawHome}/lcntProc.sh ]]; then
      #opDo cp /opt/public/osmt/sysConfigInput/docProc/basicLcntProc.sh ./lcntProc.sh
      opDo cp /bisos/apps/defaults/begin/templates/purposed/lcnt/bash/lcntProc.Dirs.sh ./lcntProc.sh
      opDo bx-dblock -i dblockUpdateFileOrIgnore ./lcntProc.sh
  else
      ANT_raw "lcntProc.sh -- Already In Place  -- Move it out of the way if you want it refreshed."
  fi

  opDo vis_nodeThereTag . lcntProc.sh
  
  opDo vis_bxtThereObjectTypeTag . "bxt.lcnt.latex"
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntInfoReport    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoReport {
  lcnLcntPre
  lcntInfoPrep ${cntntRawHome}
  lcntInfoReport
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntInfoRenew    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoRenew {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    lcnLcntPre

    if [ ! -d ./${lcntInfoDir} ] ; then 
        EH_problem "Missing ./${lcntInfoDir}"
        lpReturn 101
    fi

    lcntInfoPath=./"${lcntInfoDir}"

    if [ -s "${lcntInfoPath}/docSrcForms" ]; then
        srcForms=$( cat ${lcntInfoPath}/docSrcForms )
    else
        ANT_raw "ASSUMED:  srcForms=art"
        srcForms="art"
    fi

    if [ -s "${lcntInfoPath}/docSrcLangs" ]; then
        srcLangs="$( cat ${lcntInfoPath}/docSrcLangs )"
    else
        ANT_raw "ASSUMED:  srcLangs=en"
        srcLangs="en"
    fi
        
    opDo vis_lcntInfoGen

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntInfoGen  *Primary*  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoGen {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${srcForms}_" != "INVALID_" ]]
  EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

  local lcntSource_bystarUid=$(id -u -n)

  #set -x
  lcnLcntPre

  lcntInfoPath="./${lcntInfoDir}"
  lcntPathAnalyze ${cntntRawHome}
  lcntDocNumber=`vis_regNuShow`

  FN_dirCreatePathIfNotThere ${lcntInfoPath}

    function fvNameValueSet {
        EH_assert [[ $# -eq 3 ]]
        local baseDirPath=$1
        local fvName=$2
        local fvValue=$3
        local fvNamePath="${baseDirPath}/${fvName}"
        
        if [[ ! -s "${fvNamePath}" ]]; then
            echo "${fvValue}" > "${fvNamePath}"
        else
            ANT_cooked "Exists"
        fi
    }

    opDo fvNameValueSet "${lcntInfoPath}" "articleForm" "article"
    opDo fvNameValueSet "${lcntInfoPath}" "lcntName" $( FN_nonDirsPart $( pwd ))   
    

 for thisFile in ${lcntFilesList[@]} ; do
   if [[ ! -f ${lcntInfoPath}/${thisFile} ]] ; then
    touch ${lcntInfoPath}/${thisFile}
   fi
 done

 if [[ ! -s ${lcntInfoPath}/contentSrcFormat ]]; then
   if [[ "${lcntAttrPermanence}_" == "sw_" ]] ; then
     srcFilesList=`ls -tr *.tar *.deb *.gz 2> /dev/null`
     echo "tar" > ${lcntInfoPath}/contentSrcFormat
     if [[ -n ${srcFilesList} ]] ; then
       typeset thisName
       for thisName in ${srcFilesList} ; do
         integer count=1
         echo "${thisName}" > ${lcntInfoPath}/publishable${count}
         count=`expr $count + 1`
       done
     fi
     echo ${lcntDocNumber} > ${lcntInfoPath}/docSrcList
   else
     srcFilesList_ttytex=`ls -tr *.ttytex 2> /dev/null`
     srcFilesList_pdf=`ls -tr *.pdf 2> /dev/null`
     srcFilesList_odp=`ls -tr *.odp 2> /dev/null`
     
     if [[ -n ${srcFilesList_ttytex} ]] ; then
       echo "ttytex" > ${lcntInfoPath}/contentSrcFormat
       typeset thisDoc
       integer count=1
       for thisDoc in ${srcFilesList_ttytex} ; do
         fileName=`FN_nonDirsPart ${thisDoc}`
         filePrefixName=$( FN_prefix "${fileName}" )
         echo "${filePrefixName}" >> ${lcntInfoPath}/docSrcList
         echo "${filePrefixName}.pdf" > ${lcntInfoPath}/publishable${count}
         count=`expr $count + 1`
       done
     elif [[ -n ${srcFilesList_pdf} ]] ; then
       echo "pdf" > ${lcntInfoPath}/contentSrcFormat
       typeset thisDoc
       integer count=1
       for thisDoc in ${srcFilesList_pdf} ; do
         fileName=`FN_nonDirsPart ${thisDoc}`
         FN_prefix "${fileName}" >> ${lcntInfoPath}/docSrcList
         echo "${thisDoc}" > ${lcntInfoPath}/publishable${count}
         count=`expr $count + 1`
       done
     elif [[ -n ${srcFilesList_odp} ]] ; then
       echo "odp" > ${lcntInfoPath}/contentSrcFormat
       integer count=1
       typeset thisDoc
       for thisDoc in ${srcFilesList_odp} ; do
         typeset fileName=`FN_nonDirsPart ${srcFilesList_odp}`
         FN_prefix "${fileName}" >> ${lcntInfoPath}/docSrcList
         echo "${fileName}.pdf" > ${lcntInfoPath}/publishable${count}
         count=`expr $count + 1`

       done

     fi
   fi
 fi

 guessedTitle=${lcntAttrHomeRelBase}    #### `cat ${lcntInfoPath}/docSrcList`



 if [[ ! -s ${lcntInfoPath}/accessPageInclusion ]]; then
     if [ "${srcForms}" == "pdf" ] ; then
         echo "pdf" > ${lcntInfoPath}/accessPageInclusion
     else
         echo "html" > ${lcntInfoPath}/accessPageInclusion
     fi
 fi

 if [[ ! -s ${lcntInfoPath}/bystarUid ]]; then
   echo ${lcntSource_bystarUid} > ${lcntInfoPath}/bystarUid
 fi

 if [[ ! -s ${lcntInfoPath}/contentOrigin ]]; then
   echo ${lcntSource_origin} > ${lcntInfoPath}/contentOrigin
 fi

 if [[ ! -s ${lcntInfoPath}/author1 ]]; then
   echo ${lcntSource_author1} > ${lcntInfoPath}/author1
 fi

 if [[ ! -s ${lcntInfoPath}/pubDestUrls ]]; then
   echo ${lcntSource_pubDestUrls} > ${lcntInfoPath}/pubDestUrls
 fi

 if [[ ! -s ${lcntInfoPath}/organization ]]; then
   #opDo eval echo ${lcntSource_organization} \> ${lcntInfoPath}/organization
     echo ${lcntSource_organization} > ${lcntInfoPath}/organization
 fi

 if [[ ! -s ${lcntInfoPath}/docSrcForms ]]; then
   echo ${srcForms} > ${lcntInfoPath}/docSrcForms
 fi
 
 if [[ ! -s ${lcntInfoPath}/docSrcLangs ]]; then
   echo ${srcLangs} > ${lcntInfoPath}/docSrcLangs
 fi

 case ${srcLangs} in 
   "enOnly")  # enOnly was introduced when xelatex fully replaced latex (MB:2018)
         docSrcProcessor=latex
         if [[ ! -s ${lcntInfoPath}/docSrcProcessor ]]; then
             echo "latex" > ${lcntInfoPath}/docSrcProcessor
         fi
         ;;
   "fa"|"fa+en"|"en+fa"|"en")   
         docSrcProcessor=xelatex
         if [[ -s ${lcntInfoPath}/docSrcProcessor ]]; then
             FN_fileSafeKeep ${lcntInfoPath}/docSrcProcessor
         fi
         echo "xelatex" > ${lcntInfoPath}/docSrcProcessor        
         ;;
   "")
         ANT_cooked "Unspecified Language"
         ;;
   *)
      EH_problem "Unknown srcLangs: ${srcLangs}"
      return 1
      ;;
 esac

 if [[ -s ${lcntInfoPath}/pubFormats ]]; then
     ANT_raw "Over Writing ${lcntInfoPath}/pubFormats"
     echo Inactive FN_fileSafeKeep ${destFile:-}  # destFile: unbound variable
 fi
 typeset this_srcFormat=`cat ${lcntInfoPath}/contentSrcFormat`
 if [ "${this_srcFormat}_" == "ttytex_" ] || [ "${this_srcFormat}_" == "odp_" ] ; then
     if [ "${docSrcProcessor}" == "latex" ] ; then
         echo "pdf+ps+tex4ht" > ${lcntInfoPath}/pubFormats
     elif [ "${docSrcProcessor}" == "xelatex" ] ; then
         echo "pdf+heveaHtml" > ${lcntInfoPath}/pubFormats
     else
         EH_problem "Unknown : docSrcProcessor ${docSrcProcessor}"
         return 1
     fi
 elif [[ "${this_srcFormat}_" == "pdf_" ]] ; then
     echo "pdf" > ${lcntInfoPath}/pubFormats
 else
     echo "" > ${lcntInfoPath}/pubFormats
 fi

 if [ "${lcntNu:-}" = "00000" ] ; then
     lcntAttrPermanence="permanent"
 fi
 
 case ${lcntAttrPermanence} in 
   "record")
             echo "Records" > ${lcntInfoPath}/pubCategory
             echo "${lcntAttrPermanence}" > ${lcntInfoPath}/type
             if [[ ! -s ${lcntInfoPath}/lcntQualifier ]] ; then
               echo "Presentation" > ${lcntInfoPath}/lcntQualifier
             fi
             ;;
   "permanent")
                echo "PLPC" > ${lcntInfoPath}/pubCategory
                echo "PLPC" > ${lcntInfoPath}/type
                if [[ ! -s ${lcntInfoPath}/lcntQualifier ]] ; then
                  echo "current" > ${lcntInfoPath}/lcntQualifier
                fi
                ;;
   "draft")
            echo "DRAFT" > ${lcntInfoPath}/pubCategory
             echo "${lcntAttrPermanence}" > ${lcntInfoPath}/type
            if [[ ! -s ${lcntInfoPath}/lcntQualifier ]] ; then
              echo "current" > ${lcntInfoPath}/lcntQualifier
            fi
            ;;

   "repub")
             echo "Repub" > ${lcntInfoPath}/pubCategory
             echo "${lcntAttrPermanence}" > ${lcntInfoPath}/type
             if [[ ! -s ${lcntInfoPath}/lcntQualifier ]] ; then
               echo "Republish" > ${lcntInfoPath}/lcntQualifier
             fi
             ;;
   "sw")
             echo "SW" > ${lcntInfoPath}/pubCategory
             echo "${lcntAttrPermanence}" > ${lcntInfoPath}/type
             if [[ ! -s ${lcntInfoPath}/lcntQualifier ]] ; then
               echo "current" > ${lcntInfoPath}/lcntQualifier
             fi
             ;;
   *)
      EH_problem "Unknown lcntAttrPermanence: ${lcntAttrPermanence}"
      return 1
      ;;
 esac


 typeset wasDocGroup=`cat ${lcntInfoPath}/docGroup`
 if [ "${wasDocGroup}_" == "UnSpecifiedDocGroup_" ] ||  [ ! -s ${lcntInfoPath}/docGroup ] ; then 
   echo "${lcntAttrGroup}" > ${lcntInfoPath}/docGroup
 fi

 if [[ ! -s ${lcntInfoPath}/date ]]; then
   date +"%B %d, %C%y" > ${lcntInfoPath}/date
 fi

 if [[ ! -s ${lcntInfoPath}/lcntNu ]]; then
   echo "${lcntDocNumber}" > ${lcntInfoPath}/lcntNu
 fi

 if [[ ! -s ${lcntInfoPath}/url ]]; then
   primaryDestUrl=`head -1 ${lcntInfoPath}/pubDestUrls`
   docNu=`cat ${lcntInfoPath}/lcntNu`
   pubCat=`cat ${lcntInfoPath}/pubCategory`
   echo "http://${primaryDestUrl}/${pubCat}/${docNu}" > ${lcntInfoPath}/url
 fi

 if [[ ! -s ${lcntInfoPath}/version ]]; then
    echo "0.1" > ${lcntInfoPath}/version
 fi

 if [[ ! -s ${lcntInfoPath}/mainTitle ]]; then
   echo "${guessedTitle}" > ${lcntInfoPath}/mainTitle
 fi

 if [[ ! -s ${lcntInfoPath}/shortTitle ]]; then
   echo "${guessedTitle}" > ${lcntInfoPath}/shortTitle
 fi

 if [[ ! -s ${lcntInfoPath}/subTitle ]]; then
   echo "" > ${lcntInfoPath}/subTitle
 fi

 if [[ ! -s ${lcntInfoPath}/subSubTitle ]]; then
   echo "" > ${lcntInfoPath}/subSubTitle
 fi

 if [[ ! -s ${lcntInfoPath}/description ]]; then
   echo "UnspecifiedDescription" > ${lcntInfoPath}/description
 fi

 
 if [[ ! -s ${lcntInfoPath}/subSubTitle ]]; then
   echo "" > ${lcntInfoPath}/subSubTitle
 fi


 if [ "${lcntNu}" = "00000" ] ; then
     # /content/generated/doc.free/bystar/PLPC/00000/current/
     echo "generated" > ${lcntInfoPath}/destPath1
     echo "doc.free" > ${lcntInfoPath}/destPath2
     echo "bystar" > ${lcntInfoPath}/destPath3
     echo "PLPC" > ${lcntInfoPath}/destPath4
     echo "00000" > ${lcntInfoPath}/destPath5
     echo "current" > ${lcntInfoPath}/destPath6
 else

     pathToArray ${baseDir}
     
     if [[ "${pathArray[0]}_" == "info_" ]] ; then 
         case ${pathArray[1]} in
             "externalLimited")
                 echo "republished" > ${lcntInfoPath}/destPath1
                 echo "doc.limited" > ${lcntInfoPath}/destPath2
                 ;;
             "externalPublic")
                 echo "republished" > ${lcntInfoPath}/destPath1
                 echo "doc.public" > ${lcntInfoPath}/destPath2
                 ;;
             *)
                 EH_problem ""
                 ;;
         esac

         echo "${pathArray[2]}" > ${lcntInfoPath}/destPath3
         echo "${pathArray[3]}" > ${lcntInfoPath}/destPath4
         echo "${pathArray[4]}" > ${lcntInfoPath}/destPath5
         echo "${pathArray[5]}" > ${lcntInfoPath}/destPath6
     fi

     if [ "${pathArray[0]}" == "de" ] ; then
         pathArray=("${pathArray[@]:1}") # removes the first element
     fi
     if [ "${pathArray[0]}" == "sys" ] ; then
         pathArray=("${pathArray[@]:1}") # removes the first element
     fi

     if [[ "${pathArray[0]}_" == "lcnt_" ]] ; then 
         case ${pathArray[3]} in
             "permanent"|"record"|"draft")
             echo "generated" > ${lcntInfoPath}/destPath1
             echo "doc.free" > ${lcntInfoPath}/destPath2
             cat  ${lcntInfoPath}/contentOrigin >${lcntInfoPath}/destPath3
             cat  ${lcntInfoPath}/pubCategory >${lcntInfoPath}/destPath4
             cat  ${lcntInfoPath}/lcntNu >${lcntInfoPath}/destPath5
             typeset this_category=`cat  ${lcntInfoPath}/pubCategory`
             if [[ "${this_category}_" == "PLPC_" ]] ; then
                 typeset this_moduleName="current"
             else
                 typeset this_moduleName="`cat ${lcntInfoPath}/lcntQualifier`"
             fi
             echo "${this_moduleName}" >${lcntInfoPath}/destPath6
             ;;
             "repub")
                 echo "republished" > ${lcntInfoPath}/destPath1
                 echo "doc.public" > ${lcntInfoPath}/destPath2
                 echo "${pathArray[4]}" > ${lcntInfoPath}/destPath3
                 echo "${pathArray[5]}" > ${lcntInfoPath}/destPath4
                 echo "${pathArray[6]}" > ${lcntInfoPath}/destPath5
                 echo "${pathArray[7]}" > ${lcntInfoPath}/destPath6
                 ;;
             *)
                 if [[ "${pathArray[1]}_" == "sw_" ]] ; then
                     echo "generated" > ${lcntInfoPath}/destPath1
                     echo "sw.free" > ${lcntInfoPath}/destPath2
                     echo "${pathArray[2]}" > ${lcntInfoPath}/destPath3
                     echo "${pathArray[3]}" > ${lcntInfoPath}/destPath4
                     echo "${pathArray[4]}" > ${lcntInfoPath}/destPath5
                     echo "${pathArray[5]}" > ${lcntInfoPath}/destPath6
                     typeset this_moduleName="`cat ${lcntInfoPath}/lcntQualifier`"
                     echo "${this_moduleName}" >${lcntInfoPath}/destPath7
                 else
                     EH_problem "${pathArray[3]}: Unexpected"
                 fi
                 ;;
         esac
     else
         ANT_raw "Not Based at /lcnt -- run pwd"
     fi
 fi

 readmeOutput > ${lcntInfoPath}/README
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_infoAll    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_infoAll {
  lcnLcntPre
  lcntInfoPrep
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntEntryGens    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntEntryGens {
  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  infoDocEntryFileName="./${lcnt_pubCategory}-${lcnt_lcntNu}-docEntry.info"
 
  #contentBaseDir="/content/`cat ./${lcntInfoDir}/destPath1`/`cat ./${lcntInfoDir}/destPath2`/`cat ./${lcntInfoDir}/destPath3`/`cat ./${lcntInfoDir}/destPath4`/`cat ./${lcntInfoDir}/destPath5`/`cat ./${lcntInfoDir}/destPath6`"
  
  cat  > ${infoDocEntryFileName}  << _EOF_
docBaseDir=${cntntRawHome}
contentBaseDir=${docModulePath}

_EOF_

lcntInfoReport >> ${infoDocEntryFileName}

ls -l ${infoDocEntryFileName}

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntEntryClean    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntEntryClean {
  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  infoDocEntryFileName="./${lcnt_pubCategory}-${lcnt_lcntNu}-docEntry.info"
 
  FN_fileRmIfThere ${infoDocEntryFileName}

  #/bin/rm "./${lcnt_pubCategory}-${lcnt_lcntNu}-docEntry.html"
  #/bin/rm "./${lcnt_pubCategory}-${lcnt_lcntNu}-docEntry.bib"
 
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_accessPagePublish    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_accessPagePublish {
  lcnLcntPre

  lcntInfoPrep ${cntntRawHome}

  # /content/generated/doc.free/neda/PLPC/100107/current/

  contentBaseDir=${docModulePath}
  
  thisDocBaseName=`head -1 ${lcntInfoPath}/docSrcList`

  accessPageFullName=${contentBaseDir}/${lcnt_lcntNu}-access.html


  function expandStar {
cat << _EOF_ | sed -e 's/\*/Star/g'
${lcnt_shortTitle}
_EOF_
}
 

  plusShortTitle=$( expandStar | sed -e 's/ /+/g' )

  typeset thisDest
  for thisDest in ${lcnt_pubDestUrls} ; do

    opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="/${lcnt_pubCategory}" -p siteurl=${thisDest} -i createPloneFolder
  
    #opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="${lcnt_lcntNu}" -p title="${lcnt_pubCategory}-${lcnt_lcntNu}:+${plusShortTitle}" -p inputFile="${accessPageFullName}" -p description="" -p siteurl=${thisDest}/${lcnt_pubCategory} -i addDoc_and_publish

    opDo lcaPloneCommands.sh -p siteFqdn=${thisDest} -p userName=zopemanager -p password=zopemanager -p siteFolder="/${lcnt_pubCategory}" -p sitePage="${lcnt_lcntNu}" -p title="${lcnt_pubCategory}-${lcnt_lcntNu}:+${plusShortTitle}"  -p description="" -p inputFile="${accessPageFullName}" -i ploneUploadHtmlAndPublish

    #opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p id="AccessPage" -p title="Access+Page+for+${lcnt_pubCategory}+${lcnt_lcntNu}" -p inputFile="${accessPageFullName}" -p description="" -p siteurl=${thisDest}/${contentBaseDir} -i addDoc_and_publish

    opDo lcaPloneCommands.sh -p siteFqdn=${thisDest} -p userName=zopemanager -p password=zopemanager -p siteFolder="${contentBaseDir}" -p sitePage="AccessPage" -p title="Access+Page+for+${lcnt_pubCategory}+${lcnt_lcntNu}"  -p description="" -p inputFile="${accessPageFullName}" -i ploneUploadHtmlAndPublish

   # Although this is not the right place to put this figureInclusion,
   # it just makes sense since we have all of the information needed at this stage.

    if [[ "${lcnt_accessPageInclusion}_" != "_" ]] ; then
      typeset figuresInclusion=`ls ${contentBaseDir}/${thisDocBaseName}/*.png 2> /dev/null`
      typeset oneFigure
      if [[ "${figuresInclusion}_" != "_" ]] ; then
        for oneFigure in ${figuresInclusion}; do
          this_id=`FN_nonDirsPart ${oneFigure}`
          opDo lcaPloneAdmin.sh -p username=zopemanager -p password=zopemanager -p title="Figure+${this_id}" -p inputFile="${oneFigure}" -p id="${this_id}" -p siteurl=${thisDest}/PLPC -i addExternalFile  
        done
      fi
    fi

   done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_lcntInfoFullRenew    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoFullRenew {
    G_funcEntry
    function describeF {  cat  << _EOF_
_EOF_
                       }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${cntntRawHome}" ] ; then
        cntntRawHome=.
    fi

    opDo lcnLcntGens.sh -n showRun -p cntntRawHome="${cntntRawHome}" -i lcntInfoRenew

    opDo vis_lcntBuildInfoGens

    opDo vis_lcntReleaseInfoGens

    opDo vis_lcntExportInfoGens

    if [ -d ./LCNT-INFO/Builds/art-8.5x11 ] ; then
        opDo lcntProc.sh -i lcntBuildSetCur ./LCNT-INFO/Builds/art-8.5x11
    elif [ -d ./LCNT-INFO/Builds/presPdf ] ; then
        opDo lcntProc.sh -i lcntBuildSetCur ./LCNT-INFO/Builds/presPdf
    elif [ -d ./LCNT-INFO/Builds/memo-8.5x11 ] ; then
        opDo lcntProc.sh -i lcntBuildSetCur ./LCNT-INFO/Builds/memo-8.5x11
    else
        EH_problem "Missing  presPdf or art-8.5x11 or memo-8.5x11 in ./LCNT-INFO/Builds"
    fi

    opDo lcntProc.sh -i lcntExportSetCur ./LCNT-INFO/Exports/ploneProc

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_lcntInfoRenewCustomize    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_lcntInfoRenewCustomize {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${srcForms}_" != "INVALID_" ]]
    EH_assert [[ "${srcLangs}_" != "INVALID_" ]]

    multiFormats="${srcForms}:${srcLangs}"

    lcnLcntPre

    lcntInfoPath="./${lcntInfoDir}"
    lcntPathAnalyze ${cntntRawHome}
    lcntDocNumber=`vis_regNuShow`

    #if [[ ! -s ${lcntInfoPath}/author1 ]]; then
        opDo eval echo REGISTRY/author/MohsenBanan \> ${lcntInfoPath}/author1
    #else
        #ANT_cooked "${lcntSource_author1} -- Untouched"
    #fi

    #if [[ ! -s ${lcntInfoPath}/organization ]]; then
        opDo eval echo REGISTRY/organization/fpf \> ${lcntInfoPath}/organization
    #else
        #ANT_cooked "${lcntSource_organization} -- Untouched"
    #fi
}


###  JUNK YARD

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF   ::  vis_parseFormTest    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_parseFormTest {
  lcnLcntPre

  colLetfSide=`Column_leftSide $1`

  rightSide=`Column_rightSide $1`

  attachList=""
  while [ "${rightSide}X" != "X" ] ; do
    leftSide=`Plus_leftSide ${rightSide}`
    attachList="${attachList} ${leftSide}"
    if [ "${leftSide}X" == "${rightSide}X" ] ; then
      break
    fi
    rightSide=`Plus_rightSide ${rightSide}`
  done

  echo ${colLetfSide} ${attachList}
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

