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
  typeset one_inListLcntNu="/lcnt/outputs/all/lists/nuBaseDir.importance"

 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- INFO  ---
${G_myName} ${extraInfo} -i help
${G_myName} ${extraInfo} -i todo
--- Obtain all the necessary files into localhost /content/generated directories ----
${G_myName} ${extraInfo} -i obtainFiles PLPC-100011
${G_myName} ${extraInfo} -i obtainFiles PLPC-100011 PLPC-120025
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i obtainFiles all
--- Remote upload all the files ---
${G_myName} ${extraInfo} -i remoteUpload PLPC-100011
${G_myName} ${extraInfo} -i remoteUploadInRsync PLPC-100011
${G_myName} ${extraInfo} -i commonFiguresCopyUpdate /rsync/lcnt/PLPC/180038/current/pres/PLPC-180038-pres.html /rsync/lcnt/common/figures
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i remoteUpload all
--- On Remote Make External Files Visible ---
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i ploneSync all
${G_myName} ${extraInfo} -p inListLcntNu=${one_inListLcntNu} -i ploneSync  PLPC-100011 PLPC-120025
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

function vis_obtainFiles {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]] ; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    if opDo getLcntNuBase ${oneDocEntry} ; then 
      # NOTYET, Do we really need to use getLcntNuBase
      # when we just want to add a single new document
      #
      # Below will only work with a single current document
      #
      lcntNu=$( lcnLcntOutputs.sh -p cntntRawHome=. -i lcntNuStdout | cut -d ":" -f1 ) 
      cntntRawHome=$( lcnLcntOutputs.sh -p cntntRawHome=. -i lcntNuStdout | cut -d ":" -f2 )
      if [ "${lcntNu}_" == "_" ] ; then 
        EH_problem "document not found"
        opDo pwd
        return 101
      fi
    fi

    opDo lcntPathAnalyze "${cntntRawHome}"
    if [ "${lcntAttrPermanence}_" == "sw_" ] || [ "${lcntAttrPermanence}_" == "repub_" ] ; then
      opDo obtainPublishableFiles "${lcntNu}" "${cntntRawHome}"
    else
      opDo obtainPLPCFiles "${lcntNu}" "${cntntRawHome}"
      opDo obtainPublishableFiles "${lcntNu}" "${cntntRawHome}"
    fi
  done

}

function vis_obtainExportFiles {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]] ; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    if opDo getLcntNuBase ${oneDocEntry} ; then 
      # NOTYET, Do we really need to use getLcntNuBase
      # when we just want to add a single new document
      #
      # Below will only work with a single current document
      #
      lcntNu=$( lcnLcntOutputs.sh -p cntntRawHome=. -i lcntNuStdout | cut -d ":" -f1 ) 
      cntntRawHome=$( lcnLcntOutputs.sh -p cntntRawHome=. -i lcntNuStdout | cut -d ":" -f2 )
      if [ "${lcntNu}_" == "_" ] ; then 
        EH_problem "document not found"
        opDo pwd
        return 101
      fi
    fi

    opDo lcntPathAnalyze "${cntntRawHome}"
    if [ "${lcntAttrPermanence}_" == "sw_" ] || [ "${lcntAttrPermanence}_" == "repub_" ] ; then
      opDo obtainPublishableFiles "${lcntNu}" "${cntntRawHome}"
    else
        opDo obtainPLPCExportFiles "${lcntNu}" "${cntntRawHome}"
        #
        # NOTYET
        #
        #opDo obtainPublishableFiles "${lcntNu}" "${cntntRawHome}"
    fi
  done

}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  obtainPLPCExportBasePrep  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function obtainPLPCExportBasePrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    #if vis_reRunAsRoot G_thisFunc $@ ; then lpReturn globalReRunRetVal; fi;    

    if [ ! -d /rsync ] ; then
        opDo sudo mkdir /rsync
        opDo sudo chown lsipusr:employee /rsync
    fi

    opDo FN_dirCreatePathIfNotThere /rsync/lcnt

    # NOTYET, node_modules needs to be setup

    lpReturn
}       

