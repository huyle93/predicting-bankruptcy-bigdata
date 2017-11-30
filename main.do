*create the variables
capture confirm variable x1
if !_rc {
                       replace x1=wcap/at
               }
               else {
                       gen x1=wcap/at
               }
capture confirm variable x2
if !_rc {
                       replace x2=re/at
               }
               else {
                       gen x2=re/at
               }
capture confirm variable x3
if !_rc {
                       replace x3=ebit/at
               }
               else {
                       gen x3=ebit/at
               }
capture confirm variable x4
if !_rc {
                       replace x4=(at-lt)/lt
               }
               else {
                       gen x4=(at-lt)/lt
               }
capture confirm variable x5
if !_rc {
                       replace x5=sale/at
               }
               else {
                       gen x5=sale/at
               }

*create z score for every obs
capture confirm variable z
if !_rc {
                       replace z=0.12*x1+0.014*x2+0.033*x3+0.006*x4+0.999*x5
               }
               else {
                       gen z=0.12*x1+0.014*x2+0.033*x3+0.006*x4+0.999*x5
               }

*drop all firms with SIC codes of 6000-6999 and 4800-4999
drop if inrange(sic,6000,6999)
drop if inrange(sic,4800,4999)

*winsorioze z score at 1 and 99th percentiles
winsor z, generate(winsor) p(0.01)
