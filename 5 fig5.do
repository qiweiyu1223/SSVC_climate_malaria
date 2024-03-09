
cd "$fig_data/fig_econom_4_social"
openall
local controls $conflict_1 $natural_control $household_control1 $person_charact1 _cons  wealth_level hv206 drink_water toilet
 
foreach con in `controls' {
drop if parm=="`con'"   
}


replace estimate=estimate*100
replace min95=min95*100
replace max95=max95*100

sort idnum parm

gen y=18-_n
label define ylabel   ///
	17	"{bf:Wealth level of household:} poorest" ///
	16	"poorer" ///
	15	"middle" ///
	14	"richer" ///
	13	"richest" ///
	12	"{bf:Electricity:} no" ///
	11	"yes" ///
	10	"{bf:Source of drinking water:} unimproved" ///
	9	"improved" ///
	8	"{bf: Sanitation facility:} unimproved" ///
	7	"improved" ///
	6	"{bf:Child or adult:} adult (15-49 years)" ///
	5	"child (0-5 years)" ///
	4 	"{bf: Sex of member:} male" ///
	3	"female" ///
	2	"{bf: Smoking behavior:} no" ///
	1	"yes"

label values y ylabel	

global varaible smoke hv104 child_or_adult toilet drink_water hv206 type_of_residence
	
foreach var in $varaible{
replace y=y+0.25 if parm=="1.`var'#c.ln_deaths_100_1_ds5" | parm=="3.`var'#c.ln_deaths_100_1_ds5"  
replace y=y-0.25 if parm=="0b.`var'#c.ln_deaths_100_1_ds5" 
}

*调整纵轴的间距
replace y=y+0.25 if y==13 
replace y=y-0.25 if y>=14  
replace y=y-0.5 if y>=14  
replace y=y-0.25 if y>=15
replace y=y-0.25 if y>=15
replace y=y-0.5 if y==15.75
replace y=y-0.25 if y>=17

replace y=y-0.25 if y>1.75
replace y=y-0.25 if y>3.5
replace y=y-0.25 if y>5.25
replace y=y-0.25 if y>7
replace y=y-0.25 if y>8.75
replace y=y-0.25 if y>10.5
replace y=y-0.25 if y>13.75



sum estimate min95 max95

graph twoway (rcap min95 max95 y if y>=6 , msymbol(circle) lcolor("24 77 157") horizontal lwidth(0.55)) ///
	(scatter y estimate if y>=6 , msymbol(circle) color("24 77 157") mlwidth(medium) msize(1.5)) ///
	(rcap min95 max95 y if y==13.75 | y==13.25| y==12.75  | y==10.5| y==8.75 | y==7 , msymbol(circle) lcolor("237 47 76") horizontal lwidth(0.55)) ///
	(scatter y estimate if y==13.75 | y==13.25| y==12.75  | y==10.5| y==8.75 | y==7 , msymbol(circle) color("237 47 76") mlwidth(medium) msize(1.5)) ///
	, subtitle(,size(5)) ///
	title("") ///
	xtitle("Estimated coefficients (%)",size(2.1)) ytitle("") ///
	xline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel(13.75	"{bf:Wealth level of household:} poorest" ///
	13.25	"poorer" ///
	12.75	"middle" ///
	12.25	"richer" ///
	11.75	"richest" ///
	10.5	"{bf:Electricity:} no" ///
	10	"yes" ///
	8.75	"{bf:Source of drinking water:} unimproved" ///
	8.25	"improved" ///
	7	"{bf: Sanitation facility:} unimproved" ///
	6.5	"improved" ///
 ,  nogrid valuelabel labsize(2) angle(360)) ///
	scheme(s1mono) ///
	xsize(10) ysize(10) ///
	yscale(range(6.25 14)) ///
	xscale(range(-3 6.1)) ///
	xlabel(-10 (10) 30 , nogrid labsize(2)) ///
	legend(on order(4 "Vulnerable households" 2 "Others" ) size(1.8)) fxsize(100) name(h1, replace)

graph save "$fig\fig_econom_5_1_social", replace




*输入这个样本比例（做后面直方图）的
input total west central 
27.26	24.5	25.31
23.87	22.43	22.61
20.38	20.62	20.57
16.83	18.53	18.2
11.65	13.92	13.31
76.92	82.99	82.48
23.08	17.01	17.52
36.5	41.28	39.06
63.5	58.72	60.94
62.73	72.56	73.46
37.27	27.44	26.54 ///
end


graph twoway (bar total y if y>=6 , msymbol(circle) color("24 77 157") horizontal lwidth(0.15) barwidth(0.5)) ///
	(bar total y if  y==13.75 | y==13.25| y==12.75  | y==10.5| y==8.75 | y==7 , msymbol(circle) color("237 47 76") horizontal lwidth(0.55)  barwidth(0.5)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("percent (%)",size(2.1)) ytitle("") ///
	xline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel("") ///
	scheme(s1mono) ///
	xsize(10) ysize(10) ///
	yscale(range(6.25 13.75)) ///
	xscale(range(0 100)) ///
	xlabel(0 (25) 100 , nogrid labsize(2)) ///
	legend(on order(2 "Vulnerable households" 1 "Others" ) size(1.8)) name(h2, replace)


graph save "$fig\fig_econom_5_2_social", replace



graph twoway (bar west y if y>=6 , msymbol(circle) color("24 77 157") horizontal  lwidth(0.15) barwidth(0.5)) ///
	(bar west y if  y==13.75 | y==13.25| y==12.75  | y==10.5| y==8.75 | y==7 , msymbol(circle) color("237 47 76") horizontal lwidth(0.55)  barwidth(0.5)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("percent (%)",size(2.1)) ytitle("") ///
	xline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel("") ///
	scheme(s1mono) ///
	xsize(10) ysize(10) ///
	yscale(range(6.25 13.75)) ///
	xscale(range(0 100)) ///
	xlabel(0 (25) 100 , nogrid labsize(2) ) ///
	legend(on order(2 "Vulnerable households" 1 "Others" ) size(1.8)) name(h3, replace)

graph save "$fig\fig_econom_5_3_social", replace


graph twoway (bar central y if y>=6 , msymbol(circle) color("24 77 157") horizontal lwidth(0.15) barwidth(0.5)) ///
	(bar central y if y==15.5 | y==13.75 | y==13.25| y==12.75  | y==10.5| y==8.75 | y==7 , msymbol(circle) color("237 47 76") horizontal lwidth(0.55)  barwidth(0.5)) ///
	, subtitle(,size(5)) ///
	title("",size(3)) ///
	xtitle("percent (%)",size(2.1)) ytitle("") ///
	xline(0, lcol(gs6) lpattern(shortdash)) ///
	ylabel("") ///
	scheme(s1mono) ///
	xsize(10) ysize(10) ///
	yscale(range(6.25 13.75)) ///
	xscale(range(0 100)) ///
	xlabel(0 (25) 100 , nogrid labsize(2)) ///
	legend(on order(2 "Vulnerable households" 1 "Others" ) size(4.3)) name(h4, replace)

graph save "$fig\fig_econom_5_4_social", replace





grc1leg2 h2 h3 h4, cols(4) rows(1) imargin(0 0.2 0 0) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(0.98)  legscale(*.45) ///
legendfrom(h4) name(h2_4,replace)  


graph combine h1 h2_4, cols(2) rows(1) imargin(1.2 0.2 0 0) graphregion(margin(0) fcolor(white) lcolor(white)) iscale(1.4) xsize(15) ysize(7) name(refugee_and_disadvantaged, replace)