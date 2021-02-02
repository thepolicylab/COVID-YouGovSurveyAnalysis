* Encoding: UTF-8.


/* STILL TO DO: FIX INCONSISTENCY IN Q24



/* Combine the data from YouGov and Qualtrics.

DATASET ACTIVATE DataSet2.
ADD FILES /FILE=*
  /FILE='DataSet1'
  /RENAME q11_7_TEXT=q11_t q21_1=q21 q22_1=q22 q_23_follow_up=q23_follow_up q27_8_TEXT=q27_t 
    q42_6_TEXT=q42_t
  /IN=source.
VARIABLE LABELS source
 'Case source is DataSet1'.
EXECUTE.

* Define Variable Properties.
*source.
VALUE LABELS source
  0 'YouGov'
  1 'Qualtrics'.
EXECUTE.


/* Calculate age.

DATASET ACTIVATE DataSet2.
COMPUTE age=2020 - birthyr.
EXECUTE.


/* Create age range variable.

RECODE age (18 thru 29=1) (30 thru 39=2) (40 thru 49=3) (50 thru 59=4) (60 thru 69=5) (70 thru 
    79=6) (80 thru 100=7) INTO age_range.
EXECUTE.

* Define Variable Properties.
*age_range.
VALUE LABELS age_range
  1.00 '18 to 29'
  2.00 '30 to 39'
  3.00 '40 to 49'
  4.00 '50 to 59'
  5.00 '60 to 69'
  6.00 '70 to 79'.
EXECUTE.


/* Calculate 18- to 29-year-olds versus everybody else variable.

RECODE age (18 thru 29=1) (30 thru 100=0) INTO eighteen_to_twentynine_versus_everybody_else.
EXECUTE.

* Define Variable Properties.
*eighteen_to_twentynine_versus_everybody_else.
VALUE LABELS eighteen_to_twentynine_versus_everybody_else
  .00 'not 18 to 29'
  1.00 '18 to 29'.
EXECUTE.


/* Calculate 18- to 29-year-olds versus 30- to 39-year-olds versus everybody else.

RECODE age (18 thru 29=1) (30 thru 39=2) (40 thru 100=3) INTO 
    eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else.
EXECUTE.

* Define Variable Properties.
*eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else.
VALUE LABELS eighteen_twentynine_vs_thirty_thirtynine_vs_everybody_else
  1.00 '18 to 29'
  2.00 '30 to 39'
  3.00 '40 and over'.
EXECUTE.


* Define Variable Properties.
*source.
VALUE LABELS source
  0 'YouGov'
  1 'Qualtrics'.
EXECUTE.


/* Create exclusion criterion (did not report having taken the survey before and did complete).

IF  (source = 0) include_YouGov=1.
EXECUTE.

RECODE include_YouGov (1=1) (SYSMIS=0).
EXECUTE.

RECODE taken_before (SYSMIS=0) (1=1) (2=0) INTO include_Qualtrics.
EXECUTE.

COMPUTE include=include_YouGov + include_Qualtrics.
EXECUTE.


/* Create new variable showing whether or not someone is currently employed.

DATASET ACTIVATE DataSet2.
IF  (q14 = 1) working=0.
EXECUTE.

RECODE working (0=0) (SYSMIS=1).
EXECUTE.


/* Recode behaviors in the last two weeks to deal with missing values and not answered responses.

RECODE q4_1 q4_2 q4_3 q4_4 (1=1) (SYSMIS=0) (2=0) (3=0) (4=0).
EXECUTE.


/* Recode testing location preferences to deal with missing values and not answered responses.

RECODE q42_1 q42_2 q42_3 q42_4 q42_5 (1=1) (SYSMIS=0) (2=0) (3=0) (4=0).
EXECUTE.

