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


vis_help () {
 cat  << _EOF_

INTERFACE MODEL:

Parameters:
   -p bystarUid=
   -p album
   -p since
Args:
   filesList  (photos)
   dirSpec
Stdin: NA
Stdout: NA

SCOPE:
------
 
_EOF_

}


. ${opBinBase}/lpErrno.libSh

. ${opBinBase}/bystarHook.libSh

# bystarMail.libSh 
. ${opBinBase}/bystarMail.libSh


# bystarLib.sh
. ${opBinBase}/bystarLib.sh

# bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh


# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh

#. ${opBinBase}/lpCurrents.libSh

# ./buePhoto.libSh
# . ${opBinBase}/buePhoto.libSh

# PRE parameters
typeset -t acctTypePrefix=""
typeset -t bystarUid="INVALID"
typeset -t destDir="INVALID"
typeset -t subsdItemsFile="INVALID"

function G_postParamHook {
    #bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    #lpCurrentsGet
    return
}

function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  typeset thisOneSaNu="sa-20000"
  #typeset thisOneSaNu=${oneBystarAcct}
  #typeset thisOneSaNu=${currentBystarUid}
  typeset runInfo="-p ri=any:mailFolders"

  typeset oneUserName="bue"
  typeset oneUserPasswd="bystar"
  typeset oneRemIpAddr=192.168.2.123  
  typeset oneOutFile="/tmp/${G_myName}.$$.outFile"
  typeset oneInFile="/tmp/${G_myName}.SPECIFY.outFile"
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
  typeset plone3ExceptionsFile="/opt/public/osmt/sysConfigInput/plone3/ftpLsExceptions"

  typeset veryRecentDateString="5 hours ago"
  typeset recentDateString="yesterday"
  typeset middleDateString="1 week ago"
  typeset oldDateString="1 year ago"
  typeset veryOldDateString="January 1 1960"

#${doLibExamples}
 cat  << _EOF_
EXAMPLES:
----  INFORMATION  ----
===== BinsPrep  =====
apt-get -y install mp3cd
apt-get -y install ripit
apt-get -y install lame
apt-get install libavcodec-extra-53
===== Conversions  =====
${G_myName} ${extraInfo}  -i wmaToWav inFile.wma outfile.wav
===== Export: Play Lists Manipulation =====
${G_myName} ${extraInfo}  -p playlist="/acct/employee/lsipusr/BUE/PlayLists/CD-Burn/current.m3u" -i filesInfo
${G_myName} ${extraInfo}  -p playlist="/acct/employee/lsipusr/BUE/PlayLists/CD-Burn/current.m3u" -i cdBurn dashN
===== Export: Play Lists Burning =====
${G_myName} ${extraInfo}  -p playlist="/acct/employee/lsipusr/BUE/PlayLists/CD-Burn/current.m3u" -i cdBurn 
${G_myName} ${extraInfo}  -p playlist="/acct/employee/lsipusr/BUE/PlayLists/CD-Burn/current.m3u" -i cdBurn /dev/cdrom1
${G_myName} ${extraInfo}  -p playlist="/acct/employee/lsipusr/BUE/PlayLists/CD-Burn/current.m3u" -i cdBurnBrasero 
===== Import: From Audio CD =====
${G_myName} ${extraInfo}  -i ripit
${G_myName} ${extraInfo}  -p destDir="/uniform/Audio/Incoming" -i ripit
===== Conversions =====
${G_myName} ${extraInfo}  -p destDir="/uniform/Audio/Incoming" -i convertOggToMp3OneFile
find . -type f -print | egrep .ogg$ | ${G_myName} ${extraInfo}  -p destDir="/uniform/Audio/Incoming" -i convertOggToMp3
find $( pwd ) -print | egrep '\.wav$' | ${G_myName} -i avconvWavTo mp3
avconv -i sample.wav sample.mp3  
===== MP3 Length =====
find $( pwd ) -print | egrep '\.mp3$' | ${G_myName} -i mp3LengthSeconds
${G_myName} -i mp3LengthSeconds file.mp3
${G_myName} -i mp3LengthMilliSeconds file.mp3
===== Audio Info =====
${G_myName} -i audioInfo /tmp/silence1.dat /tmp/silence1Sec.wav
===== Silence Generators =====
${G_myName} -i silenceGenData 1 > /tmp/silence1.dat
${G_myName} -i silenceGenWav 1 /tmp/silence1Sec.wav
_EOF_
}


function vis_developerExamples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""
# NOTYET, outofdate
  typeset doLibExamples=`doLibExamplesOutput ${G_myName}`

 cat  << _EOF_
EXAMPLES:
--- BUE INFORMATION / Status ---
_EOF_
}

noArgsHook() {
  vis_examples
}

