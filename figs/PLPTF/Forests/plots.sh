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

declare -a values_UIUP=(
	'0.906437'
	'0.858470'
	'0.914808'
	'0.742837'
	'0.880134'
	'0.881933'
	'0.716402'
	'0.929343'
	'0.935975'
	'0.738977'
	'0.791466'
	'0.955312'
)

declare -a values_CICP=(
	'0.918405'
	'0.859866'
	'0.924322'
	'0.7597'
	'0.893042'
	'0.89895'
	'0.768047'
	'0.930397'
	'0.957195'
	'0.761566'
	'0.812282'
	'0.97835'
)

cmd_pars='matlab -nosplash -nodesktop -r "'
#for i in "${names[@]}"
#do
#	tmp="genfig_Forests_MH($i);genfig_Forests_X_MH $i;"
#	cmd_pars=$cmd_pars$tmp
#done
#cmd_pars=$cmd_pars'exit"'
for (( i=0; i<${#names[@]}; i+=1 )); do
	tmp1="genfig_Forests_MH('${names[$i]}', ${values_UIUP[$i]}, ${values_CICP[$i]});"
	tmp2="genfig_Forests_X_MH('${names[$i]}', ${values_UIUP[$i]});"
#	if [[	${names[$i]} != "MushroomDownsampled" ]]; then
#		tmp2="genfig_Forests_X_MH('${names[$i]}', ${values_UIUP[$i]});"
#	fi
	cmd_pars=$cmd_pars$tmp1$tmp2
done
cmd_pars=$cmd_pars'exit"'

#echo ${names[0]}
#echo ${names[5]}
#echo ${#names[@]} 
echo $cmd_pars

## run matlab for ploting and saving as pdf's
eval $cmd_pars