function lcntMmBasesExportPrep {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local cntntRawHome="$1"
    local exportPathBase="$2"    

    if [ -d "${cntntRawHome}/image" ] ; then
        opDo FN_dirCreatePathIfNotThere ${exportPathBase}/image
        opDo cp -p ${cntntRawHome}/image/*.pdf ${exportPathBase}/image
        opDo cp -p ${cntntRawHome}/image/*.png ${exportPathBase}/image
    else
        ANT_raw "Skipped: Missing ${cntntRawHome}/image"
    fi

    if [ -d "${cntntRawHome}/audio" ] ; then
        opDo FN_dirCreatePathIfNotThere ${exportPathBase}/audio
        opDo cp -p ${cntntRawHome}/audio/*.mp3 ${exportPathBase}/audio
    else
        ANT_raw "Skipped: Missing ${cntntRawHome}/audio"
    fi

    if [ -d "${cntntRawHome}/video" ] ; then
        opDo FN_dirCreatePathIfNotThere ${exportPathBase}/video
        opDo cp -p ${cntntRawHome}/video/*.mp4 ${exportPathBase}/video
    else
        ANT_raw "Skipped: Missing ${cntntRawHome}/video"
    fi

    opDo FN_fileSymlinkUpdate /rsync/lcnt/common/figures ${exportPathBase}/figures 

    

    lpReturn
}       

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  commonFiguresCopyUpdate  [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_commonFiguresCopyUpdate {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    local inFileWithFigures=$1
    local figuresDestBaseDir=$2

    opDo FN_dirCreatePathIfNotThere ${figuresDestBaseDir}

    local filesList=$( grep "./figures" ${inFileWithFigures} | sed 's:.*/figures/\(.*\)\".:\1:' )

    for each in ${filesList} ; do
        if [ -f /lcnt/lgpc/bystar/permanent/common/figures/${each} ] ; then
            opDo cp /lcnt/lgpc/bystar/permanent/common/figures/${each} ${figuresDestBaseDir}
        fi
    done
    
    lpReturn
}       





_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  obtainPLPCExportFiles  [[elisp:(org-cycle)][| ]]
_CommentEnd_

