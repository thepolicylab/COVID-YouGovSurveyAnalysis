# Third wave analysis

To reproduce this analysis, perform the following steps in order using SPSS.

## Qualtrics convenience sample

1. Open the data file `data/Third_Wave/TPL_Testing_Survey_ThirdWave_Qualtrics.sav`,
2. Open the data file `data/Third_Wave/TPL_Testing_Survey_SecondWave_Qualtrics.sav`,
3. Open the code file `00_merge_Survey2_Qualtrics_with_Survey3_Qualtrics.sps`, select all code, and click run
4. Open the code file `10_Qualtrics_full_analysis.sps`, select all code, and click run


## YouGov representative sample

In a separate session (i.e., close SPSS and reopen - this is required so that the merge procedure correctly identifies the appropriate data files):

1. Open the data file `data/Third_Wave/TPL_Testing_Survey_SecondWave_YouGov.sav`
2. Open the data file `data/Third_Wave/TPL_Testing_Survey_ThirdWave_YouGov_RhodeIslandonly.sav`
3. Open the code file `01_merge_Survey2_YouGov_with_Survey3_YouGov.sps`, select all code, and click run
4. Open the code file `11_YouGov_full_analysis.sps`, select all code, and click run