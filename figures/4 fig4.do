cd "$fig_data/fig_econom_5_mechanism"
openall
local controls $natural_control  $household_control1 $person_charact1 $interacted_factor_category_var _cons hv271 hv217 hv209 hv207 hv226 wet_12_mean
foreach con in `controls' {
drop if parm=="`con'"   
}

gen x=.
forvalues j=5(5)25{
replace x=`j' if parm=="ln_deaths_`j'0_1_ds5"
}

sort idnum x
drop if idstr=="hv219" | idstr=="visit_rate"|idstr=="adult_rate"|idstr=="elder_rate"


global cli dtr pre tmp 
foreach cl in $cli{
forvalues i = 1(1)12 {

drop if parm== "`cl'_b`i'"
}
}
// replace estimate=estimate*1000
// replace min95=min95*1000
// replace max95=max95*1000

save "$fig_data/fig_econom_5_mechanism.dta",replace

// global ti1=
// `"Effect on proportion of adult women"' `"(15-49 years)"' 
// `"Effect on proportion of adult men"' `"(15-49 years)"'
// `"Effect on proportion of children (0-15 years) and elders"' `"(>49 years)"'
********************************************************************************
*1 SSVC and male rate

use "$fig_data/fig_econom_5_mechanism.dta",clear
keep if idstr=="man_rate"
gen y=_n
label define ylabel   ///
	1	"0-50 " ///
	2	"50-100 " ///
	3   "100-150 " ///
	4   "150-200 " ///
	5   "200-250 " 

label values y ylabel


replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

