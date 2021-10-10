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


function vis_help {
 cat  << _EOF_

TODO:

    Look into simplifying based on lpXargsParam.sh -- 

    

 Lcnt Sifter

A--
  1) Given a list of LCNTs

  2) Apply a particular function to all of them

  3) Sift through based on a selection criteria

B-- 
  Combinations of the above 

_EOF_
}


# PRE parameters
typeset -t inListLcntNu=""
typeset -t outListLcntNue=""

function G_postParamHook {
  inListLcntNu=$( FN_absolutePathGet ${inListLcntNu} )
  outListLcntNu=$( FN_absolutePathGet "${outListLcntNu:-}" )
  return 0
}

G_myPanel="/libre/ByStar/InitialTemplates/activeDocs/bxServicesDev/publications.org"

function vis_examples {
 typeset extraInfo="-h -v -n showRun"
 typeset visLibExamples=`visLibExamplesOutput ${G_myName}`

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- Locate a Document ---
${G_myName} 100001
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i findLcntBaseDir
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i findLcntInfoBaseDir
--- Lcnt: Test/Report ---
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i testLcntFunc isAuthor mohsen
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i testLcntFunc isPrimaryAuthor mohsen
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i testLcntFunc isPublisher fpf
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i testLcntFunc isPrimaryPubSite www.neda.com
${G_myName} ${extraInfo} -p lcntNu=PLPC-100001 -i testLcntFunc isPubSite www.neda.com
--- Selector/Sift ---
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p outListLcntNu="/tmp/$$.lcntNu" -i siftLcntFunc isAuthor mohsen
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p outListLcntNu="/tmp/$$.lcntNu" -i siftLcntFunc isPrimaryAuthor mohsen
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p outListLcntNu="/tmp/$$.lcntNu" -i siftLcntFunc isPublisher fpf
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p outListLcntNu="/tmp/$$.lcntNu" -i siftLcntFunc isPrimaryPubSite www.neda.com
${G_myName} ${extraInfo} -p inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir" -p outListLcntNu="/tmp/$$.lcntNu" -i siftLcntFunc isPubSite www.neda.com
--- Locate a Frequently Used Document ---
/acct/employee/lsipusr/org/agenda/bystar/publications.org
${G_myName} 180016  # Libre-Halaal ByStar Digital Ecosystem
${G_myName} 120039  # Introducing Halaal and Haraam into Globish
${G_myName} 120033  # Nature Of Poly-Existentials
${G_myName} 180044  # Libre-Halaal Software
${G_myName} 180045  # Libre-Halaal Services
${G_myName} 100101  # Libre Services Concept
${G_myName} 180047  # ByStar Reference Model -- Now BISOS
${G_myName} 180050  # Interactive Command Modules And Players (ICM)
${G_myName} 180048  # Current ByStar Services and Capabilities
${G_myName} 180004  # Blee
${G_myName} 180043  # ByStar Engineers' Promise
${G_myName} 180014  # Neda Business Plan
${G_myName} 120042  # The For-Profit and Non-Proprietary Quadrant -- To Become Poly-Existential Capitalism
${G_myName} 180038  # ByStar Content Production (Authorship) and Content Publication Facilities
${G_myName} 180051  # Multi Account Resident Mail Exchanger (MARME)
${G_myName} 180052  # Generalized Open-Source Self Organizing Netowrk Of Things (GOSSONoT)
${G_myName} 180039  # ByStar Inter-Personal Communication Facilities
${G_myName} 180002  # Using ByStar Autonomous Libre Services -- ByStarEntity Capabilities
${G_myName} 180041  # ByStar Engineering Notes
${G_myName} 120038  # Introducing Globish Into Globish
${G_myName} 120047  # Introducing Libre Into Globish
${G_myName} 120037  # Introducing Convivial Into Globish
${G_myName} 120043  # Introducing East And West Into Globish
${G_myName} 180011  # Overview Of ByStar DE Presentation
${G_myName} 180042  # ByStar Examples Presentation (Demo)
${G_myName} 180040  # Joining, Adopting and/or Licensing ByStar -- Proposal
${G_myName} 180054  # Screencast -- An Overview Of ByStar With Pointers For Digging Deeper
---
${G_myName} 120036  # Persian Input Methods
${G_myName} 180046  # FOSS vs Libre Halaal Services
---
${G_myName} -i gotoPanel
_EOF_
}


