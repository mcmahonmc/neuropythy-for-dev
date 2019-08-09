#! /bin/bash

docker run -ti --rm -v "$HOME/BIDS":/bids_dir -v "$HOME/outputs":/output bids/hcppipelines --participant_label $1 --n_cpus 4 --stages PreFreeSurfer FreeSurfer PostFreeSurfer --license_key CM2O1EzP2NQw /bids_dir /output participant

aws s3 sync $HOME/outputs/sub-$1 s3://neurohack-neuropythy-for-dev/sub-$1




