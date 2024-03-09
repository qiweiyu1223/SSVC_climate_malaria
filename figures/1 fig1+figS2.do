
clear  
use "$fig_data/fig_econom_1_reduced_form/reduced_1_x.dta"
local controls $natural_control $household_control1 $person_charact _cons hv209 hv217
foreach con in `controls' {
drop if parm=="`con'"   
}


gen x=.
forvalues j=1/25{
replace x=`j' if parm=="ln_deaths_`j'0_1_d"
}

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

sort x
drop if x==.
// gen x = 16-_n
//
// replace estimate=estimate*1000
// replace min95=min95*1000
// replace max95=max95*1000

// sort parm

label define xlabel   ///
	25 "240-250 " ///
	24 "230-240 " ///
	23 "220-230 " ///
	22 "210-220 " ///
	21 "200-210 " ///
	20 "190-200 " ///
	19 "180-190 " ///
	18 "170-180 " ///
	17 "160-170 " ///
	16 "150-160 " ///
	15 "140-150 " ///
	14 "130-140 " ///
	13 "120-130 " ///
    12 "110-120 " ///
    11 "100-110 " ///
    10 "90-100 " ///
	9 "80-90 " ///
	8 "70-80 " ///
	7 "60-70 " ///
	6 "50-60 " ///
    5 "40-50 " ///
	4 "30-40 " ///
	3 "20-30 " ///
	2 "10-20 " ///
	1 "0-10 " ///


label values x xlabel



