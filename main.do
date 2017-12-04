// Huy Le
cd "C:\Users\vc2000\Documents\My STATA\assignment"
clear
use "bankrupt.dta"
*create the variables
gen x1=wcap/at   
gen x2=re/at   
gen x3=ebit/at
gen x4=(csho*price)/lt
gen x5=sale/at

*create z score for every obs
gen z=0.12*x1+0.014*x2+0.033*x3+0.006*x4+0.999*x5


*drop all firms with SIC codes of 6000-6999 and 4800-4999
drop if inrange(sic,6000,6999)
drop if inrange(sic,4800,4999)

*winsorioze z score at 1 and 99th percentiles
winsor z, generate(winsor) p(0.01)

*find mean, median, min and max z scpre for the whole sample
summarize z, detail
/*
 Mean .8874074
 Median .8041924
 Min .0814416
 Max 4.537371
*/

*find mean, median, min, and max z score by 2 digit SIC industry
sort sic2
by sic2: sum z, detail 

*find mean z score by year
sort year
//mean z, over(year)
by year: egen m = mean(z)

*graph
graph twoway line m year, name(zscore_by_year, replace) scale(1.3) title("Mean zscore by year graph") note("this graph use 2 variables m and year, sorted by year") aspectratio(0.5)

