

cd "$fig_data/fig_econom_9_supple_mechanism"
openall 
local controls $tmn $pre $tmp $dtr ndvi $household_control1 $person_charact1 _cons child_or_adult man_rate  $tmp1 $dtr1 $pre1 $tmn1 hv207 hv226 ndvi_mean hv271

foreach con in `controls' {
drop if parm=="`con'"   
}
drop if t==.
drop if parm=="1.child_or_adult"
drop t dof stderr

keep if idnum<=3


local nnn ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5
local s11=1
gen num=.
foreach nn in `nnn'{
	replace num=`s11' if parm=="`nn'"
	local s11=`s11'+1
	drop if parm=="`nn'" & idstr=="net_use_child"
	drop if parm=="`nn'" & idstr=="net_use_child_dif"
}



sort idnum num
keep if idnum==1

gen y=_n


label define ylabel   ///
	1	"0-50 " ///
	2	"50-100 " ///
	3   "100-150 " ///
	4   "150-200 " ///
	5   "200-250 " 

label values y ylabel


graph twoway (connected estimate y, msymbol(circle) lcolor("24 77 157") mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5) lp(shortdash) lwidth(0.4)) ///
	(rcap min95 max95 y, msymbol(circle) lcolor("24 77 157") lwidth(0.75)) ///
	(scatter estimate y, msymbol(circle) mcolor("24 77 157") mlcolor("24 77 157") mlwidth(medium) msize(2.5)) ///
	(rcap min95 max95 y if y==2, msymbol(circle) lcolor("237 47 76") lwidth(0.75)) ///
	(scatter estimate y if y==2, msymbol(circle) mcolor("237 47 76") mlcolor("237 47 76") mlwidth(medium) msize(2.5)) ///
		, subtitle(,size(5)) ///
	title("",size(3)) ///
		xtitle("") ///
	b1title("Distance between households and violent conflicts (km)",size(3.5)) ytitle("Effect on prob. of using the mosquito net (%)",size(3.5)) ///
	yline(0, lcol(gs10) lpattern(shortdash)) ///
	ylabel(,format(%9.1f)  valuelabel labsize(3.2) angle(360)) ///
	scheme(s1mono) ///
	xsize(15) ysize(8.5) ///
	xscale(range(0.8 5.2)) ///
	xlabel(1 (1) 5, nogrid valuelabel labsize(3.2) angle(360)) name(net_use, replace) ///
	legend(off) 
graph save "$fig\net_use", replace	




