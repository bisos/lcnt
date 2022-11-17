#!/bin/bash

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


function vis_examples {
  typeset extraInfo="-v -n showRun"
  #typeset extraInfo=""
  typeset oneFig=`echo ${figsList} | cut -d ' ' -f 1 `
  typeset oneImageFile=$( head -1 ./inFilesList )
  typeset latestOdg=$( ls -dt *.odg | head -1 )
  typeset latestOdgSansOdg=$( basename -s .odg ${latestOdg} )
  typeset visLibExamples=`visLibExamplesOutput ${G_myName} ${extraInfo}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- FULL MANIPLATORS ---
${G_myName} ${extraInfo} -i fullUpdate
${G_myName} ${extraInfo} -i  fullClean
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
${G_myName} ${extraInfo} -i startObjectGen html path
${G_myName} ${extraInfo} -i startObjectGenExamples
--- GENERIC MANIPLATORS ---
${G_myName} ${extraInfo} -i build ${oneFig}
--- EACH MANIPULATORS ---
--- CONVERSIONS ---
${G_myName} ${extraInfo} -i odgConverts ${oneFig}
--- Convert Odg to Pdf and Png ---
echo *71x30*.odg | bystarPlone3GalleriaManage.sh  -i imageDescStart
libreoffice --headless --convert-to pdf t1.odg 
libreoffice --headless --convert-to png t1.odg 
${G_myName} ${extraInfo} -i odgToPdf $( echo ${filesList} )
${G_myName} ${extraInfo} -i odgToPng $( echo ${filesList} )
-- Process Latest .odg File
${G_myName} ${extraInfo} -i odgFullProc ${latestOdg} # Does everything below
${G_myName} ${extraInfo} -i odgFullProc $( echo ${filesList} )
${G_myName} ${extraInfo} -i odgToPdf ${latestOdg}
${G_myName} ${extraInfo} -i odgToPng ${latestOdg}
${G_myName} ${extraInfo} -i srcConvert ${latestOdg}
${G_myName} ${extraInfo} -i genFigTex ${latestOdgSansOdg}
${G_myName} ${extraInfo} -i genStartFigInfoFiles ${latestOdgSansOdg}
_EOF_
figsListCmdLines
hookRun "examplesHookPost"
}



function vis_odgFullProc {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    #opDoComplain echo "$@"

    for thisOne in $@ ; do
	typeset thisPrefix=$( FN_prefix ${thisOne} )
	typeset thisExtension=$( FN_extension ${thisOne} )
	echo ${thisExtension}
	case ${thisExtension} in 
	    "odg"|"ODG")
		opDo vis_odgToPdf ${thisOne}
		opDo vis_odgToPng ${thisOne}
		opDo vis_srcConvert ${thisOne}
		opDo vis_genFigTex ${thisPrefix}
		opDo vis_genStartFigInfoFiles ${thisPrefix}
		opDo vis_figInfoFilesEdit ${thisPrefix}
		;;
	    *)
		EH_problem "${thisOne} -- Unknown ${thisExtension}"
		;;
	esac
    done


    lpReturn
}



function figsListCmdLines {
  typeset extraInfo="-v -n showRun"
  typeset thisOne=""

  firstOne="TRUE"

  oneLineFigsList=$( echo ${figsList} )

  for thisOne in ${figsList} ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )

      if [ "${firstOne}_" == "TRUE_" ] ; then
	  ANT_raw "---- Produce epsi, ps formats from figure's source ----"
	  ANT_raw "${G_myName} ${extraInfo} -i srcConvert ${thisOne}"
	  ANT_raw "${G_myName} ${extraInfo} -i srcConvert ${oneLineFigsList}"
	  ANT_raw "---- Generate tex templates point to fig for include ----"
	  ANT_raw "${G_myName} ${extraInfo} -i genFigTex ${oneLineFigsList}"
	  ANT_raw "${G_myName} ${extraInfo} -i genFigTex ${thisPrefix}"
	  ANT_raw "${G_myName} ${extraInfo} -i genStartFigInfoFiles ${thisPrefix}  # Create .title .caption and .style files"
	  ANT_raw "${G_myName} ${extraInfo} -i srcConvert ${thisOne}"
	  break
      fi
  done

  ANT_raw "---- Generate presAllFigs.tex file with all the Figures in It ----"
  ANT_raw "${G_myName} ${extraInfo} -i presAllTex"
  ANT_raw "---- Display Developers Menu ----"
  ANT_raw "${G_myName} ${extraInfo} -i artPresAllFigsTex"
  ANT_raw "${G_myName} ${extraInfo} -i devCommands"
}




function vis_odgConverts {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    opDoComplain echo "$@"

    for thisOne in $@ ; do
	typeset thisPrefix=$( FN_prefix ${thisOne} )
	typeset thisExtension=$( FN_extension ${thisOne} )
	echo ${thisExtension}
	case ${thisExtension} in 
	    "odg"|"ODG")
		opDo libreoffice --headless --convert-to pdf ${thisOne}
		opDo libreoffice --headless --convert-to png ${thisOne}
		;;
	    *)
		EH_problem "Unknown ${thisExtension}"
		;;
	esac
    done


    lpReturn
}


function vis_devCommands {
  typeset extraInfo="-v -n showRun"

  typeset thisOne=""

  firstOne="TRUE"

  prefixList=""

  for thisOne in ${figsList} ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )

      if [ "${firstOne}_" == "TRUE_" ] ; then
	  ANT_raw "${G_myName} ${extraInfo} -i genFigTex ${thisPrefix}"
      fi

    ANT_raw "${G_myName} ${extraInfo} -i srcConvert ${thisOne}"
    #ANT_raw "${G_myName} ${extraInfo} -i build ${thisOne}"
    #ANT_raw "lcnLcntInputProc.sh -p currentBase="${currentBase}" -p outputs=all -i buildFigures ${thisOne}"

    prefixList="${prefixList} ${thisPrefix}"
  done

  ANT_raw "${G_myName} ${extraInfo} -i srcConvert $( echo ${figsList} )"

  ANT_raw "${G_myName} ${extraInfo} -i genFigTex ${prefixList}"

  ANT_raw "${G_myName} ${extraInfo} -i genStartFigInfoFiles ${prefixList}"
}



function vis_help {
  cat  << _EOF_
_EOF_
}

function noArgsHook {
  vis_examples
}

#
# Generic Manipulators
#

function vis_srcConvert {
  EH_assert [[ $# -gt 0 ]]
  opDoComplain echo "$@"

  for thisOne in $@ ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )
      echo ${thisExtension}
	case ${thisExtension} in 
	    "gif"|"GIF")
		vis_gifConvert ${thisOne}
		;;
	    "fm5"|"FM5")
		opDoComplain lcnLcntInputProc.sh -p currentBase=${currentBase} -p outputs=all -i buildFigures "$@"
		;;
	    "odg"|"ODG")
		vis_odgConvert ${thisOne}
		;;
	    *)
		EH_problem "Unknown ${thisExtension}"
		;;
	esac
  done
}


function vis_build {
  EH_assert [[ $# -gt 0 ]]
  opDoComplain lcnLcntInputProc.sh -p currentBase=${currentBase} -p outputs=all -i buildFigures "$@"
}


function vis_odgConvert {
  EH_assert [[ $# -gt 0 ]]

  for thisOne in $@ ; do
      opDo vis_odgConvertOne ${thisOne}
  done
}

function vis_odgConvertOne {
  EH_assert [[ $# -eq 1 ]]

  if [ ! -f $1 ] ; then
      EH_problem "Missing $1"
      return 1
  fi

  typeset thisPrefix=$( FN_prefix ${1} )
  typeset thisExtension=$( FN_extension ${1} )

  opDo vis_odgToPng "$1"
  opDo vis_odgToPdf "$1"

  if [ ! -f ${thisPrefix}.pdf ] ; then
      EH_problem "Missing ${thisPrefix}.pdf"
      return 1
  fi
 
  opDoRet pdf2ps  ${thisPrefix}.pdf
  #opDoRet ps2epsi ${thisPrefix}.ps   # Has problem in Debian-11, but what if epsi is nologer in use
}

function vis_genStartFigInfoFiles {
  EH_assert [[ $# -gt 0 ]]

  for thisOne in $@ ; do

      if [ -f ${thisOne}.title ] ; then
	  ANT_raw "${thisOne}.title Exists, genStartFigInfoFiles skipped"
      else
	  echo "${thisOne}.title" > ${thisOne}.title
      fi

      if [ -f ${thisOne}.caption ] ; then
	  ANT_raw "${thisOne}.caption Exists, genStartFigInfoFiles skipped"
      else
	  echo "${thisOne}.caption" > ${thisOne}.caption
      fi

      if [ -f ${thisOne}.style ] ; then
	  ANT_raw "${thisOne}.style Exists, genStartFigInfoFiles skipped"
      else
	  echo "plain" > ${thisOne}.style
      fi

      opDo ls -l ${thisOne}.title ${thisOne}.caption ${thisOne}.style
  done
}


function vis_figInfoFilesEdit {
  EH_assert [[ $# -gt 0 ]]

  for thisOne in $@ ; do

      if [ -f ${thisOne}.title ] ; then
	  opDo emacsclient  "${thisOne}.title"
      else
	  EH_problem "${thisOne}.title"
      fi

      if [ -f ${thisOne}.caption ] ; then
	  opDo emacsclient  "${thisOne}.caption"
      else
	  EH_problem "${thisOne}.caption"
      fi

      if [ -f ${thisOne}.style ] ; then
	  opDo emacsclient   "${thisOne}.style"
      else
	  EH_problem  ${thisOne}.style
      fi

      opDo ls -l ${thisOne}.title ${thisOne}.caption ${thisOne}.style
  done
}



function vis_genFigTex {
  EH_assert [[ $# -gt 0 ]]

  for thisIndex in $@ ; do
      typeset thisOne=$( FN_prefix ${thisIndex} )
      typeset thisExtension=$( FN_extension ${thisIndex} )


      if [ -f ${thisOne}.tex ] ; then
	  #opDo FN_fileSafeKeep ${thisOne}.tex
	  ANT_raw "Skipping ${thisOne}.tex"
	  continue
      fi
      if [ -f ${thisOne}_pres.tex ] ; then
	  #opDo FN_fileSafeKeep ${thisOne}_pres.tex
	  ANT_raw "Skipping ${thisOne}_pres.tex"
	  continue
      fi

cat  << _EOF_ > ${thisOne}.tex
\begin{figure}
\begin{center}
  \includegraphics[width=\textwidth]{figures/${thisOne}}
  \caption{${thisOne}}
  \label{fig:${thisOne}}
\end{center}
\end{figure}
_EOF_

#   \includegraphics[width=108mm,height=76mm,angle=-90,keepaspectratio]{figures/${thisOne}}

cat  << _EOF_ > ${thisOne}_pres.tex
\begin{figure}
\begin{center}
   \includegraphics[width=108mm,height=76mm,keepaspectratio]{figures/${thisOne}}
\end{center}
\end{figure}
_EOF_

      opDo ls -l ${thisOne}.tex ${thisOne}_pres.tex
  done
}

# NEW Obsoletes by presAllTex
function vis_artPresAllFigsTex {
  EH_assert [[ $# -eq 0 ]]


  opDo FN_fileSafeKeep artPresAllFigs.tex

cat  << _EOF_ > artPresAllFigs.tex
% Latex headers
_EOF_


  for thisOne in ${figsList} ; do
      typeset thisPrefix=$( FN_prefix ${thisOne} )
      typeset thisExtension=$( FN_extension ${thisOne} )

cat  << _EOF_ >> artPresAllFigs.tex

%{{{ figure: ${thisPrefix}

\mode<presentation>{
\begin{frame}[plain]{${thisPrefix}}
  \input { ./figures/${thisPrefix}_pres.tex  }
\end{frame}
}

\mode<article>{
  \input { ./figures/${thisPrefix}.tex  }
}

%}}} figure: ${thisPrefix}

_EOF_
  done
}

# OLD Obsoleted by artPresAllFigsTex
function vis_presAllTex {
  EH_assert [[ $# -eq 0 ]]

  #presFigsList=$( echo *_pres.tex )
  presFigsList=${figsList}


  opDo FN_fileSafeKeep presAllFigs.tex

cat  << _EOF_ > presAllFigs.tex
% Latex headers
_EOF_


  for thisIndex in ${presFigsList} ; do

      thisOne=$( FN_prefix ${thisIndex} )


cat  << _EOF_ >> presAllFigs.tex

\mode<presentation>{
\begin{frame}[plain]{${thisOne}}
  \input { ./figures/${thisOne}_pres.tex  }
\end{frame}
}

\mode<article>{
  \input { ./figures/${thisOne}.tex  }
}

_EOF_

  done
}



function vis_gifConvert {
  EH_assert [[ $# -eq 1 ]]
  if [ ! -f $1 ] ; then
      EH_problem "Missing $1"
      return 1
  fi

  typeset thisPrefix=$( FN_prefix ${1} )
  typeset thisExtension=$( FN_extension ${1} )

  echo ${thisExtension}

  opDoRet eval "( giftopnm $1 > ${thisPrefix}.pnm )"

  opDoRet eval "( pnmtops ${thisPrefix}.pnm > ${thisPrefix}.ps )"
  opDoRet ps2pdf ${thisPrefix}.ps
  # opDoRet ps2epsi ${thisPrefix}.ps

}



function vis_startObjectGenExamples {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}: Menu for Starting New Objects
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

cat  << _EOF_
--- Initial / Start-Up Preparations ---
${G_myName} ${extraInfo} -i topTreeRecurseAutoLoad
${G_myName} ${extraInfo} -i recurseAutoLoadStartTop
--- LOCAL GENERATIONS/CREATIONS -- INITIAL OBJECTS ---
**** nativeNode ****
${G_myName} ${extraInfo} -i startObjectGen nativeNode path
**** auxNode ****
${G_myName} ${extraInfo} -i startObjectGen auxNode path
**** auxLeaf ****
${G_myName} ${extraInfo} -i startObjectGen auxLeaf path
**** basic ****
${G_myName} ${extraInfo} -i startObjectGen basic path 
**** text ****
${G_myName} ${extraInfo} -i startObjectGen text path 
**** html ****
${G_myName} ${extraInfo} -i startObjectGen loDraw galleriaCadred-71x30.odg name-71x30.odg
**** Custom ****
${G_myName} ${extraInfo} -i startObjectGen custom path
**** General ****
**** Transition Facilities ****
${G_myName} ${extraInfo} -i startObjectUpdateInCwd  # Auto Detect
${G_myName} ${extraInfo} -i startObjectUpdateInCwd custom  # for old dirs when objectType is not there
_EOF_

}



function vis_startObjectGen {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Description: 
Generate object info  and file-var-parameters in current working directory.
\$1 is objectType. REST are parameters that apply to objectType.
_EOF_
    }

    EH_assert [[ $# -ge 1 ]]

    typeset here=$( pwd )

    #bystarAcctPathAnalyze ${here}

    thisObjectType=$1
    shift

    case ${thisObjectType} in
	"loDraw")
	    opDo cp /libre/ByStar/InitialTemplates/fig/loDraw/start/$1 $2
	    ;;
	*)
	    
    esac

    #opDo ${startGenFunc} ${@}

    lpReturn
}


function vis_odgToPng {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset theseArgs=$*

    for thisArg in ${theseArgs} ; do
	opDo libreoffice --headless --convert-to png ${thisArg}
    done
    lpReturn
}


function vis_odgToPdf {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    typeset theseArgs=$*

    for thisArg in ${theseArgs} ; do
	opDo libreoffice --headless --convert-to pdf ${thisArg}
    done
    lpReturn
}




#
# Full Manipulators
#

function vis_fullUpdate {
  typeset thisOne=""
  for thisOne in ${figsList} ; do
    opDoComplain lcnLcntInputProc.sh -p currentBase="${currentBase}" -p outputs=all -i buildFigures ${thisOne}
  done
}

function vis_fullClean {
  opDoComplain lcnLcntInputProc.sh -p cleanType=realclean -i clean ${figsList}
}


#
# Per Doc Manipulators
#

