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
 
  1) Upload To Gallery from BUE selectively
  2) Locate directories in ~sa-20000/NOVC/Camera for downloads



FUNCTIONAL MODEL:

   ==============================================
                      CAMERA
       FTP Server                SD CARD
   ==============================================


   ---------------------   ----------------------
   | bueFtp.libSh      |   |     DCIM Library   |
   ---------------------   ----------------------

   ---------------------   ----------------------
   | buePhotoCamera.sh |   |  buePhotoDcim.sh   |
   ---------------------   ----------------------


   ==============================================
      Photos/Videos directory/repository
   ==============================================

   ----------------------------------------------
   |   /opt/public/osmt/bin/buePhotoManage.sh   |
   ----------------------------------------------

   -------------------       --------------------
   |  galleryadd.pl  |       |                  |
   -------------------       --------------------


   ====================     =====================
      ByStar GALLERY           ByStar GALLERIA
   ====================     =====================

_EOF_

}


. ${opBinBase}/lpErrno.libSh

. ${opBinBase}/bystarHook.libSh

# bystarMail.libSh 
. ${opBinBase}/bystarMail.libSh

# ./bystarDnsDomain.libSh 
#. ${opBinBase}/bystarDnsDomain.libSh
#. ${opBinBase}/mmaDnsLib.sh


. ${opBinBase}/mmaLib.sh
#. ${opBinBase}/mmaQmailLib.sh
#. ${opBinBase}/mmaDnsLib.sh

# bystarLib.sh
. ${opBinBase}/bystarLib.sh

# bystarHereAcct.libSh
# . ${opBinBase}/bystarHereAcct.libSh

# bystarCentralAcct.libSh 
#  ${opBinBase}/bystarCentralAcct.libSh

#. ${opBinBase}/bystarInfoBase.libSh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh

. ${opBinBase}/bystarHook.libSh

# ./bystarLib.sh
. ${opBinBase}/bystarLib.sh

#. ${opBinBase}/lpCurrents.libSh

# ./buePhoto.libSh
#. ${opBinBase}/buePhoto.libSh

# /opt/public/osmt/bin/bystarPlone3Galleria.libSh
#. ${opBinBase}/bystarPlone3Galleria.libSh

# PRE parameters
typeset -t acctTypePrefix=""
typeset -t bystarUid="INVALID"
typeset -t subsdItemsFile="INVALID"

function G_postParamHook {
    bystarUidHome=$( FN_absolutePathGet ~${bystarUid} )
    #lpCurrentsGet
}

function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  typeset thisOneSaNu="ea-59061"
  #typeset thisOneSaNu=${oneBystarAcct}
  #typeset thisOneSaNu=${currentBystarUid}
  typeset runInfo="-p ri=any:mailFolders"

  typeset oneUserName="bue"
  typeset oneUserPasswd="bystar"
  typeset oneRemIpAddr=192.168.2.123  
  typeset oneOutFile="/tmp/${G_myName}.$$.outFile"
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
  typeset plone3ExceptionsFile="/opt/public/osmt/sysConfigInput/plone3/ftpLsExceptions"

  typeset veryRecentDateString="5 hours ago"
  typeset recentDateString="yesterday"
  typeset middleDateString="1 week ago"
  typeset oldDateString="1 year ago"
  typeset veryOldDateString="January 1 1960"

  # ~ea-59061/lcaPlone3/ContentTree/contentImages/files/31324.jpg
  typeset oneInFile="~ea-59061/lcaPlone3/ContentTree/contentImages/files/31324.jpg"

#${doLibExamples}
 cat  << _EOF_
