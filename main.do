*create the variables
replace x1=wcap/at
replace x2=re/at
replace x3=ebit/at
replace x4=(at-lt)/lt
replace x5=sale/at

*create z score for every obs
replace z=0.12*x1+0.014*x2+0.033*x3+0.006*x4+0.999*x5

*drop all firms with SIC codes of 6000-6999 and 4800-4999
drop if inrange(sic,6000,6999)
drop if inrange(sic,4800,4999)

