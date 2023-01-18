


#Directory of data: The directory should contain hic_df.qs and chrom.sizes file.
dir_data="/storage08/kwangmoon/Muscle/data/Liu2021/Reduced"

#Directory of functions
dir_functions="/storage08/kwangmoon/Muscle/code/functions"

#Directory where Muscle output goes into
#dir_out="/storage08/kwangmoon/Muscle/results/Liu2021/HiConly/Reduced"
dir_out="/storage08/kwangmoon/Muscle/results/Liu2021/All/Reduced"



#Initial maximum rank of Methylation SVD
exploration_rank=150


#Modality of the tensors. #Only threecasesare allowed (All,HiC,HiC+CG)

modality="All" #When all Hi-C, mCG, mCH are analyzed
#modality="HiC" #When only Hi-C is analyzed
#modality="HiC+CG" #when only Hi-C and mCG are analyzed


# If bulk TAD information exists, set it as TRUE. Otherwise, FALSE
#Bulk_exist=TRUE
Bulk_exist=FALSE

#If GNU parllel exists, type TRUE. Otherwise, FALSE. 
GNU=TRUE

#tolerance level for each rank 1 update 
tol=0.00001


#maximum number of iterations for each rank 1 update
maxiter=10

#servers should be listed without any space in between. If you are not using multiple servers for GNU parallel, leave it as ssh=NULL
#For example, ssh="hodor01,hodor02,hodor03"
ssh="hodor01,hodor02,hodor03"


#####Keep 


