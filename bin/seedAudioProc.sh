#!/bin/bash

IimBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: seedAudioProc.sh,v 1.3 2018-04-26 19:14:10 lsipusr Exp $"
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
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/lcnt/bin/seedAudioProc.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@"
    exit $?
fi
####+END:

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
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
*  [[elisp:(org-cycle)][| ]]  Imports       :: /Prefaces (Imports/Libraries)/ [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh


# PRE parameters

baseDir=""

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  G_postParamHook    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: /Examples/ [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
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
--- PLAYLIST GENERATION ---
${G_myName} ${extraInfo} -i playlistGen 
find $( pwd ) -print | egrep '\.oga$' | ${G_myName} -i FN_renameWithExtension ogg
find $( pwd ) -print | egrep '\.oga$' | head -1 | ${G_myName} -i FN_renameWithExtension ogg
--- Convert .wav to mp3 ---
mp3info -p "%S" sample.mp3  
--- Length of mp3 in Seconds ---
mp3info -p "%S" sample.mp3  
--- Normalize Gain ---
mp3gain
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

$( examplesSeperatorTopLabel "EXTENSION EXAMPLES" )
$( examplesSeperatorChapter "Dispositions/Playing/Recording Examples" )
$( examplesSeperatorSection "Presentation Play (impressive)" )
---  Documentation / How-To  ---
${G_myName} ${extraInfo}  -i howTo
--- PLAYLIST GENERATION ---
${G_myName} ${extraInfo} -i playlistGen 
find $( pwd ) -print | egrep '\.oga$' | ${G_myName} -i FN_renameWithExtension ogg
find $( pwd ) -print | egrep '\.oga$' | head -1 | ${G_myName} -i FN_renameWithExtension ogg
--- Convert .wav to mp3 ---
find $( pwd ) -print | egrep '\.wav$' | ${G_myName} -i avconvWavTo mp3
avconv -i sample.wav sample.mp3  
--- Length of mp3 in Seconds ---
lcaAudioManage.sh -i mp3LengthSeconds file.mp3
find $( pwd ) -print | egrep '\.mp3$' | lcaAudioManage.sh -i mp3LengthSeconds
mp3info -p "%S\n" sample.mp3  
--- Normalize Gain ---
mp3gain
--- Blank Names Gen ---
${G_myName} ${extraInfo} -i frameNamesBlankGen
--- Recording Start ---
audacity
_EOF_

  hookRun "examplesHookPost"
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: /Interactively Invokable Functions (IIF)s/ |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_playlistGen    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_playlistGen {
  EH_assert [[ $# -eq 0 ]]
  function describeF {  cat  << _EOF_
_EOF_
  }

  buePlayListsDir="${bystarUidHome}/LUE/PlayLists/${basePlayListName}"

  opDo mkdir -p ${buePlayListsDir}

  opDo fapg --format=pls --recursive --output="${buePlayListsDir}/${basePlayListName}.pls" ${hereDir}

  opDo ls -l ${buePlayListsDir}/${basePlayListName}.pls
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_avconvWavTo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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
      opDo avconv -y -i ${thisLine} "${dirsPart}"/"${filePrefix}".${newExtension}
  done
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_FN_renameWithExtension    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_FN_renameWithExtension {
  EH_assert [[ $# -eq 1 ]]
  function describeF {  cat  << _EOF_
_EOF_
  }

  newExtension="$1"

  cat | 
  while read  thisLine  ; do
      filePrefix=$( FN_prefix "${thisLine}" )
      dirsPart=$( FN_dirsPart "${thisLine}" )
      opDo  mv "${thisLine}" "${dirsPart}"/"${filePrefix}".ogg
  done
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_frameNamesList    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_frameNamesList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo  .. beamerExternalExtensions.py -v 30 -i frameNamesList ./presentationEnFa.pdf

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_frameNamesBlankGen    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_frameNamesBlankGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    g_resultsCapture beamerExternalExtensions.py -v 30 -i frameNamesList ../presentationEnFa.pdf

    if [ "${g_resultsExitValue}" != 0 ] ; then
        EH_problem_g_resultsShow 
        lpReturn ${g_resultsExitValue}
    fi

    typeset thisLine
    echo ${g_resultsStdout} | grep -v defaultParams |
    while read  thisLine  ; do
        opDo touch ${thisLine}
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_frameNamesListPlay    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_frameNamesListPlay {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo  .. /de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py -v 30 -i frameNamesList ./presentationEnFa.pdf | grep -v defaultParams |
    while read  thisLine  ; do
        oDo mplayer ${thisLine}.wav
    done

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_frameNamesListDurationUpdate    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_frameNamesListDurationUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    inBaseDirDo  .. /de/bx/nne/dev-py/bin/iimBeamerImpressiveEmacs.py -v 30 -i frameNamesList ./presentationEnFa.pdf | grep -v defaultParams |
    while read  thisLine  ; do
        opDo  avconv -i ${thisLine}.wav ${thisLine}.mp3
        echo ${thisLine}.mp3 | lcaAudioManage.sh -i mp3LengthSeconds
        # Put it in ${thisLine}.duration
    done

    lpReturn
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_silenceGenData    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_silenceGenWav    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

    opDo sox ${tmpDataFile} -b 16 -r 48000 -c 2 -e signed-integer -S -t wav ${outFileName}
    #opDo sox ${tmpDataFile} -b 16 -r 48000 -c 2 -s -w ${outFileName}

    opDo ls -l ${outFileName}
    #ANT_raw "mplayer ${outFileName}"

    lpReturn
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mp3LengthSeconds    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_mp3LengthMilliSeconds    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_audioInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_wma2Wav    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_filesInfo    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_cdBurn    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_cdBurnBrasero    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_ripit    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_convertOggToMp3    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_convertOggToMp3OneFile    [[elisp:(org-cycle)][| ]]
_CommentEnd_

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




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_FN_renameWithExtension    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_FN_renameWithExtension {
  EH_assert [[ $# -eq 1 ]]
  function describeF {  cat  << _EOF_
_EOF_
  }

  newExtension="$1"

  cat | 
  while read  thisLine  ; do
      filePrefix=$( FN_prefix "${thisLine}" )
      dirsPart=$( FN_dirsPart "${thisLine}" )
      opDo  mv "${thisLine}" "${dirsPart}"/"${filePrefix}".ogg
  done
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