noArgsHook() {
    if [[ $# -eq 0 ]] ; then
	vis_examples
	return
    fi

    lcntNu=$1

    vis_findLcntBaseDir

#     case "$1" in
# 	force-reload)
#             forced-reload $@			     
# 	    ;;
# 	*)
# 	    echo "Usage: $0 {start|stop|reload|force-reload|restart}"
# 	    exit 1
# 	    ;;
#     esac
}



function isAuthor {

  EH_assert [[ $# -eq 1 ]]

  if [[ "${inListLcntNu}_" == "_" ]] ; then
    inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  fi

  EH_assert [[ -f ${inListLcntNu} ]]

  testingForAuthor=$1
  
  typeset foundDocNu=`grep ^${lcntNu}: ${inListLcntNu}`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntBaseDir="`echo ${foundDocNu} | cut -d ':' -f2`"
    typeset this_lcntInfoBaseDir="${this_lcntBaseDir}/LCNT-INFO"
    typeset this_docAuthor=`find ${this_lcntInfoBaseDir}/ -print | grep author[0-9]$ | xargs grep -i ${testingForAuthor}`
    if [[ -n ${this_docAuthor} ]] ; then
      return 0
    else
      return 1
    fi
  else
    return 2
  fi

}

function isPrimaryAuthor {

  EH_assert [[ $# -eq 1 ]]

  if [[ "${inListLcntNu}_" == "_" ]] ; then
    inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  fi

  EH_assert [[ -f ${inListLcntNu} ]]

  testingForAuthor=$1
  
  typeset foundDocNu=`grep ^${lcntNu}: ${inListLcntNu}`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntBaseDir="`echo ${foundDocNu} | cut -d ':' -f2`"
    typeset this_lcntInfoBaseDir="${this_lcntBaseDir}/LCNT-INFO"
    typeset this_docAuthor=`cat ${this_lcntInfoBaseDir}/author1 | grep -i ${testingForAuthor}`
    if [[ -n ${this_docAuthor} ]] ; then
      return 0
    else
      return 1
    fi
  else
    return 2
  fi

}

function isPublisher {
  EH_assert [[ $# -eq 1 ]]

  if [[ "${inListLcntNu}_" == "_" ]] ; then
    inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  fi
  
  EH_assert [[ -f ${inListLcntNu} ]]

  testingForPublisher=$1

  typeset foundDocNu=`grep ^${lcntNu}: ${inListLcntNu}`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntBaseDir="`echo ${foundDocNu} | cut -d ':' -f2`"
    typeset this_lcntInfoBaseDir="${this_lcntBaseDir}/LCNT-INFO"
    typeset this_docPublisher=`cat ${this_lcntInfoBaseDir}/organization | grep -i ${testingForPublisher}`
    if [[ -n ${this_docPublisher} ]] ; then
      return 0
    else
      return 1
    fi
  else
    return 2
  fi

}

function isPrimaryPubSite {

  EH_assert [[ $# -eq 1 ]]

  if [[ "${inListLcntNu}_" == "_" ]] ; then
    inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  fi

  EH_assert [[ -f ${inListLcntNu} ]]

  testingForPubSite=$1
  
  typeset foundDocNu=`grep ^${lcntNu}: ${inListLcntNu} | head -1`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntBaseDir="`echo ${foundDocNu} | cut -d ':' -f2`"
    typeset this_lcntInfoBaseDir="${this_lcntBaseDir}/LCNT-INFO"
    this_lcnt_one_pubDestUrls=`head -1 ${this_lcntInfoBaseDir}/pubDestUrls`
    if [[ "${this_lcnt_one_pubDestUrls}_" == "${testingForPubSite}_" ]] ; then
      return 0
    else
      return 1
    fi
  else
    return 2
  fi

}

function isPubSite {

  EH_assert [[ $# -eq 1 ]]

  if [[ "${inListLcntNu}_" == "_" ]] ; then
    inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir"
  fi

  EH_assert [[ -f ${inListLcntNu} ]]

  testingForPubSite=$1
  
  typeset foundDocNu=`grep ^${lcntNu}: ${inListLcntNu} | head -1`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntBaseDir="`echo ${foundDocNu} | cut -d ':' -f2`"
    typeset this_lcntInfoBaseDir="${this_lcntBaseDir}/LCNT-INFO"
    cat ${this_lcntInfoBaseDir}/pubDestUrls | 
    while read this_line ; do
      if [[ "${this_line}_" == "${testingForPubSite}_" ]] ; then
	return 0
      fi
    done
    return 1
  else
    return 2
  fi

}

function vis_testLcntFunc {
  EH_assert [[ $# -gt 0 ]]

  ANT_raw "Scanning with $@ document ${lcntNu}"

  $@ ; retVal=$?
   if [ "${retVal}" == "0" ]; then
      ANT_raw "  MATCH : ${lcntNu} : $@"
  else
      ANT_raw "NO MATCH: ${lcntNu} : $@"
  fi
}


function vis_siftLcntFunc {
  EH_assert [[ $# -gt 0 ]]

  ANT_raw "Scanning with $@ in ${inLcntDoc}"
  FN_fileSafeMove ${outListLcntNu} ${outListLcntNu}.$$

   typeset oneNu
   cat ${inListLcntNu} | 
   while read line ; do
     lcntNu=`echo ${line} | cut -d ':' -f 1 `
     $@ ; retVal=$?
     if [ "${retVal}" == "0" ]; then
      echo ${line} >> ${outListLcntNu}
      ANT_raw "  MATCH : ${lcntNu} : $@"
    else
      ANT_raw "NO MATCH: ${lcntNu} : $@"
    fi
  done
  opDo ls -l ${outListLcntNu}
}

function vis_findLcntInfoBaseDir {

  typeset justNu="`echo ${lcntNu} | cut -d '-' -f2`"
  typeset this_lcntBaseDir="/lcnt"
  typeset foundDocNu=`find ${this_lcntBaseDir}/ -print | grep lcntNu$ | xargs grep -i ${justNu}`

  if [[ -n ${foundDocNu} ]] ; then
    typeset this_lcntInfoBaseDir="`echo ${foundDocNu} | cut -d ':' -f1 | xargs dirname`"
    #print ${lcntNu}: ${this_lcntInfoBaseDir}
    print ${this_lcntInfoBaseDir}
    lcntBaseDir=$( FN_dirsPart ${this_lcntInfoBaseDir} )
    ANT_raw "pushd ${lcntBaseDir}"
    return 0
  else
    ANT_raw "${lcntNu} : NOT FOUND"
  fi

}


function vis_findLcntBaseDir {
    #set -x

  typeset justNu="`echo ${lcntNu} | cut -d '-' -f2`"
  typeset this_lcntBaseDir="/lcnt"
  typeset foundDocNu=`find ${this_lcntBaseDir}/ -follow -print | grep lcntNu$ | xargs grep -i ${justNu}`

  #echo ${foundDocNu}

  for thisOne  in ${foundDocNu} ; do

      #echo ${thisOne}

  if [[ -n ${thisOne} ]] ; then
    typeset this_lcntInfoBaseDir="`echo ${thisOne} | cut -d ':' -f1 | xargs dirname`"
    lcntBaseDir=$( FN_dirsPart ${this_lcntInfoBaseDir} )
    print "${lcntBaseDir}"
    grep "${lcntBaseDir}" /lcnt/outputs/all/lists/nuBaseDir 1>&2
    ANT_raw "pushd ${lcntBaseDir}"
    #return 0
  else
    ANT_raw "${lcntNu} : NOT FOUND"
  fi
  done

}


