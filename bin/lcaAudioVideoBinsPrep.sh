#!/bin/bash

IcmBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] |
"
FILE="
*  /This File/ :: /bisos/git/auth/bxRepos/bisos/lcnt/bin/lcaAudioVideoBinsPrep.sh
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@"
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
*      ################  CONTENTS-LIST ###############
*      ======[[elisp:(org-cycle)][Fold]]====== *[Info]* Module Description, Notes (Tasks/Todo Lists, etc.)
_CommentEnd_
function vis_describe {  cat  << _EOF_
**     ============ Essential Features TODO
*** TODO [#A] ======== Improve G_commonExamples.
    SCHEDULED: <2014-02-03 Mon>
*** TODO ======== Add the EH_ module.
_EOF_
}

_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Components List
_CommentEnd_

#apt-cache search something | egrep '^something'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=( 
        #mp3gain        look at easymp3gain-gtk instead
        mp3info
        lame
        #mp3cd
        ripit
        pavucontrol
        # libav_tools
        #libav_tools:i386
        recordmydesktop 
        impressive
        mencoder
        audacity
        mplayer_gui
    )
}

function pkgsList_UBUNTU_1310 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    itemOrderedList=( 
        mp3gain                   #
        mp3info
        lame
        mp3cd
        ripit
        pavucontrol
        libav_tools
        libavcodec_extra_53
        recordmydesktop 
        impressive
        mencoder
        audacity
    )
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i gmplayerFix
_EOF_
}

function vis_gmplayerFix {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo cd /usr/share/mplayer/skins/default; for FILE in *.png ; do sudo convert $FILE -define png:format=png24 $FILE ; done

    lpReturn
}



####+BEGIN: bx:dblock:lsip:binsprep:apt :module "mencoder"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: mencoder [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_mencoder () { distFamilyGenerationHookRun binsPrep_mencoder; }

binsPrep_mencoder_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "mencoder"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "audacity"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: audacity [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_audacity () { distFamilyGenerationHookRun binsPrep_audacity; }

binsPrep_audacity_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "audacity"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "recordmydesktop"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: recordmydesktop [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_recordmydesktop () { distFamilyGenerationHookRun binsPrep_recordmydesktop; }

binsPrep_recordmydesktop_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "recordmydesktop"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "impressive"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: impressive [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_impressive () { distFamilyGenerationHookRun binsPrep_impressive; }

binsPrep_impressive_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "impressive"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pavucontrol"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: pavucontrol [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pavucontrol () { distFamilyGenerationHookRun binsPrep_pavucontrol; }

binsPrep_pavucontrol_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pavucontrol"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "mp3info"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: mp3info [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_mp3info () { distFamilyGenerationHookRun binsPrep_mp3info; }

binsPrep_mp3info_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "mp3info"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "mp3info"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: mp3info [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_mp3info () { distFamilyGenerationHookRun binsPrep_mp3info; }

binsPrep_mp3info_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "mp3info"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libav-tools"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libav-tools [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libav_tools () { distFamilyGenerationHookRun binsPrep_libav_tools; }

binsPrep_libav_tools_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libav-tools"; }

####+END:

####+BEGINNOT: bx:dblock:lsip:binsprep:apt :module "libavcodec-extra-53"
_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: libavcodec-extra-53
_CommentEnd_
item_libavcodec_extra_53 () { distFamilyGenerationHookRun binsPrep_libavcodec_extra_53; }

binsPrep_libavcodec_extra_53_UBUNTU_1310 () { binsPrepAptPkgNameSet "libavcodec-extra-53"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "libav-tools:i386"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: libav-tools:i386 [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_libav_tools:i386 () { distFamilyGenerationHookRun binsPrep_libav_tools:i386; }

binsPrep_libav_tools:i386_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "libav-tools:i386"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "ripit"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: ripit [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ripit () { distFamilyGenerationHookRun binsPrep_ripit; }

binsPrep_ripit_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "ripit"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "mp3cd"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: mp3cd [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_mp3cd () { distFamilyGenerationHookRun binsPrep_mp3cd; }

binsPrep_mp3cd_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "mp3cd"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "lame"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: lame [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_lame () { distFamilyGenerationHookRun binsPrep_lame; }

binsPrep_lame_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "lame"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "mplayer-gui"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: mplayer-gui [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_mplayer_gui () { distFamilyGenerationHookRun binsPrep_mplayer_gui; }

binsPrep_mplayer_gui_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "mplayer-gui"; }

####+END:


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
