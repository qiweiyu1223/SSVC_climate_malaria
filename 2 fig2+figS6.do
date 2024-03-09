//
// 
// *****************************************************回归***************************************
//
*生成直方图的数据
global hhhhhh mean_3mon_tmp mean_6mon_tmp tmp_9_mean mean_12mon_tmp log_pre_3_mean log_pre_6_mean log_pre_9_mean log_pre_12_mean mean_3mon_wet mean_6mon_wet wet_9_mean mean_12mon_wet 	
foreach hh in $hhhhhh{
clear
use "$use_data/main_data"
twoway__histogram_gen `hh' , bin(11) gen(y x,replace) fraction
keep y x
gen num=_n
keep if num<=11

save "$fig_data/fig_econom_8_Cru/origin/`hh'_his.dta",replace
}


*在直方图数据的基础上，生成一个用于匹配的编号
foreach hh in $hhhhhh{
clear
use "$fig_data/fig_econom_8_Cru/origin/`hh'.dta"
drop if z==.

capture confirm variable num, exact
                if !_rc {
					drop num
					gen num=12-_n
                      
                }
                else { 
	

                     gen num=12-_n
                }


save "$fig_data/fig_econom_8_Cru/origin/`hh'.dta",replace
}

*margins的代码生成的数据和直方图生成的数据，作匹配。
foreach hh in $hhhhhh{
clear
use "$fig_data/fig_econom_8_Cru/origin/`hh'.dta"
merge 1:1 num using "$fig_data/fig_econom_8_Cru/origin/`hh'_his.dta"
drop _merge 
save "$fig_data/fig_econom_8_Cru/`hh'.dta",replace
}





***************************************************
cd "$fig_data/fig_econom_8_Cru"

*tmp
clear

use mean_3mon_tmp.dta
sum x min95 max95
replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("242 121 112") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("242 121 112") mcolor("242 121 112") mlcolor("242 121 112") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("242 121 112") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.6)  color("242 121 112") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("3-month mean of TMP",size(3)) ytitle("Effect on malaria risk (%)", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-40 20)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-40 (20) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(17 (6) 35, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_3mon_tmp, replace)

	
	
clear

use mean_6mon_tmp.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("242 121 112") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("242 121 112") mcolor("242 121 112") mlcolor("242 121 112") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("242 121 112") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.45)  color("242 121 112") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("6-month mean of TMP",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-30 20)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(17 (5) 32, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_6mon_tmp, replace)


	
	
clear

