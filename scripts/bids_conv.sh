export BIDS_DIR=/home/ubuntu/BIDS

PARTIC=$1
#unzip '/home/ubuntu/raw/HCP-LifeSpan-Pilot/'$PARTIC''
ANAT_T1=`find '/home/ubuntu/raw/HCP-LifeSpan-Pilot/'$PARTIC'' -iname '*3T_T1w_MPR1_gdc.nii.gz'`
ANAT_T2=`find '/home/ubuntu/raw/HCP-LifeSpan-Pilot/'$PARTIC'' -iname '*3T_T2w_SPC1_gdc.nii.gz'`


partic=`echo $PARTIC | tr '[:upper:]' '[:lower:]'`
ANAT_T1_BIDS="sub-"$partic"_T1w.nii.gz"
ANAT_T2_BIDS="sub-"$partic"_T2w.nii.gz"

if [ ! -d "$BIDS_DIR"/"sub-"$partic""/anat ] && [ ! -z "$ANAT_T1" ]; then
    mkdir -p "$BIDS_DIR"/"sub-"$partic""/anat
    cp $ANAT_T1 "$BIDS_DIR/sub-$partic/anat/$ANAT_T1_BIDS"
    cp $ANAT_T2 "$BIDS_DIR/sub-$partic/anat/$ANAT_T2_BIDS"
fi