graph twoway (connected estimate y, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 y, msymbol(circle) lcolor("24 77 157") lwidth(0.75)) ///
	(scatter estimate y, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5)) ///
	(rcap min95 max95 y if y==2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(scatter estimate y if y==2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
		xtitle("") ///
	b1title("Distance between households and violent conflicts (km)",size(3)) ytitle(`"Effect on proportion of adult men (%)"' `"(15-49 years)"',size(3)) ///
	yline(0, lcol(gs10) lpattern(shortdash)) ///
	ylabel(,format(%9.0f)  valuelabel labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 5.2)) ///
	xlabel(1 (1) 5, nogrid valuelabel labsize(2.8) angle(360)) ///
	legend(off) name(man, replace)
	
graph save "$fig\fig_econom_5_male", replace
********************************************************************************
*2 SSVC and female rate

use "$fig_data/fig_econom_5_mechanism.dta",clear
keep if idstr=="woman_rate"
gen y=_n
label define ylabel   ///
	1	"0-50 " ///
	2	"50-100 " ///
	3   "100-150 " ///
	4   "150-200 " ///
	5   "200-250 " 


// gen y=7-_n
// label define ylabel   ///
// 	6	"{bf:Sex of household head:} " ///
// 	5	"num. of women (15-49 years) " ///
// 	4	"num. of men (15-49 years)" ///
// 	3	"num. of child (0-5 years) " ///
// 	2	"{bf:wealth:} " ///
// 	1   "{bf:Num. of mosquito nets per members:} "

label values y ylabel

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100


graph twoway (connected estimate y, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 y, msymbol(circle) lcolor("24 77 157") lwidth(0.75)) ///
	(scatter estimate y, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5)) ///
	(rcap min95 max95 y if y==2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(scatter estimate y if y==2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("") ///
	b1title("Distance between households and violent conflicts (km)",size(3)) ytitle(`"Effect on proportion of adult women (%)"' `"(15-49 years)"',size(3)) ///
	yline(0, lcol(gs10) lpattern(shortdash)) ///
	ylabel(, format(%9.0f) nogrid valuelabel  labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 5.2)) ///
	xlabel(1 (1) 5, nogrid valuelabel labsize(2.8) angle(360)) ///
	legend(off) name(woman, replace)
	
graph save "$fig\fig_econom_5_female", replace
********************************************************************************
*3 SSVC and child rate

use "$fig_data/fig_econom_5_mechanism.dta",clear
keep if idstr=="child_0_15_rate"
gen y=_n
label define ylabel   ///
	1	"0-50 " ///
	2	"50-100 " ///
	3   "100-150 " ///
	4   "150-200 " ///
	5   "200-250 " 



label values y ylabel

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

graph twoway (connected estimate y, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 y, msymbol(circle) lcolor("24 77 157") lwidth(0.75)) ///
	(scatter estimate y, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5)) ///
	(rcap min95 max95 y if y==2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(scatter estimate y if y==2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("") ///
	b1title("Distance between households and violent conflicts (km)",size(3)) ytitle(`"Effect on proportion of children (%)"' `" (0-14 years)"',size(3)) ///
	yline(0, lcol(gs10) lpattern(shortdash)) ///
	ylabel(,format(%9.0f)  nogrid valuelabel labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 5.2)) ///
	xlabel(1 (1) 5, nogrid valuelabel labsize(2.8) angle(360)) ///
	legend(off) name(child, replace)
	
graph save "$fig\fig_econom_5_child_rate", replace
********************************************************************************
*4 SSVC and elder rate

use "$fig_data/fig_econom_5_mechanism.dta",clear
keep if idstr=="elder_50_rate"
gen y=_n
label define ylabel   ///
	1	"0-50 " ///
	2	"50-100 " ///
	3   "100-150 " ///
	4   "150-200 " ///
	5   "200-250 " 

label values y ylabel

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

graph twoway (connected estimate y, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 y, msymbol(circle) lcolor("24 77 157") lwidth(0.75)) ///
	(scatter estimate y, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5)) ///
	(rcap min95 max95 y if y==2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(scatter estimate y if y==2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("") ///
	b1title("Distance between households and violent conflicts (km)",size(3)) ytitle(`"Effect on proportion of elders (%)"' `" (50+ years)"',size(3)) ///
	yline(0, lcol(gs10) lpattern(shortdash)) ///
	ylabel( ,format(%9.0f)  nogrid valuelabel labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 5.2)) ///
	xlabel(1 (1) 5, nogrid valuelabel labsize(2.8) angle(360)) ///
	legend(off) name(elder, replace)
	
graph save "$fig\fig_econom_5_elders", replace
********************************************************************************
*5 household rate and malaria
cd "$fig_data/fig_econom_6_household_structure"
openall 
local controls $natural_control  $household_control1 $person_charact1 $interacted_factor_category_var _cons hv217 hv209 hv207 hv226 wet_12_mean
foreach con in `controls' {
drop if parm=="`con'"   
}
drop if idstr=="num"  
replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

sort idnum
gen x=idnum
label define xlabel   ///
	1 `""Adult men" "(15-49)""' ///
	2 `""Adult women" "(15-49)""' ///
	3 `""Children" "(0-14)""' ///
	4 `""Elders " "(50+)""' ///

label values x xlabel



graph twoway (bar estimate x if x==1, msymbol(circle) color("142 207 201")  mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==2, msymbol(circle) color("255 190 122") mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==3, msymbol(circle) color("250 127 111") mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==4, msymbol(circle) color("130 176 210") mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
	(rcap min95 max95 x if x==1, msymbol(circle) lcolor("142 207 201") lwidth(0.95)) ///
	(rcap min95 max95 x if x==2, msymbol(circle) lcolor("255 190 122") lwidth(0.95)) ///
	(rcap min95 max95 x if x==3, msymbol(circle) lcolor("250 127 111") lwidth(0.95)) ///
	(rcap min95 max95 x if x==4, msymbol(circle) lcolor("130 176 210") lwidth(0.95)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("") ytitle(`"Effect of household demographics"' `"on malaria risk (%)"',size(3)) ///
	yline(0, lcol(gs2) lpattern(solid)) ///
	ylabel(-15(5)15,format(%9.0f)  valuelabel labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 4.2)) ///
	xlabel(1 (1) 4, nogrid valuelabel labsize(2.8) angle(360)) ///
	text(3 1  "{bf:-5.0%}", place(c) size(3.5)) ///
	text(3 2  "{bf:-11.3%}", place(c) size(3.5)) ///
	text(-3 3  "{bf:9.2%}", place(c) size(3.5)) ///
	text(-3 4  "{bf:2.0%}", place(c) size(3.5)) ///
	legend(off) name(man_to_malar, replace)
graph save "$fig\fig_econom_6_1_rate", replace

********************************************************************************
*6 man rate and household infrastructure
cd "$fig_data/fig_econom_9_supple_man"
openall 

keep if parm=="man_rate" 
gen x=idnum

label define xlabel   ///
	1 "Mosquito net" ///
	2 "High income" ///
	3 "Refrigerator" ///
    4 "Electricity" ///
	5 "Time to get water" ///


label values x xlabel

replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

graph twoway (bar estimate x if x==1, msymbol(circle) color("142 207 201") horizontal  mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==2, msymbol(circle) color("255 190 122") horizontal mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==3, msymbol(circle) color("250 127 111") horizontal mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==4, msymbol(circle) color("130 176 210") horizontal mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
(bar estimate x if x==5, msymbol(circle) color("125 130 204") horizontal mlwidth(medium) msize(2.5)  lwidth(0.4)) ///
	(rcap min95 max95 x if x==1, msymbol(circle) horizontal lcolor("142 207 201") lwidth(0.95))  ///
	(rcap min95 max95 x if x==2, msymbol(circle) horizontal lcolor("255 190 122") lwidth(0.95)) ///
	(rcap min95 max95 x if x==3, msymbol(circle) horizontal lcolor("250 127 111") lwidth(0.95)) ///
	(rcap min95 max95 x if x==4, msymbol(circle) horizontal lcolor("130 176 210") lwidth(0.95)) ///
	(rcap min95 max95 x if x==5, msymbol(circle) horizontal lcolor("125 130 204") lwidth(0.95)) ///
	, subtitle(,size(5)) ///text(25.13 -1.73 "{bf:a}", place(c) size(2.2))
	title("",size(3)) ///
	xtitle("Effect of proportion of adult males (%)",size(2.8)) ytitle("") ///
	xline(0, lcol(gs2) lpattern(solid)) ///
	ylabel(1 (1) 5,format(%9.0f)  valuelabel labsize(3) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(-30 10)) ///
	xlabel(-30 (10) 10, nogrid valuelabel labsize(2.8) angle(360)) ///
	text(5 5  "{bf:-20.5%}", place(c) size(3.5))  ///
	text(4 -4 "{bf:9.9%}", place(c) size(3.5)) ///
	text(3 -4 "{bf:3.0%}", place(c) size(3.5)) ///
	text(2 -4 "{bf:6.7%}", place(c) size(3.5)) ///
	text(1 -4  "{bf:3.5%}", place(c) size(3.5)) ///
	legend(off) name(man_to_other, replace)

graph save "$fig\fig_econom_6_2_male", replace

********************************************************************************
graph combine  "$fig\fig_econom_5_male" "$fig\fig_econom_5_female" "$fig\fig_econom_5_child_rate" "$fig\fig_econom_5_elders" "$fig\fig_econom_6_1_rate" "$fig\fig_econom_6_2_male", col(3) row(2) imargin(2 2 2 2) xsize(19) ysize(9) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(0.7) name(male_related_all, replace)