noSubjectHook() {
  return 0
}

function vis_silenceGenData {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
In Perl:

open(OUT, ">/tmp/$$.dat");
print OUT "; SampleRate 8000\n";
$samples = $seconds * 8000;
for ($i = 0; ($i < $samples); $i++) {
        print OUT $i / 8000, "\t0\n";
}
close(OUT);

In Bash, because of external bc invokations it is slooow.

_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset integer seconds=${1}

    typeset integer samples=$(( ${seconds} * 8000 ))

    echo "; SampleRate 8000"

    typeset integer i=0
    while (( $i < ${samples} )) ; do
        typeset thisSample=$(echo "$i / 8000" | bc -l)
        echo -e "${thisSample}\t0"
        ((i++))
    done

    lpReturn
}

function vis_silenceGenWav {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]

    typeset integer seconds=${1}
    typeset outFileName="$2"

    typeset tmpDataFile="/tmp/${G_myName}_$$.dat"
    opDo eval vis_silenceGenData ${seconds} \> ${tmpDataFile}

    opDo sox ${tmpDataFile} -b 16 -r 48000 -c 2 -e signed ${outFileName}

    opDo ls -l ${outFileName}
    ANT_raw "mplayer ${outFileName}"

    lpReturn
}


function vis_mp3LengthSeconds  {
    function describeF {  cat  << _EOF_
_EOF_
    }

    if [ $# -gt 0 ] ; then
        typeset thisOne=""
        for thisOne in ${@} ; do
            opDo mp3info -p "%S\n" ${thisOne}
        done
    else
        typeset thisLine=""
        while read thisLine ; do
            if [ "${thisLine}" != "" ] ; then
                opDo mp3info -p "%S\n" ${thisLine}
            fi
        done
    fi

    lpReturn
}

function vis_mp3LengthMilliSeconds  {
    function describeF {  cat  << _EOF_
_EOF_
    }

    typeset integer lenSecs=""

    if [ $# -gt 0 ] ; then
        typeset thisOne=""
        for thisOne in ${@} ; do
            lenSecs=$( opDo mp3info -p "%S\n" ${thisOne} )
            lenMilliSecs=$((${lenSecs} * 1000))
            echo ${lenMilliSecs}
        done
    else
        typeset thisLine=""
        while read thisLine ; do
            if [ "${thisLine}" != "" ] ; then
                lenSecs=$( opDo mp3info -p "%S\n" ${thisLine} )
                lenMilliSecs=$((${lenSecs} * 1000))
                echo ${lenMilliSecs}
            fi
        done
    fi

    lpReturn
}

function vis_audioInfo  {
    function describeF {  cat  << _EOF_
_EOF_
    }

    function procOne {
        EH_assert [[ $# -eq 1 ]]
        opDo soxi "$1"
    }

    # NOTYET, Common Pattern, 
    # Put it in a library or make it be dblock or both
    if [ $# -gt 0 ] ; then
        typeset thisOne=""
        for thisOne in ${@} ; do
            procOne ${thisOne}
        done
    else
        typeset thisLine=""
        while read thisLine ; do
            if [ "${thisLine}" != "" ] ; then
                procOne ${thisLine}
            fi
        done
    fi

    lpReturn
}


function vis_avconvWavTo  {
  EH_assert [[ $# -eq 1 ]]
  function describeF {  cat  << _EOF_
_EOF_
  }

  newExtension="$1"

  cat | 
  while read  thisLine  ; do
      filePrefix=$( FN_prefix "${thisLine}" )
      dirsPart=$( FN_dirsPart "${thisLine}" )
      opDo avconv -i ${thisLine} "${dirsPart}"/"${filePrefix}".${newExtension}
  done
}




function vis_wma2Wav {
  EH_assert [[ $# -eq 2 ]]
  function describeF {  cat  << _EOF_
Upload to ${album} from $* for ${bystarUid}
_EOF_
  }

  #EH_assert [[ "${bystarUid}_" != "INVALID_" ]]

 opDo mplayer \
  -quiet \
  -vo null \
  -vc dummy \
  -af volume=0,resample=44100:0:1 \
  -ao pcm:waveheader:file="$2" "$1"
}

function vis_filesInfo {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${playlist}_" != "INVALID_" ]]

  function describeF {  cat  << _EOF_
Given a playlist Verify that the files are good
_EOF_
  }

  #xargs  -d \\n -a ~lsipusr/BUE/PlayLists/CD-Burn/current.m3u  ls -l 

  thisPlaylist=$( FN_absolutePathGet ${playlist} )

  cat ${thisPlaylist} | 
  while read  thisLine  ; do
      # NOTYET, scream if a file does not exist
      opDo ls -l "${thisLine}"
  done



  bash ${tempFile}

}

function vis_cdBurn {
  EH_assert [[ $# -le 1 ]]
  EH_assert [[ "${playlist}_" != "INVALID_" ]]

  function describeF {  cat  << _EOF_
Given a playlist write it to a CD.
_EOF_
  }

  dashN=""

  if [[ $# -eq 0 ]] ; then
      cdrom="/dev/cdrw"
  else # eq 1
      if [[ $1 == "dashN" ]] ; then 
          dashN="-n"
          cdrom="/dev/cdrw"
      else
          #if [[ -f $1 ]] ; then
              cdrom=$1
          # else
          #     EH_problem "$1 does not exist"
          #     return 101
          #fi
      fi
  fi
  

  thisPlaylist=$( FN_absolutePathGet ${playlist} )

  #opDo /opt/public/osmt/bin/mp3cd.bx ${dashN} -v -d ${cdrom} --driver generic-mmc-raw ${thisPlaylist}
  opDo sudo mp3cd ${dashN} -v -d ${cdrom} -c "--speed 16" --no-cd-text  --driver generic-mmc-raw  ${thisPlaylist}

}


function vis_cdBurnBrasero {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given a playlist write it to a CD With Brasero.
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    
    if [[ $# -eq 0 ]] ; then
        cdrom="/dev/cdrw1"
    else # eq 1
        #if [[ -f $1 ]] ; then
            cdrom=$1
        #else
            #EH_problem "$1 does not exist"
            #return 101
        #fi
    fi

    thisPlaylist=$( FN_absolutePathGet ${playlist} )

    if [ -d /tmp/mp3cd-lsipusr ] ; then
        opDo rm -r -f /tmp/mp3cd-lsipusr
    fi

    #opDo mp3cd -n -v -d ${cdrom} ${thisPlaylist}
    opDo mp3cd -n -v -d ${cdrom} -S burn ${thisPlaylist}

    opDo eval "ls /tmp/mp3cd-lsipusr/*.wav > /tmp/lcaAudioManage.m3u"

    opDo brasero -l  /tmp/lcaAudioManage.m3u
}


function vis_ripit {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Given a playlist write it to a CD With Brasero.
_EOF_
    }
    EH_assert [[ $# -le 1 ]]

    
    if [[ $# -eq 0 ]] ; then
        cdrom="/dev/cdrw1"
    else # eq 1
        if [[ -f $1 ]] ; then
            cdrom=$1
        else
            EH_problem "$1 does not exist"
            return 101
        fi
    fi
    
    typeset thisDestDir=""
    
    if [ "${destDir}" != "INVALID" ] ; then
        thisDestDir=$( FN_absolutePathGet ${destDir} )
    fi

    if [ "${thisDestDir}" == "" ] ; then
        if [ ! -d /uniform/Audio ] ; then
            EH_problem "Missing /uniform/Audio -- Skipped"
            lpReturn 101
        fi
        #typeset dateTag=$( date +%y%m%d%H%M%S )
        #thisDestDir="/uniform/Audio/Incoming/${dateTag}"
        thisDestDir="/uniform/Audio/Incoming"
    fi

    opDo echo mkdir -p ${thisDestDir}

    opDo ripit --outputdir ${thisDestDir}
}



function vis_convertOggToMp3 {
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
  }

    if [ $# -gt 0 ] ; then
        typeset thisOne=""
        for thisOne in ${@} ; do
            opDo vis_convertOggToMp3OneFile "${thisOne}"
        done
    else
        typeset thisLine=""
    
        while read thisLine ; do
            if [ "${thisLine}" != "" ] ; then
                opDo vis_convertOggToMp3OneFile "${thisLine}"
            fi
        done
    fi

    lpReturn
}



function vis_convertOggToMp3OneFile {
    function describeF {  cat  << _EOF_
If there are any args, process those.
If there are no args, process stdin.
_EOF_
  }
    EH_assert [[ $# -eq 1 ]]

    typeset thisFile="$1"

    typeset thisPrefix=$( FN_prefix "${thisFile}" )
    typeset thisExtension=$( FN_extension "${thisFile}" )
    typeset dirsPart=$( FN_dirsPart "${thisFile}" )
    typeset nonDirsPart=$( FN_nonDirsPart "${thisFile}" )


    echo dirsPart="${dirsPart}" nonDirsPart="${nonDirsPart}" thisPrefix="${thisPrefix}" thisExtension="${thisExtension}"

    if [ -f "${dirsPart}"/"${thisPrefix}".mp3 ] ; then
        ANT_cooked " "${dirsPart}"/${thisPrefix}.mp3 exists -- skipping it"
    else
        opDo avconv -i "${thisFile}" -acodec libmp3lame -ab 128k "${dirsPart}"/"${thisPrefix}".mp3
    fi

    lpReturn
}