EXAMPLES:
----  INFORMATION  ----
----  GALLERIA UPLOAD FACILITIES OBSOLETED BY bystarPlone3GalleriaManage.sh  ----
${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p album=/homeSlider -i galleriaPrepBase
${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p album=/scratch -i galleriaPrepBase
${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p album=/albums/sub1 -i galleriaPrepBase
${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p album=scratch -i galleriaParamsSet
----  OLD/LEGACY PERL GALLERY 1 UPLOAD FACILITIES  ----
echo /acct/subs/banan/1/mohsen/NOVC/Camera/Devices/Droid/Uploaded/201011161845/IMG_20101116_184523.jpg | ${G_myName} ${extraInfo} -p bystarUid=${thisOneSaNu} -p album=scratch -i galleryUploadFromStdin
===== Directory Path Facilities =====
${G_myName} ${extraInfo} -p since='${veryRecentDateString}' -i filesListForPath /acct/subs/banan/1/mohsen/NOVC/Camera/Devices/Droid/Downloaded/201011161845
===== Extra Features For Developers =====
${G_myName} ${extraInfo} ${runInfo} -i developerExamples
### PHOTO MANIPULATION COMMANDS ###
apt-get install jhead
jhead -v /uniform/ClusterConfidential/bananFamily/photos/byDate/2011/201109-tehran/IMG_1248.JPG
jhead -n%Y%m%d-%H%M%S  IMG_1248.JPG
convert -resize 25% 1.jpg  1-medium.jpg
mogrify -resize 25% 1.jpg
identify 1.jpg
####
${G_myName} ${extraInfo}  -i exifDateAutoRename fileName fileName2 ...
${G_myName} ${extraInfo}  -i exifDateAutoRename *.JPG
${G_myName} ${extraInfo}  -i resizeToMedium fileName fileName2 ...
${G_myName} ${extraInfo}  -i resizeToMedium *.JPG
${G_myName} ${extraInfo}  -i resizeToMediumSameExtension *.pnm
${G_myName} ${extraInfo}  -i resampleToMediumSameExtension *.pnm
${G_myName} ${extraInfo}  -i bystarCanonicalize fileName fileName2 ...
${G_myName} ${extraInfo}  -i bystarCanonicalize *.JPG
##
${G_myName} ${extraInfo}  -i FN_spacesRename .
#### Passport Photo Preparation ####
http://www.goingthewongway.com/77/passport-pictures/
http://www.robotgeek.org/articles/passport_tutorial/tutorial.html
http://www.neuralnetwriter.cylo42.com/node/2465
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


function vis_FN_spacesRename {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  find $1 -name '* *' | while read file;
  do
      target=$( echo "$file" | sed 's/ /_/g' )
      #echo "Renaming '$file' to '$target'"
      opDo mv "$file" "$target"
  done; 
}



function vis_exifDateAutoRename {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in "$@"; do
      opDo eval "jhead -n%Y%m%d-%H%M%S \"${thisFile}\" | cut -d \">\" -f 2"
  done
}


function vis_resizeToMedium {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset thisPrefix=$( FN_prefix ${thisFile} )
      typeset thisExtension=$( FN_extension ${thisFile} )

      #opDo convert -resize 25% ${thisFile}  ${thisPrefix}-medium.${thisExtension}
      opDo convert -resize 25% ${thisFile}  ${thisPrefix}-medium.jpg
  done
}

function vis_resizeToMediumSameExtension {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset thisPrefix=$( FN_prefix ${thisFile} )
      typeset thisExtension=$( FN_extension ${thisFile} )
      typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
      typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

      #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

      typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

      if [ ! -f "${thisFile}" ] ; then
	  EH_problem "Missing ${thisFile} -- Skipped"
	  continue
      fi

		#
		# Create -medium
		#
      if [ -f "${thisPathPrefix}-750x300.${thisExtension}" ] ; then
	  opDo cp ${thisPathPrefix}-750x300.${thisExtension} ${thisPrefix}-medium.${thisExtension}
      else
	  opDo convert -resize 25% ${thisFile}  ${thisPrefix}-medium.${thisExtension}
      fi
		
      echo "${thisPrefix}-medium.${thisExtension}"
  done
}


function vis_resizeToSmallSameExtension {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset thisPrefix=$( FN_prefix ${thisFile} )
      typeset thisExtension=$( FN_extension ${thisFile} )

      opDo convert -resize 10% ${thisFile}  ${thisPrefix}-small.${thisExtension}
      echo "${thisPrefix}-small.${thisExtension}"
  done
}


function vis_galleriaLargeImageCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Args: $@ -- Each being a path
Based on galleriaImageMode, create large image.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    case ${galleriaImageMode} in 
	"dontScale")
	    for thisFile in $@; do
		typeset thisPrefix=$( FN_prefix ${thisFile} )
		typeset thisExtension=$( FN_extension ${thisFile} )
		typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
		typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

                #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

		typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

		opDo cp ${thisFile}  ${thisPathPrefix}-large.${thisExtension}
		echo "${thisPathPrefix}-large.${thisExtension}"
	    done
            ;;
	*)
	    for thisFile in $@; do
		typeset thisPrefix=$( FN_prefix ${thisFile} )
		typeset thisExtension=$( FN_extension ${thisFile} )
		typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
		typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

		typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

		opDo cp ${thisFile}  ${thisPathPrefix}-large.${thisExtension}
		echo "${thisPathPrefix}-large.${thisExtension}"
	    done
	 ;;
    esac
}


function vis_galleriaMediumImageCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Args: $@ -- Each being a path to the full size image.
Based on galleriaImageMode, create medium image.

_EOF_
    }
    EH_assert [[ $# -gt 0 ]]

    case ${galleriaImageMode} in 
	"dontScale")
	    for thisFile in $@; do
		typeset thisPrefix=$( FN_prefix ${thisFile} )
		typeset thisExtension=$( FN_extension ${thisFile} )
		typeset thisDirsPart=$( FN_dirsPart ${thisFile} )
		typeset thisNonDirsPart=$( FN_nonDirsPart ${thisFile} )

                #echo ${thisPrefix} ${thisExtension} ${thisDirsPart} ${thisNonDirsPart}

		typeset thisPathPrefix=${thisDirsPart}/${thisPrefix}

		if [ ! -f "${thisFile}" ] ; then
		    EH_problem "Missing ${thisFile} -- Skipped"
		    continue
		fi

		#
		# Create -medium
		#
		if [ -f "${thisPathPrefix}-750x300.${thisExtension}" ] ; then
		    opDo cp ${thisPathPrefix}-750x300.${thisExtension} ${thisPrefix}-medium.${thisExtension}
		else
		    opDo cp ${thisFile} ${thisPrefix}-medium.${thisExtension}
		fi
		
		echo "${thisPrefix}-medium.${thisExtension}"
	    done
            ;;
	*)
	    opDo vis_resizeToMediumSameExtension $@
	 ;;
    esac
}


