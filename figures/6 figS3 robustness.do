clear
global datae reduced_1_x reduced_1_xc reduced_1_xc1 reduced_1_xc2


local ff=1
foreach d in $datae{
  clear  
use "$fig_data/fig_econom_1_reduced_form/`d'.dta"
local controls $natural_control $household_control1 $person_charact1 _cons ndvi total_precipitation_mean mean_tem $land $tmp1 $pre1 $dtr1 hv207 hv226  near_distance_admin1 near_distance_admin0
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
graph twoway (connected estimate x if x<=6, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(dash) lwidth(0.4)) ///
(connected estimate x if x>=10, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lp(dash) lwidth(0.4)) ///
	(rcap min95 max95 x , msymbol(circle) lcolor("24 77 157") lwidth(0.6)) ///
	(scatter estimate x, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2) lpattern(solid)) ///
	(rcap min95 max95 x if x>=6 & x<=10, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(connected estimate x if x>=6 & x<=10, msymbol(circle) lcolor("237 47 76") mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2) lp(dash) lwidth(0.4)) ///
	(scatter estimate x if x>=6 & x<=10, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
	,scheme(plotplain) ///
	subtitle(,size(3)) ///
	xtitle("Distance between households and violent conflicts (km)",size(3.8)) ytitle("Effect on malaria risk (%)",size(4)) ///
	xscale(range(0.8 25.2)) ///
	xlabel( 1 " " 1/25,  nogrid valuelabel labsize(*1.3) angle(70)) ///
	ylabel(-10 (5) 15, format(%9.0f) labsize(*1.3) angle(0)) ///
	xsize(15) ysize(9) ///
	title("") ///
	legend(off) ///
	yline(0, lp(shortdash) lcolor(gs5) lwidth(0.3))

	
graph save "$fig\fig_econom_1-1_reduced_`ff'", replace
local ff=`ff'+1
}


graph combine "$fig\fig_econom_1-1_reduced_1" "$fig\fig_econom_1-1_reduced_2" "$fig\fig_econom_1-1_reduced_3" "$fig\fig_econom_1-1_reduced_4" , col(2) row(2) imargin(3 3 3 3 3 3) xsize(14) ysize(9) graphregion(margin(0.1) fcolor(white) lcolor(white)) iscale(0.5) name(reduced_1_all_robustness, replace)


//
// graph combine "$fig\fig_econom_1-1_reduced_2" "$fig\fig_econom_1-1_reduced_3"  , col(2) row(2) imargin(3 3 3 3 3 3) xsize(14) ysize(10) graphregion(margin(0.1) fcolor(white) lcolor(white)) iscale(0.5)