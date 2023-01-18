# Muscle : semi-non negative joint decomposition of multiple single cell tensors
![Muscle diagram](/figures/Figure_intro.jpg)

## Muscle Usage

### 1. Preparation

git clone https://github.com/kp223/Muscle.git

-   R: [R installation](https://www.r-project.org)  (>=4.2.1)
-   parallel (Not required, but highly recommended)

#### 1. Required R packages

```
install.packages('pacman')
pacman::p_load(MASS,Matrix,dplyr,rTensor,reshape2,Rcpp,foreach,inline,parallel,doParallel,RSpectra,qs,gtools)
```


#### 2. Quick start
This section gives instruction for running the example data [Liu et al. 2021 data](https://www.nature.com/articles/s41586-020-03182-8).
Data can be downloaded from [this link](https://drive.google.com/drive/folders/13KRB2n526JymjnNixNtWmt07KEZQv2ls?usp=sharing). Make sure that you download the data to the directory (or folder) that you cloned Muscle to. e.g., If the directory of Muscle is '/Users/kp223/Muscle', the directory for the data you downloaded from the link should be '/Users/kp223/Muscle/data'


- a. First change directory to **wrapper** as below in terminal. The {Muscle directory} is going to be the directory that you cloned the Muscle. e.g., 
{Muscle directory} can be /Users/kp223/Muscle.

```
cd /{Muscle directory}/code/wrapper/
```


Before running **Muscle.sh** file, change two configuration files in **wrapper** directory: **config_file_preprocess.R**, **config_file_model.R**, which contain aruments and 
hyperparameters for running Muscle.


- b. For **config_file_preprocess.R**, only change **dir_data** and **dir_functions**. In case **parallel** does not exist, one can set **GNU=FALSE**. Moreover, if multiple servers are available for GNU 
parallel, one can set ssh argument such as **ssh='server01,server02,server03'**. Note that **ssh=NULL** should be used when **parallel** does not exist.




```


#number of chromosomes (23(Human) or 20(Mouse))
chr_num=20


#directory of the data
dir_data="{Muscle directory}/data/example"

#directory of the functions
dir_functions="{Muscle directory}/example"


#Initial maximum rank of SVD of HiC
exploration_rank=150

#Do you want debiasing? (Yes: TRUE, No: FALSE)
debias=TRUE

#Replace only zero entries with impuation (Yes: TRUE, No: FALSE)
only_zero_entries=FALSE


#If GNU parllel exists, type TRUE. Otherwise, FALSE. 
GNU=TRUE


#server names for gnu parallel. If exists, list them with comma without space. e.g., 'server01,server02'
#ssh=NULL
ssh='hodor01,hodor02,hodor03'


#chromosome size file name within the data directory.
sizefile='mm10.chrom.sizes'
#sizefile='mm9.chrom.sizes'
#sizefile='hg19.chrom.sizes'


```




- c. For **config_file_model.R**, only change **dir_data**,**dir_functions**, **dir_out**. Similar to **config_file_preprocess.R** file, in case **parallel** does not exist, one can set **GNU=FALSE**. Moreover, if 
multiple servers are available for GNU parallel, one can set ssh argument such as **ssh='server01,server02,server03'**. Note that **ssh=NULL** should be used when **parallel** 
does not exist.





```






#Directory of data: The directory should contain hic_df.qs and chrom.sizes file.
dir_data="{Muscle directory}/data/example"

#Directory of functions
dir_functions="{Muscle directory}/code/functions"

#Directory where Muscle output goes into
dir_out="{Muscle directory}/results/example"



#Initial maximum rank of Methylation SVD
exploration_rank=150


#Modality of the tensors. #(only 3 choices available : "All", or "HiC", or "HiC+CG")

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
#For example, ssh='hodor01,hodor02,hodor03'
ssh='hodor01,hodor02,hodor03'

```




- d. Now, run Muscle as below in terminal. Note that the directory should be **/{Muscle directory}/code/wrapper**.




```
bash Muscle.sh
```



- e. After running Muscle one should choose ranks of scHi-C tensors, mCG, and mCH methylation matrices. Type the rank and hit enter. Muscle provides eigen value trace plots 'svd_plot.pdf', 'svd_mCG_plot.pdf' ,and 'svd_mCH_plot.pdf', consequetively. We recommend to choose rank for each data as the elbow point of the plot. For our analysis, we used R=40 for scHi-C, R=30 for mCG methylation matrix, and R=35 for mCH methylation matrix. The queries will be as below in the terminal.


```
Please specify the rank value based on the singular value 'svd_plot.pdf' and hit enter (skipping will give rank=30) : 40

Please specify the mCG matrix rank value based on the singular value 'svd_mCG_plot.pdf' and hit enter (skipping will give rank=30) : 30

Please specify the mCH matrix rank value based on the singular value 'svd_mCH_plot.pdf' and hit enter (skipping will give rank=30) : 35

```
