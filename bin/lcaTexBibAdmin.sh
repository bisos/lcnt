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

function vis_examples {
    #oneInBibFile="/usr/local/lib/bib/networking.bib"
    oneInBibFile="/lcnt/outputs/all/plpc.bib"
    oneOutBibFile="/tmp/lcaOut1.bib"
    oneOutHtmlFile="/z1/tmp/lcaOut1"
${visLibExamples}
 cat  << _EOF_
EXAMPLES:
--- Package Components  ---
${G_myName} -i bibtexBinsPrepFix
apt-cache search bibtex
apt-get install bibtool
dpkg -L bibtool
#apt-get install bibtool-dev
apt-get install bibclean
apt-get install bibtex2html
./bib2html.sh  # Shell Script found on the net
--- VERIFY / SORT  ---
bibtool -s -i ${oneInBibFile} -o ${oneOutBibFile}
bibtool -# -i ${oneInBibFile}
bibtool -@ -i ${oneInBibFile} -o ${oneOutBibFile}
bibclean ${oneInBibFile}
bibtex2html -o ${oneOutHtmlFile} ${oneInBibFile}; echo file://${oneOutHtmlFile}.html
bib2bib
--- Help and Documentation ---
${G_myName} -i help
---
_EOF_
}

noArgsHook() {
  vis_examples
}



function vis_bibtexBinsPrepFix {
  EH_assert [[ $# -eq 0 ]]

  if [[ "${opRunDistGeneration}_" == "1004_" || \
      "${opRunDistGeneration}_" == "1010_" || \
      "${opRunDistGeneration}_" == "1104_" || \
      "${opRunDistGeneration}_" == "1110_" || \
      "${opRunDistGeneration}_" == "1204_" || \
      "${opRunDistGeneration}_" == "1210_" || \
      "${opRunDistGeneration}_" == "7_" || \
      "${opRunDistGeneration}_" == "SQUEEZE_" ]] ; then
      if [[ -h /usr/bin/bibtex ]] ; then
          opDo FN_fileSafeKeep /usr/bin/bibtex
          opDo eval "bibtexBinsPrepFixStdout > /usr/bin/bibtex"
          opDo chmod ugo+x /usr/bin/bibtex
      else
          ANT_raw "/usr/bin/bibtex not a symlink -- must have been fixed already -- do verify"
      fi
      opDo ls -l /usr/bin/bibtex
  else
      doNothing
  fi
}

function bibtexBinsPrepFixStdout {
    cat  << _EOF_
#!/bin/bash

/usr/bin/bibtex.original  \$@
_EOF_
}

