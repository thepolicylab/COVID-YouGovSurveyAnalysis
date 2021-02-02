* Encoding: UTF-8.


/* Merge YouGov representative Rhode Island samples from Survey 2 and Survey 3.

DATASET ACTIVATE DataSet1.
ADD FILES /FILE=*
  /FILE='DataSet2'
  /RENAME gender_client=gender
  /IN=time.
VARIABLE LABELS time
 'Case source is DataSet2'.
EXECUTE.


/* Clean up variables.

* Define Variable Properties.
*time.
VALUE LABELS time
  0 'Time 1 (9/21-10/19, 2020)'
  1 'Time 2 (11/10-11/17, 2020)'.
EXECUTE.



COMPUTE age=2020 - birthyr.
EXECUTE.



RECODE age (18 thru 29=1) (30 thru 39=2) (40 thru 49=3) (50 thru 59=4) (60 thru 69=5) (70 thru 
    Highest=6) INTO age_range.
EXECUTE.



RECODE q4_1 q4_2 q4_3 q4_4 q4_5 (1=1) (2=0) (8=0) (9=0) (SYSMIS=0).
EXECUTE.


/* Score knowledge questions



RECODE q55_3 q55_4 q55_7 q55_8 (2=1) (1=0) INTO q55_3_correct q55_4_correct q55_7_correct 
    q55_8_correct.
EXECUTE.

RECODE q55_1 q55_2 q55_5 q55_6 (2=0) (1=1) INTO q55_1_correct q55_2_correct q55_5_correct 
    q55_6_correct.
EXECUTE.




COMPUTE covid_knowledge_score=MEAN(q55_1_correct,q55_2_correct,q55_3_correct,q55_4_correct,
    q55_5_correct,q55_6_correct,q55_7_correct,q55_8_correct).
EXECUTE.


/* Bin US death estimates

RECODE q53 (Lowest thru 199999=1) (200000 thru 299999=2) (300000 thru Highest=3) INTO 
    US_deaths_estimate_low_right_high.
EXECUTE.


* Define Variable Properties.
*US_deaths_estimate_low_right_high.
VALUE LABELS US_deaths_estimate_low_right_high
  1.00 'Low (<200,000)'
  2.00 'About right (200,000-299,999)'
  3.00 'High (≥300,000)'.
EXECUTE.


/* Re-bin family income