// sum estimate min95 max95	
graph twoway (connected estimate x if x<=6, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
(connected estimate x if x>=10, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	(scatter estimate x, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lpattern(solid)) ///
	(rcap min95 max95 x if x>=6 & x<=10, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(connected estimate x if x>=6 & x<=10, msymbol(circle) lcolor("237 47 76") mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(scatter estimate x if x>=6 & x<=10, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle(" Distance between households and violent conflicts (km)",size(3.8)) ytitle("Effect on malaria risk (%)",size(4)) ///
	xscale(range(0.8 25.2)) ///
	xlabel( 1 " " 1/25,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-10 (5) 15.0, format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3)) name(reduced_1_x, replace)

	
graph save "$fig\fig_econom_1-2_reduced_1", replace


**************************************************************************************************************************************
clear  
use "$fig_data/fig_econom_1_reduced_form/reduced_2.dta"
local controls $natural_control $household_control1 $person_charact _cons hv209 hv217
foreach con in `controls' {
drop if parm=="`con'"   
}

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

gen x=.
forvalues j=2(2)24{
local n=`j'/2
replace x=`n' if parm=="ln_deaths_`j'0_1_ds2"
}



sort x
drop if x==.
// gen x = 16-_n
//
// replace estimate=estimate*1000
// replace min95=min95*1000
// replace max95=max95*1000

// sort parm

label define xlabel   ///
    12 "220-240 " ///
    11 "200-220 " ///
    10 "180-200 " ///
	9 "160-180 " ///
	8 "140-160 " ///
	7 "120-140 " ///
	6 "100-120 " ///
    5 "80-100 " ///
	4 "60-80 " ///
	3 "40-60 " ///
	2 "20-40 " ///
	1 "0-20 " ///


label values x xlabel



// sum estimate min95 max95	
graph twoway (connected estimate x if x<=3, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
(connected estimate x if x>=5, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	(scatter estimate x, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lpattern(solid)) ///
	(rcap min95 max95 x if x>=3 & x<=5, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(connected estimate x if x>=3 & x<=5, msymbol(circle) lcolor("237 47 76") mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(scatter estimate x if x>=3 & x<=5, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle(" Distance between households and violent conflicts (km)",size(3.8)) ytitle("Effect on malaria risk (%)",size(4)) ///
	xscale(range(0.8 12.2)) ///
	xlabel( 1 " " 1/12,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-15 (5) 20, format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3)) name(reduced_2, replace)

	
graph save "$fig\fig_econom_1-2_reduced_2", replace



*************************************************************************************************************************************

clear  
use "$fig_data/fig_econom_1_reduced_form/reduced_3.dta"
local controls $natural_control $household_control1 $person_charact _cons hv209 hv217
foreach con in `controls' {
drop if parm=="`con'"   
}

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100
gen x=.
forvalues j=3(3)24{
local n=`j'/3
replace x=`n' if parm=="ln_deaths_`j'0_1_ds3"
}



sort x
drop if x==.
// gen x = 16-_n
//
// replace estimate=estimate*1000
// replace min95=min95*1000
// replace max95=max95*1000

// sort parm

label define xlabel   ///
	8 "210-240 " ///
	7 "180-210 " ///
	6 "150-180 " ///
    5 "120-150 " ///
	4 "90-120 " ///
	3 "60-90 " ///
	2 "30-60 " ///
	1 "0-30 " ///


label values x xlabel



// sum estimate min95 max95	
graph twoway (connected estimate x if x<=2, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
(connected estimate x if x>=4, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	(scatter estimate x, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lpattern(solid)) ///
	(rcap min95 max95 x if x>=2 & x<=4, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(connected estimate x if x>=2 & x<=4, msymbol(circle) lcolor("237 47 76") mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(scatter estimate x if x>=2 & x<=4, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle("Distance between households and violent conflicts (km)",size(3.8)) ytitle("Effect on malaria risk (%)",size(4)) ///
	xscale(range(0.8 8.2)) ///
	yscale(range(-10 21)) ///
	xlabel( 1 " " 1/8,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-10 (5) 20., format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3)) name(reduced_3, replace)

	
graph save "$fig\fig_econom_1-2_reduced_3", replace

**********************************************************************************************************************************

clear  
use "$fig_data/fig_econom_1_reduced_form/reduced_5.dta"
local controls $natural_control $household_control1 $person_charact _cons hv209 hv217
foreach con in `controls' {
drop if parm=="`con'"   
}

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100
gen x=.
forvalues j=5(5)25{
local n=`j'/5
replace x=`n' if parm=="ln_deaths_`j'0_1_ds5"
}



sort x
drop if x==.
// gen x = 16-_n
//
// replace estimate=estimate*1000
// replace min95=min95*1000
// replace max95=max95*1000

// sort parm

label define xlabel   ///
    5 "200-250 " ///
	4 "150-200 " ///
	3 "100-150 " ///
	2 "50-100 " ///
	1 "0-50 " ///


label values x xlabel



// sum estimate min95 max95	
graph twoway (connected estimate x if x<=1, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
(connected estimate x if x>=1, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	(scatter estimate x, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lpattern(solid)) ///
	(rcap min95 max95 x if x>=2 & x<=2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(connected estimate x if x>=2 & x<=2, msymbol(circle) lcolor("237 47 76") mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2) lp(shortdash) lwidth(0.4)) ///
	(scatter estimate x if x>=2 & x<=2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle("Distance between households and violent conflicts (km)",size(3.8)) ytitle("Effect on malaria risk (%)",size(4)) ///
	xscale(range(0.8 5.2)) ///
	xlabel( 1 " " 1/5,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-10 (5) 25, format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3))  name(reduced_5, replace)


	
graph save "$fig\fig_econom_1-2_reduced_5", replace





//
//
// graph combine "$fig\fig_econom_1-2_reduced_5" "$fig\fig_econom_1-2_reduced_3" "$fig\fig_econom_1-2_reduced_2" "$fig\fig_econom_1-2_reduced_1" , col(2) row(2) imargin(3 3 3 3 3 3) xsize(13) ysize(10) graphregion(margin(0.1) fcolor(white) lcolor(white)) iscale(0.5)


graph combine "$fig\fig_econom_1-2_reduced_5" "$fig\fig_econom_1-2_reduced_1" , col(1) row(2) imargin(3 3 3 3 3 3) xsize(7) ysize(10) graphregion(margin(0.1) fcolor(white) lcolor(white)) iscale(0.8)  name(reduced_1_and_5, replace)


graph combine "$fig\fig_econom_1-2_reduced_2" "$fig\fig_econom_1-2_reduced_3" , col(1) row(2) imargin(3 3 3 3 3 3) xsize(7) ysize(10) graphregion(margin(0.1) fcolor(white) lcolor(white)) iscale(0.8) name(reduced_2_and_3, replace)
