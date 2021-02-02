* Encoding: UTF-8.

WEIGHT BY weight.

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY q6
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY employ
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY q14
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY gender_client
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY race
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

CORRELATIONS
  /VARIABLES=educ q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY educ
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY marstat
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY pid3
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY pid7
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY presvote16post
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY ideo5
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


CORRELATIONS
  /VARIABLES=newsint_reverse_coded q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded
    q8_4_reverse_coded q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded
    q8_9_reverse_coded q8_10_reverse_coded
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY religpew
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY pew_churatd
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).


T-TEST GROUPS=pew_bornagain(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded q9
  /CRITERIA=CI(.95).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY pew_religimp
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

ONEWAY q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded BY pew_prayer
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS
  /POSTHOC=BONFERRONI ALPHA(0.05).

CORRELATIONS
  /VARIABLES=age q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

USE ALL.
COMPUTE filter_$=(faminc_new <= 13).
VARIABLE LABELS filter_$ 'faminc_new <= 13 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

CORRELATIONS
  /VARIABLES=faminc_new q8_1_reverse_coded q8_2_reverse_coded q8_3_reverse_coded q8_4_reverse_coded
    q8_5_reverse_coded q8_6_reverse_coded q8_7_reverse_coded q8_8_reverse_coded q8_9_reverse_coded
    q8_10_reverse_coded
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
