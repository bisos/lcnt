#!/bin/bash


IcmBriefDescription="Seed For Processing LCNT."

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedLcntProc.sh,v 1.51 2020-03-02 17:25:47 lsipusr Exp $"
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
*  /This File/ :: /bisos/core/bsip/bin/seedLcntProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

function vis_help {
  vis_howTo

  cat  << _EOF_

TODO:
=====


_EOF_
}


function vis_howTo {
  cat  << _EOF_

Both  
   -i envelopeProc
and 
  -i labelProc <col> <row?

Go to printer.

LabelProc takes two args that position on one of the 6 labels.


_EOF_
}




. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh
. ${opBinBase}/opDoAtAsLib.sh
# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh


. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh
#. ${opBinBase}/mmaLib.sh
#. ${opBinBase}/mmaQmailLib.sh
#. ${opBinBase}/mmaDnsLib.sh

# /opt/public/osmt/bin/bystarInfoBase.libSh 
. ${opBinBase}/bystarInfoBase.libSh

. ${opBinBase}/lpCurrents.libSh

function vis_examples {

  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
---  Documentation / How-To  ---
${G_myName} ${extraInfo}  -i howTo
---  INFORMATION  ---
${G_myName} ${extraInfo}  -i envLabProcInfo
---  INFORMATION  ---
${G_myName} ${extraInfo}  -i envLabProcGen
--- Recurse Dirs ---
${G_myName} ${extraInfo}  -i dirsRecurse fullUpdate all
${G_myName} ${extraInfo}  -i dirsRecurse fullClean all
--- FULL MANIPULATORS ---
${G_myName} ${extraInfo}  -i  fullUpdate
${G_myName} ${extraInfo}  -i  fullClean
--- LOCAL CREATIONS -- INITIAL Pages/Folders/CONTENT ---
${G_myName} ${extraInfo} -i envelopeTexFullStdout
${G_myName} ${extraInfo} -i envelopeProcPdf
${G_myName} ${extraInfo} -i envelopeProcLpr
${G_myName} ${extraInfo} -i personalEnvTexFullStdout
${G_myName} ${extraInfo} -i personalEnvProcPdf
${G_myName} ${extraInfo} -i labelProc 1 1
${G_myName} ${extraInfo} -i labelProc 1 2
--- DEVELOPMENT MODE ---
${G_myName} ${extraInfo} -i devTools
_EOF_

hookRun "examplesHookPost"
}



function vis_devTools {
  #typeset extraInfo=""
  typeset extraInfo="-v -n showRun"

  sitePagesList=`echo ${sitePages}`

cat  << _EOF_
--- FOR DEVELOPERS  ---
---  INFORMATION  ---
${G_myName} ${extraInfo}  -i bystarAcctPathInfo
_EOF_
}


function noArgsHook {
  vis_examples
}


function vis_dirsRecurse {

  
  typeset thisOne=""
  typeset currentDir=`pwd`

  print "#### ${currentDir} ####"

  opDoComplain ${G_myName} -n showRun -i "$@"

  for thisOne in ${siteFolders} ; do
    opDoComplain cd ${currentDir}/${thisOne} || return
    print "#### ${currentDir}/${thisOne} ####"
    
    opDoComplain ${G_myName} -n showRun -i "$@"

    opDoComplain ${G_myName} -n showRun -i dirsRecurse "$@"
  
  done
}

function vis_labelProc {
    opDo mkdir /tmp/$$.envLabProc
    opDo cd /tmp/$$.envLabProc
    
    vis_labelTexFullStdout $@ > label.tex

    #/usr/curenv/bin/latexmake label.ps
    latex  label.tex
    dvips -f -t letter  label.dvi > label.ps

    opDo lpr /tmp/$$.envLabProc/label.ps
    opDo ls -l /tmp/$$.envLabProc/label.ps
}



function vis_labelTexFullStdout {

    vis_envelopeTexBeginStdout $@

    vis_labelTexPrinterStdout $@

    vis_envelopeTexOriginatorStdout $@

    vis_envelopeTexRecepientsStdout $@

    vis_envelopeTexEndStdout $@
}


function vis_envelopeProcLpr {
    opDo mkdir /tmp/$$.envLabProc
    opDo cd /tmp/$$.envLabProc
    
    vis_envelopeTexFullStdout > envelope.tex

    #/usr/curenv/bin/latexmake envelope.ps
    latex  envelope.tex
    dvips -f -t letter  envelope.dvi > envelope.ps

    opDo lpr /tmp/$$.envLabProc/envelope.ps
    opDo ls -l /tmp/$$.envLabProc/envelope.ps
}

