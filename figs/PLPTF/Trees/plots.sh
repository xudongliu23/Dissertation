#!/bin/bash

## declare an array variable
declare -a names=(
	'BreastCancerWisconsinDownsampled'
	'CarEvaluation'
	'CreditApprovalDownsampledFurther'
	'GermanCreditDownsampledFurther'
	'IonosphereDownsampledFurther'
	'MammographicMassDownsampled'
	'MushroomDownsampled'
	'NurseryDownsampledFurther'
	'SpectHeartDownsampledFurther'
	'TicTacToe'
	'VehicleDownsampledFurther'
	'WineDownsampled'
)

cmd_pars='matlab -nosplash -nodesktop -r "'
for i in "${names[@]}"
do
	tmp="genfig_Trees_MH $i;genfig_Trees_X_MH $i;"
	cmd_pars=$cmd_pars$tmp
done
cmd_pars=$cmd_pars'exit"'

#echo $cmd_pars

## run matlab for ploting and saving as pdf's
eval $cmd_pars