use tmp_9_mean.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("242 121 112") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("242 121 112") mcolor("242 121 112") mlcolor("242 121 112") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("242 121 112") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.3)  color("242 121 112") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("9-month mean of TMP",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-30 20)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(17 (5) 32, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(tmp_9_mean, replace)

	
	
	
clear

use mean_12mon_tmp.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("242 121 112") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("242 121 112") mcolor("242 121 112") mlcolor("242 121 112") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("242 121 112") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.2)  color("242 121 112") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("12-month mean of TMP",size(3)) ytitle("", axis(1)) ytitle("Percent", axis(2)) ///
	ysca(axis(1) r(-40 20)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(18 (4) 30, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_12mon_tmp, replace)


*pre	
	
clear

use log_pre_3_mean.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("137 131 191") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("137 131 191") mcolor("137 131 191") mlcolor("137 131 191") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("137 131 191") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.14)  color("137 131 191") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("3-month mean of PRE (log)",size(3)) ytitle("Effect on malaria risk (%)", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-30 20)) ///
	ysca(axis(2) r(0 140)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (20) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (20) 60,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(-6 (3) 6, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(log_pre_3_mean, replace)

	
	
clear

use log_pre_6_mean.dta

replace y=y*100


replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("137 131 191") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("137 131 191") mcolor("137 131 191") mlcolor("137 131 191") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("137 131 191") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(0.9)  color("137 131 191") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("6-month mean of PRE (log)",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-50 20)) ///
	ysca(axis(2) r(0 140)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-40 (20) 40,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (20) 60,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(-3 (3) 6, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(log_pre_6_mean, replace)

	
	
clear

use log_pre_9_mean.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("137 131 191") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("137 131 191") mcolor("137 131 191") mlcolor("137 131 191") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("137 131 191") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(0.4)  color("137 131 191") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("9-month mean of PRE (log)",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-50 20)) ///
	ysca(axis(2) r(0 140)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (20) 40,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (20) 60,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(1 (1) 5, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(log_pre_9_mean, replace)


	
clear

use log_pre_12_mean.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("137 131 191") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("137 131 191") mcolor("137 131 191") mlcolor("137 131 191") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("137 131 191") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(0.35)  color("137 131 191") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("12-month mean of PRE (log)",size(3)) ytitle("", axis(1)) ytitle("Percent", axis(2)) ///
	ysca(axis(1) r(-50 20)) ///
	ysca(axis(2) r(0 140)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-20 (20) 40,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (20) 60,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(2 (1) 5, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(log_pre_12_mean, replace)

	
// graph set window fontface "Helvetica"
// global hhhhhh mean_3mon_tmp log_pre_3_mean mean_6mon_tmp log_pre_6_mean tmp_9_mean log_pre_9_mean mean_12mon_tmp    log_pre_12_mean
// graph combine $hhhhhh,  row(4) col(2) imargin(0 0 3 3) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(0.7)  xsize(10) ysize(16) 	


*wet day
*wet	
clear

use mean_3mon_wet.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("5 185 226") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("5 185 226") mcolor("5 185 226") mlcolor("5 185 226") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("5 185 226") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(2.2)  color("5 185 226") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("3-month mean of WET",size(3)) ytitle("Effect on malaria risk (%)", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-20 10)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(0 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(0 (4) 24, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_3mon_wet, replace)
	
	
	
clear

use mean_6mon_wet.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("5 185 226") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("5 185 226") mcolor("5 185 226") mlcolor("5 185 226") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("5 185 226") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.7)  color("5 185 226") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("6-month mean of WET",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-20 10)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-10 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(0 (4) 20, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_6mon_wet, replace)
	

	
clear

use wet_9_mean.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("5 185 226") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("5 185 226") mcolor("5 185 226") mlcolor("5 185 226") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("5 185 226") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.7)  color("5 185 226") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("9-month mean of WET",size(3)) ytitle("", axis(1)) ytitle("", axis(2)) ///
	ysca(axis(1) r(-20 10)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-10 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(4 (4) 20, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(wet_9_mean, replace)
		

	
	
clear

use mean_12mon_wet.dta

replace y=y*100

replace estimate=100*estimate
replace min95=100*min95
replace max95=100*max95

graph twoway ///
	(rcap min95 max95 x, msymbol(circle) color("5 185 226") mlwidth(medium) msize(3)  lwidth(1) yaxis(1)) ///
	(connected estimate x, msymbol(circle) lcolor("5 185 226") mcolor("5 185 226") mlcolor("5 185 226") mlwidth(medium) msize(2) lp(solid) lwidth(0.4)) ///
	(scatter estimate x, msymbol(circle) mlcolor("5 185 226") mcolor(white) mlwidth(medium) msize(2.2) yaxis(1)) ///
	(bar y x,barwidth(1.6)  color("5 185 226") yaxis(2)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("12-month mean of WET",size(3)) ytitle("", axis(1)) ytitle("Percent", axis(2)) ///
	ysca(axis(1) r(-20 10)) ///
	ysca(axis(2) r(0 50)) ///
	yline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(-10 (10) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(1)) ///
	ylabel(0 (5) 20,  format(%4.0f) nogrid labsize(3) angle(360) axis(2)) ///
	xlabel(4 (4) 20, format(%4.0f) nogrid labsize(2.6) angle(0) ) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) legend(off) name(mean_12mon_wet, replace)
	
graph set window fontface "Helvetica"
global hhhhhh mean_3mon_tmp mean_6mon_tmp tmp_9_mean mean_12mon_tmp mean_3mon_wet mean_6mon_wet wet_9_mean mean_12mon_wet
graph combine $hhhhhh,  row(2) col(4) imargin(0 0 3 3) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(0.84)  xsize(16) ysize(8) 	name(tmp_wet_all, replace)

graph set window fontface "Helvetica"
global hhhhhh log_pre_3_mean log_pre_6_mean log_pre_9_mean log_pre_12_mean
graph combine $hhhhhh,  row(1) col(4) imargin(0 0 3 3) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(1.5)  xsize(16) ysize(4) name(pre_all, replace)