function vis_envelopeProcPdf {
    opDo mkdir /tmp/$$.envLabProc
    opDo cd /tmp/$$.envLabProc
    
    vis_envelopeTexFullStdout > envelope.tex

    pdflatex  envelope.tex
    opDo ls -l /tmp/$$.envLabProc/envelope.pdf
    ANT_raw "acroread /tmp/$$.envLabProc/envelope.pdf"
}


function vis_envelopeTexFullStdout {

    vis_envelopeTexBeginStdout

    vis_envelopeTexPrinterStdout

    vis_envelopeTexOriginatorStdout

    vis_envelopeTexRecepientsStdout

    vis_envelopeTexEndStdout
}

function vis_personalEnvProcPdf {
    opDo mkdir /tmp/$$.envLabProc
    opDo cd /tmp/$$.envLabProc

    vis_personalEnvTexFullStdout > envelope.tex

    pdflatex  envelope.tex
    opDo ls -l /tmp/$$.envLabProc/envelope.pdf
    ANT_raw "acroread /tmp/$$.envLabProc/envelope.pdf"
}


function vis_personalEnvTexFullStdout {

    vis_envelopeTexBeginStdout

    vis_personalEnvTexPrinterStdout

    vis_envelopeTexOriginatorStdout

    vis_envelopeTexRecepientsStdout

    vis_envelopeTexEndStdout
}




function vis_envelopeTexBeginStdout {
    # NOTYET, this should be based on printerName

    cat   << _EOF_
\documentclass[12pt]{letter}
_EOF_
}

function vis_envelopeTexEndStdout {
    # NOTYET, this should be based on printerName

    cat   << _EOF_
\end{document}
_EOF_
}

function vis_envelopeTexPrinterStdout {

    # NOTYET, this should be based on printerName

	      cat   << _EOF_

%\usepackage[businessenvelope,customenvelopes,rotateenvelopes]{envlab}
%\usepackage[businessenvelope,centerenvelopes,norotateenvelopes]{envlab}
\usepackage[businessenvelope,centerenvelopes,rotateenvelopes]{envlab}


\makelabels

%\setlength{\EnvelopeTopMargin}{3in}
\setlength{\EnvelopeTopMargin}{0.1in}

\begin{document}
\startlabels
\mlabel
_EOF_
}


function vis_personalEnvTexPrinterStdout {

    # NOTYET, this should be based on printerName

	      cat   << _EOF_

%\usepackage[businessenvelope,customenvelopes,rotateenvelopes]{envlab}
%\usepackage[businessenvelope,centerenvelopes,norotateenvelopes]{envlab}
\usepackage[personalenvelope,centerenvelopes,rotateenvelopes]{envlab}


\makelabels

%\setlength{\EnvelopeTopMargin}{3in}
\setlength{\EnvelopeTopMargin}{0.1in}

\begin{document}
\startlabels
\mlabel
_EOF_
}



function vis_labelTexPrinterStdout {

    # NOTYET, this should be based on printerName

	      cat   << _EOF_

\usepackage[avery5164label]{envlab}

\makelabels

\FirstLabel{$1}{$2}
%\setlength{\EnvelopeTopMargin}{3in}

\begin{document}
%\SetBigLabel{4.19in}{3.3in}{0.5in}{0.16in}{0.19in}{2}{3}
\startlabels
\mlabel
_EOF_

}


function vis_envelopeTexOriginatorStdout {
echo ${originatorAddress}
}

function vis_envelopeTexRecepientsStdout {
echo ${recipientsAddressList}
}




#
# Full Manipulators
#

function vis_fullUpdate {
    hookRun "fullUpdateHookPre"

    opDo vis_folderFullCreate

    opDo vis_pagesUpdate all

    hookRun "fullUpdateHookPost"
}


function vis_fullClean {
  hookRun "fullCleanHook"
}

#
# LOCAL UPDATES
#

function vis_fullPrep {
    opDo vis_contentFilePrep $*
  opDo vis_subFoldersHtmlGen $*
  opDo vis_seeAlsoHtmlGen $*
  #
  # NOTYET
}


function vis_envLabProcGen {
    FN_fileSafeKeep envLabProc.sh
    vis_envLabProcStdout > envLabProc.sh
}

function vis_envLabProcStdout {
 cat  << _EOF_
#!/bin/osmtKsh

typeset RcsId="\$Id: seedEnvLabProc.sh,v 1.2 2017-06-13 01:31:40 lsipusr Exp $"

if [ "\${loadFiles}X" == "X" ] ; then
  seedEnvLabProc.sh -l \$0 "\$@"
  exit \$?
fi


printerName="
hp8000
"

originatorDesc="
"

recipientsDescList="
"

originatorAddress="
"

recipientsAddressList="
"


_EOF_
}
