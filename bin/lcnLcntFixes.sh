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

. ${lcntBinBase}/lcnLcntLib.sh

# PRE parameters
typeset -t doc=""
typeset -t firstRun=""


function G_postParamHook {
  if [[ "${doc}_" != "_" ]] ; then

   docList=""

   typeset thisDoc
   for thisDoc in ${doc} ; do
     docList="${docList} ${thisDoc}"
   done
  fi
}

function vis_examples {
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
  typeset extraInfo="-n showRun"

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- FIXES  ---
${G_myName} ${extraInfo} -i fixemail 
${G_myName} ${extraInfo} -i fixDblockParams  *.tex
${G_myName} ${extraInfo} -i inhibitedpToDisabledP
${G_myName} ${extraInfo} -i newfontinstance  # To newfontfamily
--- Bib Item --
--- FIXES ---
${G_myName} ${extraInfo} -i fixlcntDirsProc
${G_myName} ${extraInfo} -i dirsRecurse fixPubFormats
${G_myName} ${extraInfo} -i dirsRecurse fixAccessPageInclusion
${G_myName} ${extraInfo} -i dirsRecurse fixDescHtmlFormat
${G_myName} ${extraInfo} -i dirsRecurse fixAuthorsFormat
${G_myName} ${extraInfo} -i dirsRecurse fixOrgFormat
${G_myName} ${extraInfo} -i dirsRecurse fixAddFpfOrg

_EOF_
}

function vis_help {
 cat  << _EOF_

 SEE lcnLcntRoadmap.sh for the big picture.

_EOF_

}

function vis_todo {
 cat  << _EOF_

 - Cleanup overlap with lcnLcntOutputs.sh
_EOF_
}

function noArgsHook {
  vis_examples
}

function vis_newfontinstance {

  #set -x
  typeset currentDir=$(pwd)
  typeset fileList=$(find ${currentDir}/ -type f -print | grep -v CVS | grep ttytex | xargs egrep -l '^\\newfontinstance')

  
  typeset oneFile
  for oneFile in ${fileList} ; do
      echo ${oneFile}
      opDo cp ${oneFile} ${oneFile}.$$
      cat ${oneFile}.$$ | sed -e "s%^\\\\newfontinstance%\\\\newfontfamily%g" > ${oneFile}
      opDo /bin/rm ${oneFile}.$$
  done
  

}


function vis_inhibitedpToDisabledP {

  #set -x
  typeset currentDir=$(pwd)
  typeset fileList=$(find ${currentDir}/ -type f -print | grep -v CVS | xargs grep -l "inhibitedP")
  
  typeset oneFile
  for oneFile in ${fileList} ; do
      echo ${oneFile}
      opDo cp ${oneFile} ${oneFile}.$$
      cat ${oneFile}.$$ | sed -e "s%inhibitedP%disabledP%g" > ${oneFile}
      opDo /bin/rm ${oneFile}.$$
  done
  

}


function vis_fixDblockParams {
    typeset fileList=$@
  
    typeset oneFile
    for oneFile in ${fileList} ; do
	echo Processing ${oneFile}
	opDo cp ${oneFile} ${oneFile}.$$
	opDo eval "cat ${oneFile}.$$ | sed -e 's%bx:dblock:lcnt:latex-section :disabledP \"false\"%bx:dblock:lcnt:latex-section :mode \"auto\"%g' > ${oneFile}"
	opDo /bin/rm ${oneFile}.$$
    done
}




function vis_fixemail {

  ANT_raw "Edit this script to suit your search string and comment the return 0 line"
  #return 0
    

  set -x
  typeset currentDir=`pwd`
  #typeset fileList=`find ${currentDir}/ -print | grep .ttytex$ | xargs grep -l andrew.hammoude.1.byname.net`
  #typeset fileList=`find ${currentDir}/ -print | grep .ttytex$ | xargs grep -l "libre (at) andrew.hammoude.1.byname.net"`
  typeset fileList=`find ${currentDir}/ -print | grep .ttytex$ | xargs grep -l "libre (at) mohsen.banan.1.byname.net"`
  typeset fileList=`find ${currentDir}/ -print | grep .ttytex$ | xargs grep -l "mohsen@neda.com"`
  typeset oneFile
  for oneFile in ${fileList} ; do
    fileBaseDir=`dirname ${oneFile}`
    cd ${fileBaseDir}
    print ${oneFile}
    cp ${oneFile} ${oneFile}.$$
    #cat ${oneFile}.$$ | sed -e "s%\htmladdnormallink{public@andrew.hammoude.1.byname.net}{mailto:public@andrew.hammoude.1.byname.net}%\htmladdnormallink{http://andrew.hammoude.1.byname.net/ContactMe}{http://andrew.hammoude.1.byname.net/ContactMe}%g" > ${oneFile}
    #cat ${oneFile}.$$ | sed -e "s%libre (at) andrew.hammoude.1.byname.net%\htmladdnormallink{http://andrew.hammoude.1.byname.net/ContactMe}{http://andrew.hammoude.1.byname.net/ContactMe}%g" > ${oneFile}
    #cat ${oneFile}.$$ | sed -e "s%libre (at) mohsen.banan.1.byname.net%\htmladdnormallink{http://mohsen.banan.1.byname.net/ContactMe}{http://mohsen.banan.1.byname.net/ContactMe}%g" > ${oneFile}
cat ${oneFile}.$$ | sed -e "s%mohsen@neda.com%http://mohsen.banan.1.byname.net/ContactMe%g" > ${oneFile}
    /bin/rm ${oneFile}.$$
  done
  

}

