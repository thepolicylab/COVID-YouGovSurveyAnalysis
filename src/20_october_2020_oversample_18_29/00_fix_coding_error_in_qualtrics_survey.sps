* Encoding: UTF-8.

/* Fix coding error in the Qualtrics survey.

RECODE q14 (1=1) (2=2) (3=3) (4=4) (5=5) (6=6) (7=7) (8=8) (9=9) (10=SYSMIS) (11=10) (12=11) 
    (13=12) (14=13) (15=14) (16=15) (17=16) (18=17) (19=18) (20=19) (21=20) (22=21) (23=22).
EXECUTE.

* Define Variable Properties.
*q14.
VALUE LABELS q14
  1 'Currently not working'
  2 'Healthcare'
  3 'Dental'
  4 'Childcare'
  5 'Congregate living (Nursing home, Assisted living, Group home)'
  6 'Faith-based organization'
  7 'Gym'
  8 'Hair Salon or Barbershop'
  9 'Personal services (Nail, Massage, Tattoo, Facialist, Other)'
  10 'Physical therapy or Chiropractic'
  11 'Restaurant or Bar'
  12 'Grocery store'
  13 'Retail'
  14 'Construction / Trades'
  15 'Manufacturing'
  16 'Education'
  17 'Government (Inspectors, DMV, others)'
  18 'Transportation'
  19 'First responder (Fire, EMS, Police)'
  20 'Corrections'
  21 'Other (please specify)'.
EXECUTE.
