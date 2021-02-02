* Encoding: UTF-8.


/* Create single vaccine timing interest variable


RECODE q115_family q115_community (1=1) (ELSE=0) INTO q115_family_recoded q115_community_recoded.
EXECUTE.

COMPUTE vaccine_timing_interest=q115_family_recoded + q115_community_recoded.
EXECUTE.

* Define Variable Properties.
*vaccine_timing_interest.
VALUE LABELS vaccine_timing_interest
  .00 'Did not click on list'
  1.00 'Clicked on list'.
EXECUTE.


