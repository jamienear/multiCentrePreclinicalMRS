#!/bin/zsh
#Script for making data packet directory structure for the 
#Preclinical MultiSite MRS study. The data packet directory 
#structure is loosely based on BIDS MRS standard, but without 
#the requirement of storing the data in nifti-MRS format.  
#Jamie Near, Sunnybrook Research Institute, 2024
#Updates by Mark Mikkelsen, Weill Cornell Medicine, 2024

#First make the study directory
studydir='DPXX'
if [ ! -d $studydir ]
then
	mkdir -p $studydir
fi
echo Study directory: $studydir

#Then make an array of Subject IDs (N=8):
subs=(01 02 03 04 05 06 07 08)
echo Subject IDs: $subs

#Now make an array of Session IDs:
###(remove 02 if only one timepoint)
sessions=(01 02)
echo Session IDs: $sessions

#initialize the value of the mrs 'acq' field:
###(edit 'press' to your mrs sequence of choice)
mrsacq='press'

#initialize the value of the mrs 'voi' field:
###(edit 'hipp' to your voi of choice - 
### hippocampus ('hipp') or striatum ('stri'))
mrsvoi='hipp'

#initialize the value of the anat 'acq' field:
###(edit '3drare' to your anat sequence of choice)
anatacq='3drare'

#initialize the orientation of the anatomical image: 
###(edit 'cor' to your orientation of choice - 
###(axial ('ax'), sagittal('sag'), or coronal ('cor'))
anatorient='cor'

#Loop through all subjects and sessions to make all needed directories:
for n in $subs; do
	mkdir -p $studydir/sub-${n} #make subject directory first	
	for m in $sessions; do
		#make session directories and subdirectories:
		mkdir -p $studydir/sub-${n}/ses-${m}
		mkdir -p $studydir/sub-${n}/ses-${m}/mrs
		mkdir -p $studydir/sub-${n}/ses-${m}/anat
		mkdir -p $studydir/sub-${n}/ses-${m}/other
		#mkdir -p $studydir/sub-${n}/ses-${m}/mrs/sub-${n}_ses-${m}_acq-${mrsacq}_voi-${mrsvoi}_svs
		#mkdir -p $studydir/sub-${n}/ses-${m}/mrs/sub-${n}_ses-${m}_acq-${mrsacq}_voi-${mrsvoi}_mrsref
		#mkdir -p $studydir/sub-${n}/ses-${m}/anat/sub-${n}_ses-${m}_acq-${anatacq}_anat-${anatorient}
	done
done