function vis_galleriaSmallImageCreate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Args: $@ -- Each being a path
Based on galleriaImageMode, create small image.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]


    case ${galleriaImageMode} in 
	"dontScale")
	    for thisFile in $@; do
		typeset thisPrefix=$( FN_prefix ${thisFile} )
		typeset thisExtension=$( FN_extension ${thisFile} )

		opDo cp ${thisFile} ${thisPrefix}-small.${thisExtension}
		echo "${thisPrefix}-small.${thisExtension}"
	    done
            ;;
	*)
	    opDo vis_resizeToSmallSameExtension $@
	 ;;
    esac
}


function vis_renameToLargeSameExtension {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset thisPrefix=$( FN_prefix ${thisFile} )
      typeset thisExtension=$( FN_extension ${thisFile} )

      opDo cp ${thisFile}  ${thisPrefix}-large.${thisExtension}
      echo "${thisPrefix}-large.${thisExtension}"
  done
}


function vis_resampleToMediumSameExtension {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset thisPrefix=$( FN_prefix ${thisFile} )
      typeset thisExtension=$( FN_extension ${thisFile} )

      opDo convert -resample 33% ${thisFile}  ${thisPrefix}-medium.${thisExtension}
  done
}


function vis_bystarCanonicalize {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  Args: $@ -- Each being a path
_EOF_
  }

  for thisFile in $@; do
      typeset dateRenamedFile=$( vis_exifDateAutoRename ${thisFile} )

      if [ -z "${dateRenamedFile}" ] ; then
	  opDo vis_resizeToMedium ${thisFile}
      else
	  opDo vis_resizeToMedium ${dateRenamedFile}
      fi
  done
}


function vis_filesListForPath {
  EH_assert [[ $# -gt 0 ]]
  function describeF {  cat  << _EOF_
  List files subject to ${since}
  Args: $@ -- Each being a path
  Params: -p since=<dateSpecification>
_EOF_
  }

  EH_assert [[ '"${since}"_' != "INVALID_" ]]

  filesList=$( vis_newerThanSinceDateTag  "${since}" "$@" )

  echo ${filesList}
}


function vis_galleryUploadStdin {
  EH_assert [[ $# -eq 0 ]]
  function describeF {  cat  << _EOF_
LEGACY Perl Based Gallery1
Upload to ${album} from $* for ${bystarUid}
_EOF_
  }

  EH_assert [[ "${bystarUid}_" != "INVALID_" ]]
  EH_assert [[ "${album}_" != "INVALID_" ]]

  bystarHereAnalyzeAcctBagp 2> /dev/null

  albumName=$( getRemoteAlbumName )
  #echo ${albumName}

  filesLines=$( cat )
  filesList=$( echo ${filesLines} )

  if [ "${filesList}_" != "_" ] ; then
      typeset tmpFile=$( FN_tempFile )

    opDo perl /opt/public/osmt/bin/galleryadd.pl -g http://web.${cp_acctFactoryBaseDomain}/gallery -u admin -p ${bystarUidPasswdDecrypted} -c ${albumName}  ${filesList} | tee ${tmpFile}

    if grep "Error:  specified album already exists" ${tmpFile} ; then
	ANT_raw "${albumName} Alread Exists, we are going to add now"
	opDo perl /opt/public/osmt/bin/galleryadd.pl -g http://web.${cp_acctFactoryBaseDomain}/gallery -u admin -p ${bystarUidPasswdDecrypted} -a ${albumName}  ${filesList}
    fi
  else
    ANT_raw "No Pictures To Upload"
  fi
}

