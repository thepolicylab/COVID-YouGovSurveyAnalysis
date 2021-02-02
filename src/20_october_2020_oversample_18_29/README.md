# Oversample of 18-29 Year Olds in Rhode Island

Here is a description of the survey to fill in.

## Data Sets

The raw data are two sets of files, each located in `data/Second_Wave`. Data collected by YouGov start with `YouGov_` and data collected via the Policy Lab's Qualtrics instrument are named `Qualtrics_`. Note that we save multiple pulls from each instrument, so each file is also labeled with the date that it was pulled. See `data/Second_Wave/README.md` for more details.

## Running the Analysis

To reproduce the analysis:

1. Launch SPSS
2. Load Qualtrics data: `Open` > `Data` and choose `data/Second_Wave/Qualtrics_YYYY-MM-DD.sav` where `YYYY-MM-DD` is the date of the pull you want to use
3. Fix Qualtrics Coding: Select `Open` > `Syntax` > `00_fix_coding_error_in_qualtrics_survey.sps`
4. Select all commands and `Run`
5. Load YouGov data: Select `Open` > `Data` and choose `YouGov_YYYY-MM-DD.sav` where `YYYY-MM-DD` is the date of the pull you want to use
6. Load merge code: Select `Open` > `Syntax` > `01_data_merge_and_cleanup.sps`
7. Create joint data set: Select all commands and `Run`
8. Run final analysis: Select `Open` > `Syntax` and choose the desired segment of the analysis, select all commands, and `Run`. Specifically, the main analysis is named `20_comparisons_by_age_range.sps` though previous analyses are stored for posterity.
