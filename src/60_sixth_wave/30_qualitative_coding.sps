* Encoding: UTF-8.


/* This code can be used for BOTH datasets associated with Survey 6:
/* TPL_Testing_Survey_SixthWave_YouGov_RI.sav and TPL_Testing_Survey_SixthWave_YouGov_US.sav
/* However, only the results for the RI sample are reported


/* Label coded variables

* Define Variable Properties.
*concerns_1.
VALUE LABELS concerns_1
  1.00 'Long-term side effects'
  2.00 'Short-term side effects'
  3.00 'Side effects (unspecified)'
  4.00 'Freedom/government interference'
  5.00 'Children not vulnerable'
  6.00 'Children already had COVID'
  7.00 "Vaccine won't protect against variants"
  8.00 'Want guidance from doctor'
  9.00 'Wait and see'
  10.00 'Vaccine development rushed/unsafe/etc.'
  11.00 'Pharmaceutical companies untrustworthy'
  12.00 "COVID is not dangerous"
  13.00 'Insufficient uptake'
  14.00 'Not concerned'
  15.00 'Other'.
EXECUTE.

* Define Variable Properties.
*concerns_2.
VALUE LABELS concerns_2
  1.00 'Long-term side effects'
  2.00 'Short-term side effects'
  3.00 'Side effects (unspecified)'
  4.00 'Freedom/government interference'
  5.00 'Children not vulnerable'
  6.00 'Children already had COVID'
  7.00 "Vaccine won't protect against variants"
  8.00 'Want guidance from doctor'
  9.00 'Wait and see'
  10.00 'Vaccine development rushed/unsafe/etc.'
  11.00 'Pharmaceutical companies untrustworthy'
  12.00 "COVID is not dangerous"
  13.00 'Insufficient uptake'
  14.00 'Not concerned'
  15.00 'Other'.
EXECUTE.

* Define Variable Properties.
*concerns_3.
VALUE LABELS concerns_3
  1.00 'Long-term side effects'
  2.00 'Short-term side effects'
  3.00 'Side effects (unspecified)'
  4.00 'Freedom/government interference'
  5.00 'Children not vulnerable'
  6.00 'Children already had COVID'
  7.00 "Vaccine won't protect against variants"
  8.00 'Want guidance from doctor'
  9.00 'Wait and see'
  10.00 'Vaccine development rushed/unsafe/etc..'
  11.00 'Pharmaceutical companies untrustworthy'
  12.00 "COVID is not dangerous"
  13.00 'Insufficient uptake'
  14.00 'Not concerned'
  15.00 'Other'.
EXECUTE.


/* Concerns about the children's vaccines in the full sample

WEIGHT BY weight.

FREQUENCIES VARIABLES=concerns_1 concerns_2 concerns_3
  /ORDER=ANALYSIS.


/* Do concerns about side effects cluster among parents?

IF  (concerns_1 = 1 | concerns_1 = 3 | concerns_2 = 1 | concerns_2 = 3 | concerns_3 = 1 | 
    concerns_3 = 3) concerned_about_longterm_or_unspecified_side_effects=1.
EXECUTE.

RECODE concerned_about_longterm_or_unspecified_side_effects (1=1) (SYSMIS=0).
EXECUTE.

WEIGHT BY weight_for_parent_nonparent_comparisons.

CROSSTABS
  /TABLES=concerned_about_longterm_or_unspecified_side_effects BY parent_of_minor
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.