function vis_fixlcntDirsProc {
  typeset thisOne=""
  typeset currentDir=`pwd`
  typeset here=${currentDir}

  for thisOne in ${dirsList} ; do
    opDoComplain cd ${currentDir} || return
    print "#### ${currentDir} ####"
    if [ -f lcntDirsProc.sh ] ; then
	sed -e 's:seedLcntFullProc.sh:seedLcntProc.sh:g' lcntDirsProc.sh > lcntProc.sh
	#FN_fileSafeKeep lcntDirsProc.sh 
	opDo chmod 775 lcntProc.sh
	opDo ls -l ${currentDir}/lcntProc.sh
    else
      EH_assert [[ -f lcntProc.sh ]]
    fi
    currentDir=${here}/${thisOne}
  done
}

function vis_fixPubFormats {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/pubFormats ] ; then 
	return
    fi

    lcntPubFormats=`cat ./LCNT-INFO/pubFormats`

    if [ "${lcntPubFormats}_" == "html+pdf+ps_" ] ; then
	echo "pdf+ps+tex4ht" > ./LCNT-INFO/pubFormats
	ls -l ./LCNT-INFO/pubFormats
    else
	echo ${lcntPubFormats}
    fi

}

function vis_fixAccessPageInclusion {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/pubFormats ] ; then 
	return
    fi

    lcntPubFormats=`grep tex4ht ./LCNT-INFO/pubFormats`

    if [ "${lcntPubFormats}_" != "_" ] ; then
	echo "html" > ./LCNT-INFO/accessPageInclusion
	opDo ls -l ./LCNT-INFO/accessPageInclusion
    fi

}

function vis_fixType {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/type ] ; then 
	return
    fi

    echo "document" > ./LCNT-INFO/type
    opDo ls -l ./LCNT-INFO/type
}

function vis_fixDescHtmlFormat {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/description ] ; then 
	return
    fi

    lcntDescFormats=`grep -i html  ./LCNT-INFO/description`

    if [ "${lcntDescFormats}_" == "_" ] ; then
	opDo mv ./LCNT-INFO/description ./LCNT-INFO/description.$$
	txt2html ./LCNT-INFO/description.$$ > ./LCNT-INFO/description
	opDo ls -l ./LCNT-INFO/description
    fi

}

function vis_fixAuthorsFormat {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/author1 ] ; then 
	return
    fi
    
    typeset authorRegistry="REGISTRY/author"
    typeset tmpFile="/tmp/author.$$"
    author_count=`ls ./LCNT-INFO/author[0-9] | wc -l`
    for (( i=1;i<=${author_count};i++ )) ; do
      cat  ./LCNT-INFO/author${i} | sed -e "s:Mohsen Banan:${authorRegistry}/MohsenBanan:g" \
       -e "s:Andrew Hammoude:${authorRegistry}/AndrewHammoude:g" > ${tmpFile}
      cat ${tmpFile} > ./LCNT-INFO/author${i}
    done
    

}

function vis_fixOrgFormat {

   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    if [ ! -f ./LCNT-INFO/organization ] ; then 
	return
    fi
    
    typeset orgRegistry="REGISTRY/organization"
    typeset tmpFile="/tmp/org.$$"
    cat  ./LCNT-INFO/organization | sed -e "s:Neda Communications, Inc.:${orgRegistry}/Neda:g" \
     -e "s:Free Protocols Foundation:${orgRegistry}/fpf:g" > ${tmpFile}
    cat ${tmpFile} > ./LCNT-INFO/organization

}


function vis_fixAddFpfOrg {
   isDirsProcessor && return $?

    EH_assert [[ -f lcntProc.sh ]]

    typeset orgRegistry="REGISTRY/organization"

    if [ ! -f ./LCNT-INFO/organization ] ; then 
	return
    fi
    

    wordNu=$( /usr/bin/wc -w LCNT-INFO/organization | cut -d ' ' -f 1 )
    if [ "${wordNu}_" == "0_" ] ; then 
	echo ${orgRegistry}/fpf > ./LCNT-INFO/organization
    fi
}