function obtainPLPCExportFiles {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset lcntNu="$1"
    typeset lcntBaseDir="$2"
  
    print "####### Obtain Files for ${lcntNu} ##############"
  
    cntntRawHome="${lcntBaseDir}"
    lcntInfoPrep ${cntntRawHome}

    opDo obtainPLPCExportBasePrep

    opDo mkdir -p ${docModuleExportPath}

    opDo lcntMmBasesExportPrep ${cntntRawHome} ${docModuleExportPath}

    local lcntSrcType
    for this_docSrcList in ${lcnt_docSrcList} ; do
        lcntSrcType=$( vis_determineSrcType "${cntntRawHome}" "${this_docSrcList}" )

        typeset thisOneFormat
        for thisOneFormat in ${lcnt_pubFormats} ; do

            print ${cntntRawHome} ${thisOneFormat} ${lcntSrcType}  ${docModuleExportPath} -- ${this_docSrcList}

            function notyetSupported {
                echo "NOTYET Supported"
            }

            function badLcntSrcType {
                EH_problem "Bad Doc: ${this_docSrcList} ${lcntSrcType}"
            }
            
            case ${thisOneFormat} in
                "heveaHtml")
                    if [ "${lcntSrcType}" == "presentation" ]  ; then
                        # What we really want is the reveal.js files
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/pres
                        opDoComplain /bin/cp --no-dereference ${cntntRawHome}/revealJsBase/* ${docModuleExportPath}/pres
                        opDoComplain /bin/cp ${docModuleExportPath}/pres/${this_docSrcList}.html ${docModuleExportPath}/pres/${lcntNu}-pres.html

                        vis_commonFiguresCopyUpdate ${docModuleExportPath}/pres/${lcntNu}-pres.html /rsync/lcnt/common/figures
                        
                        opDoComplain /bin/ls -l ${docModuleExportPath}/pres/${lcntNu}-pres.html
                    elif [ "${lcntSrcType}" == "article" ]  ; then
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/art
                        opDoComplain /bin/cp --no-dereference ${cntntRawHome}/heveaHtml-${this_docSrcList}/* ${docModuleExportPath}/art
                        opDoComplain /bin/mv ${docModuleExportPath}/art/index.html ${docModuleExportPath}/art/${lcntNu}-art.html
                        opDoComplain /bin/ls -l ${docModuleExportPath}/art/${lcntNu}-art.html
                    elif [ "${lcntSrcType}" == "presArt" ]  ; then
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/presArt
                        opDoComplain /bin/cp --no-dereference ${cntntRawHome}/heveaHtml-${this_docSrcList}/* ${docModuleExportPath}/presArt
                        opDoComplain /bin/mv ${docModuleExportPath}/presArt/index.html ${docModuleExportPath}/presArt/${lcntNu}-presArt.html
                        opDoComplain /bin/ls -l ${docModuleExportPath}/presArt/${lcntNu}-presArt.html
                    else
                        badLcntSrcType
                    fi
                    ;;
                
                "pdf")
                    if [ "${lcntSrcType}" == "presentation" ]  ; then
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/pres
                        opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.pdf ${docModuleExportPath}/pres/${lcntNu}-pres.pdf
                        opDoComplain /bin/ls -l ${docModuleExportPath}/pres/${lcntNu}-pres.pdf
                    elif [ "${lcntSrcType}" == "article" ]  ; then
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/art
                        opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.pdf ${docModuleExportPath}/art/${lcntNu}-art.pdf
                        opDoComplain /bin/ls -l ${docModuleExportPath}/art/${lcntNu}-art.pdf
                    elif [ "${lcntSrcType}" == "presArt" ]  ; then
                        opDo FN_dirCreatePathIfNotThere ${docModuleExportPath}/presArt
                        opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.pdf ${docModuleExportPath}/presArt/${lcntNu}-presArt.pdf
                        opDoComplain /bin/ls -l ${docModuleExportPath}/presArt/${lcntNu}-presArt.pdf
                    else
                        badLcntSrcType
                    fi
                    ;;
                
                "ps")
                    notyetSupported
                    ;;
                
                "odp")
                    notyetSupported
                    ;;
                
                "tty")
                    notyetSupported
                    ;;
                
                "ttyClean")
                    notyetSupported
                    ;;
                
                *)
                    EH_problem "UnKnown Type: ${thisOneFormat}"
                    return 0
                    ;;
            esac
        done
    done
}


function obtainPLPCFiles {

  typeset lcntNu="$1"
  typeset lcntBaseDir="$2"
  
  print "####### Obtain Files for ${lcntNu} ##############"
  
  cntntRawHome="${lcntBaseDir}"
  lcntInfoPrep ${cntntRawHome}

for this_docSrcList in ${lcnt_docSrcList} ; do

  typeset thisOneFormat
  for thisOneFormat in ${lcnt_pubFormats} ; do
    case ${thisOneFormat} in
      #"html"|"tex4ht")
        "tex4ht")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}/${this_docSrcList}
           opDoComplain /bin/cp ${cntntRawHome}/tex4ht-${this_docSrcList}/* ${docModulePath}/${this_docSrcList}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}/index.html
         ;;
        "heveaHtml")
            if egrep 'documentclass.*beamer' ${this_docSrcList}.ttytex ; then
                ANT_raw "Skipping: obtainPLPCFiles of ${this_docSrcList}"
            else
                opDo FN_dirCreatePathIfNotThere ${docModulePath}/${this_docSrcList}
                opDoComplain /bin/cp ${cntntRawHome}/heveaHtml-${this_docSrcList}/* ${docModulePath}/${this_docSrcList}
                opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}/index.html
            fi
         ;;
        "html"|"genHtml")
                 # ODP presentations (ooimpress, ...)
                 #
           opDo FN_dirCreatePathIfNotThere ${docModulePath}/${this_docSrcList}

           opDoComplain /bin/cp ${cntntRawHome}/${this_docSrcList}/* ${docModulePath}/${this_docSrcList}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}/index.html
         ;;
      "pdf")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}
           opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.pdf ${docModulePath}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}.pdf
           ;;
      "ps")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}
           opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.ps ${docModulePath}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}.ps
           ;;
      "odp")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}
           opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.odp ${docModulePath}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}.odp
           ;;
      "tty")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}
           opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.tty ${docModulePath}
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}.tty
           ;;
      "ttyClean")
           opDo FN_dirCreatePathIfNotThere ${docModulePath}
           opDoComplain FN_fileCopy ${cntntRawHome}/${this_docSrcList}.ttyClean ${docModulePath}/${this_docSrcList}.tty
           opDoComplain /bin/ls -l ${docModulePath}/${this_docSrcList}.tty
           ;;
      *)
           EH_problem "UnKnown Type: ${thisOneFormat}"
           return 0
           ;;
    esac
  done
done
}

function obtainPublishableFiles {
  typeset lcntNu="$1"
  typeset lcntBaseDir="$2"
  
  print "####### Obtain Files for ${lcntNu} ##############"
  
  cntntRawHome="${lcntBaseDir}"
  lcntInfoPrep ${cntntRawHome}

  publishable_list=`ls ${lcntInfoPath}/publishable[0-9] 2> /dev/null`
  opDo FN_dirCreatePathIfNotThere ${docModulePath}
  typeset onePublishable
  if [ "${publishable_list}_" == "_" ] ; then
    opDo obtainPLPCFiles $1 $2
  else
    for onePublishable in ${publishable_list} ; do
      typeset thisFileName=`cat ${onePublishable}`
      opDoComplain /bin/cp ${cntntRawHome}/${thisFileName} ${docModulePath}
      opDoComplain /bin/ls -l ${docModulePath}/${thisFileName}
    done
  fi
}

function vis_remoteUpload {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}

    lcntInfoPrep ${cntntRawHome}

    typeset thisDest
    for thisDest in ${lcnt_pubDestUrls} ; do
      opDo  mmaRsyncAdmin.sh -p rsyncOptions="--relative --stats" -p destHost=${thisDest} -p dest=/ -p source=${docModulePath} -i localToRemoteUpdate
    done
  done

}

function vis_remoteUploadInRsync {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}

    lcntInfoPrep ${cntntRawHome}

    typeset thisDest
    for thisDest in ${lcnt_pubDestUrls} ; do
      opDo  mmaRsyncAdmin.sh -p rsyncOptions="--relative --stats" -p destHost=${thisDest} -p dest=/rsync -p source=${docModulePath} -i localToRemoteUpdate
    done
  done

}



function vis_ploneSync {

  EH_assert [[ $# -gt 0 ]]

  typeset docEntries="$@"

  typeset oneDocEntry
  for oneDocEntry in ${docEntries}; do
    if [[ "${oneDocEntry}_" == "all_" ]]; then
      EH_assert [ -f  ${inListLcntNu} ]
      goThroughList ${inListLcntNu} ${visibleFunction}
      return
    fi

    opDo getLcntNuBase ${oneDocEntry}

    cntntRawHome="${cntntRawHome}"
    lcntInfoPrep ${cntntRawHome}

    typeset thisDest
    for thisDest in ${lcnt_pubDestUrls} ; do
      opDo lcaPloneAdmin.sh -h -v -n showRun -p username=zopemanager -p password=zopemanager -p id="${docModulePath}" -p siteurl=${thisDest} -i externalFileSyncTree
    done

  done

}
