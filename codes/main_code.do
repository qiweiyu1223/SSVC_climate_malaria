clear all
set mem 700m
set mat 2000
set maxvar 10000
set level 95, perm
set more off

global dir "G:/war consequence"
global dofile "$dir/3 experiment/1 stata_code/"
global use_data "$dir/2 merge_data"
global result "$dir/3 experiment/3 result or table"
global fig "$dir/3 experiment/4 figure"
global fig_data "$dir/3 experiment/5 figure data"



**********************************initialization**************************************************************

run "$dofile/主代码/global_variable.do"
**************************************************************************************************************
**# Main Regression  #1


use "$use_data/individual.dta",clear


*(1) Fig.1+Supplementary Fig.2 
*10KM
local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control  $household_control1  $person_charact1  , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_1_x.dta", replace) level(95)
outreg2 using "$result/3 experiment/1-1 width_10.xls", replace se nocons lab dec(3) keep(`var_in')

*20KM
local var_in  ln_deaths_20_1_ds2 ln_deaths_40_1_ds2  ln_deaths_60_1_ds2 ln_deaths_80_1_ds2  ln_deaths_100_1_ds2  ln_deaths_120_1_ds2  ln_deaths_140_1_ds2  ln_deaths_160_1_ds2 ln_deaths_180_1_ds2 ln_deaths_200_1_ds2 ln_deaths_220_1_ds2 ln_deaths_240_1_ds2
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_2.dta", replace) level(95)
outreg2 using "$result/3 experiment/1-2 width_20.xls", replace se nocons lab dec(3) keep(`var_in')

*30KM
local var_in ln_deaths_30_1_ds3 ln_deaths_60_1_ds3 ln_deaths_90_1_ds3 ln_deaths_120_1_ds3 ln_deaths_150_1_ds3 ln_deaths_180_1_ds3 ln_deaths_210_1_ds3 ln_deaths_240_1_ds3
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1 ,absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_3.dta", replace) level(95)
outreg2 using "$result/3 experiment/1-3 width_30.xls", replace se nocons lab dec(3) keep(`var_in')

*50KM
local var_in  ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5
reghdfe hml35 `var_in' $natural_control  $household_control1   $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_5.dta", replace) level(95)
outreg2 using "$result/3 experiment/1-4 width_50.xls", replace se nocons lab dec(3) keep(`var_in')

run "$dofile/1 fig1+figS2.do"

*(2) Robustness Check

use "$use_data/individual.dta",clear
local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_1_x.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1 $person_charact1 near_distance_admin0 near_distance_admin1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_1_xc.dta", replace) level(95)


local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' ndvi_mean $household_control1 $person_charact1 $tmp1 $dtr1 $pre1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_1_xc1.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in'  $household_control1 $person_charact1  ndvi_mean $tmp1 $dtr1 $pre1 near_distance_admin1 near_distance_admin0, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_1_reduced_form/reduced_1_xc2.dta", replace) level(95)

run "$dofile/6 figS3 robustness.do"


*(3) Different FE comparison
use "$use_data/individual.dta",clear


local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/adm1FE.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' ndvi_mean $tmp1 $dtr1 $pre1 $household_control1  $person_charact1, absorb(country#hv025#hv007 country#hv025#hv006) cluster(country#hv025)
parmest, saving("$fig_data/countryFE.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(country#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/countryadm1.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(adm1_name#hv025#hv007 country#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/adm1country.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(adm1_name#hv025 hv007#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/adm1year.dta", replace) level(95)

local var_in ln_deaths_10_1_d ln_deaths_20_1_d ln_deaths_30_1_d ln_deaths_40_1_d ln_deaths_50_1_d ln_deaths_60_1_d ln_deaths_70_1_d ln_deaths_80_1_d ln_deaths_90_1_d ln_deaths_100_1_d ln_deaths_110_1_d ln_deaths_120_1_d ln_deaths_130_1_d ln_deaths_140_1_d ln_deaths_150_1_d ln_deaths_160_1_d ln_deaths_170_1_d ln_deaths_180_1_d ln_deaths_190_1_d ln_deaths_200_1_d  ln_deaths_210_1_d ln_deaths_220_1_d ln_deaths_230_1_d ln_deaths_240_1_d ln_deaths_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(country#hv025 hv007#hv006) cluster(country#hv025)
parmest, saving("$fig_data/countryyear.dta", replace) level(95)

run "$dofile/7 figS4 not aggressive FE.do"


*(4) IVs checks


use "$use_data/individual.dta",clear

ivreghdfe hml35 (ln_deaths_50_1_ds5= kidnap_50km) ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1, a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", replace se nocons lab dec(3) keep(ln_deaths_50_1_ds5) adds(KP F-Stat, e(rkf))


ivreghdfe hml35 (ln_deaths_100_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5  $natural_control  $household_control1  $person_charact1 , a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_100_1_ds5) adds(KP F-Stat, e(rkf))


ivreghdfe hml35 (ln_deaths_150_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1  , a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_150_1_ds5) adds(KP F-Stat, e(rkf))

ivreghdfe hml35 (ln_deaths_200_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1  , a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_200_1_ds5) adds(KP F-Stat, e(rkf))

ivreghdfe hml35 (ln_deaths_250_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 $natural_control  $household_control1  $person_charact1  , a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_250_1_ds5) adds(KP F-Stat, e(rkf))



ivreghdfe hml35 (ln_deaths_50_1_ds5= kidnap_50km) ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1, a(country_res#hv007 country_res#hv006) cluster(country_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_50_1_ds5) adds(KP F-Stat, e(rkf))


ivreghdfe hml35 (ln_deaths_100_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5  $natural_control  $household_control1  $person_charact1 , a(country_res#hv007 country_res#hv006) cluster(country_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_100_1_ds5) adds(KP F-Stat, e(rkf))


ivreghdfe hml35 (ln_deaths_150_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_200_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1  , a(country_res#hv007 country_res#hv006) cluster(country_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_150_1_ds5) adds(KP F-Stat, e(rkf))

ivreghdfe hml35 (ln_deaths_200_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_250_1_ds5 $natural_control  $household_control1  $person_charact1  , a(country_res#hv007 country_res#hv006) cluster(country_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_200_1_ds5) adds(KP F-Stat, e(rkf))

ivreghdfe hml35 (ln_deaths_250_1_ds5= kidnap_50km) ln_deaths_50_1_ds5 ln_deaths_100_1_ds5 ln_deaths_150_1_ds5 ln_deaths_200_1_ds5 $natural_control  $household_control1  $person_charact1  , a(country_res#hv007 country_res#hv006) cluster(country_res)
outreg2 using "$result/3 experiment/IV_FE_5_2.xls", append se nocons lab dec(3) keep(ln_deaths_250_1_ds5) adds(KP F-Stat, e(rkf))


// IV exogeneity check

// gen log_distance_to_capital=log(distance_to_capital)

local IV_Exgen_kidnap1 ndvi_mean tmp_12_mean pre_12_mean dtr_12_mean 
local IV_Exgen_kidnap2 hv270 hv216 hv206 hv221 hv208 hv209 hv210 hv211 hv212 wall_level roof_level floor_level hv246 hml1 hv204 
local IV_Exgen_kidnap3 rice wheat_flour maize population medical_5km log_distance_to_capital log_admin0 log_admin1
foreach i in `IV_Exgen_kidnap1' `IV_Exgen_kidnap2' `IV_Exgen_kidnap3'{ 
reghdfe kidnap_50km `i', a(admin_res#hv007 admin_res#hv006) cluster(admin_res)
if "`d'"=="ndvi_mean" | "`d'"=="hv270" | "`d'"=="rice" outreg2 using "$result/3 experiment/`i'.xls", replace se nocons lab dec(5) keep(`d')
if "`d'"!="ndvi_mean" & "`d'"=="hv270" & "`d'"=="rice" outreg2 using "$result/3 experiment/`i'.xls", append se nocons lab dec(5) keep(`d' )
}




*(5)transformation issue and standard issue

use "$use_data/individual.dta",clear

forvalues j=1/25{
local f=`j'-1
gen ln_deaths_`j'0_sx=ln(sqrt(deaths_`j'0_1_d*deaths_`j'0_1_d+1)+deaths_`j'0_1_d)

}

local var_in ln_deaths_10_sx ln_deaths_20_sx ln_deaths_30_sx ln_deaths_40_sx ln_deaths_50_sx ln_deaths_60_sx ln_deaths_70_sx ln_deaths_80_sx ln_deaths_90_sx ln_deaths_100_sx ln_deaths_110_sx ln_deaths_120_sx ln_deaths_130_sx ln_deaths_140_sx ln_deaths_150_sx ln_deaths_160_sx ln_deaths_170_sx ln_deaths_180_sx ln_deaths_190_sx ln_deaths_200_sx ln_deaths_210_sx ln_deaths_220_sx ln_deaths_230_sx ln_deaths_240_sx ln_deaths_250_sx
reghdfe hml35 `var_in' $natural_control $household_control1  $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/reduced_logx.dta", replace) level(95)





*per km^2
forvalues j=1/25{
local f=`j'-1
if "`j'"=="1" gen deaths100_`j'0_1_d=deaths_`j'0_1/((`j'*`j'-`f'*`f')*100*3.1415926)
if "`j'"!="1" gen deaths100_`j'0_1_d=(deaths_`j'0_1-deaths_`f'0_1)/((`j'*`j'-`f'*`f')*100*3.1415926) 

replace deaths100_`j'0_1_d=0 if !missing(lat) & deaths100_`j'0_1_d==.
gen ln_deaths100_`j'0_1_d=ln(deaths100_`j'0_1_d+1)
gen ln_deaths100_`j'0_sx=ln(sqrt(deaths100_`j'0_1_d*deaths100_`j'0_1_d+1)+deaths100_`j'0_1_d)
}

local var_in ln_deaths100_10_1_d ln_deaths100_20_1_d ln_deaths100_30_1_d ln_deaths100_40_1_d ln_deaths100_50_1_d ln_deaths100_60_1_d ln_deaths100_70_1_d ln_deaths100_80_1_d ln_deaths100_90_1_d ln_deaths100_100_1_d ln_deaths100_110_1_d ln_deaths100_120_1_d ln_deaths100_130_1_d ln_deaths100_140_1_d ln_deaths100_150_1_d ln_deaths100_160_1_d ln_deaths100_170_1_d ln_deaths100_180_1_d ln_deaths100_190_1_d ln_deaths100_200_1_d  ln_deaths100_210_1_d ln_deaths100_220_1_d ln_deaths100_230_1_d ln_deaths100_240_1_d ln_deaths100_250_1_d
reghdfe hml35 `var_in' $natural_control $household_control1   $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/reduced_per_km.dta", replace) level(95)

*per km^2 + arc


local var_in ln_deaths100_10_sx ln_deaths100_20_sx ln_deaths100_30_sx ln_deaths100_40_sx ln_deaths100_50_sx ln_deaths100_60_sx ln_deaths100_70_sx ln_deaths100_80_sx ln_deaths100_90_sx ln_deaths100_100_sx ln_deaths100_110_sx ln_deaths100_120_sx ln_deaths100_130_sx ln_deaths100_140_sx ln_deaths100_150_sx ln_deaths100_160_sx ln_deaths100_170_sx ln_deaths100_180_sx ln_deaths100_190_sx ln_deaths100_200_sx  ln_deaths100_210_sx ln_deaths100_220_sx ln_deaths100_230_sx ln_deaths100_240_sx ln_deaths100_250_sx
reghdfe hml35 `var_in' $natural_control $household_control1   $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)


parmest, saving("$fig_data/reduced_per_km_arc.dta", replace) level(95)


run "$dofile/8 figS5 arc transformation.do"






**# SSVC interacted with climate #2

use "$use_data/individual.dta",clear
*(1)TMP 

global hhhhhh mean_3mon_tmp mean_6mon_tmp tmp_9_mean mean_12mon_tmp 

foreach hh in $hhhhhh{
reghdfe hml35 c.`hh'##c.`hh'##i.deaths_50_100_1_level $pre1 $dtr1 ndvi $household_control1 $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)

sum `hh'
global Min: dis %4.0f r(min)
global Max: dis %4.0f r(max)
global Grid = ($Max-$Min)/10
global Grid1 = ($Max-$Min)/4

margins, dydx(deaths_50_100_1_level) at(`hh'=($Max($Grid)$Min)) post

marginsplot,name(`hh', replace) yline(0, lcol(gs5) lpattern(shortdash)) xlabel($Max($Grid1)$Min, format(%7.0f) labsize(3.5) angle(0)) title("") plot1opts(lcolor("242 121 112")  msymbol(circle) color("242 121 112") msize(2.2)) ci1opt(color("242 121 112") lwidth(0.5)) ytitle("Effect of SSVC on malaria",size(3.3))  legend(off) ylabel(,format(%-7.2f) labsize(3.5) angle(0))


// graph save "$fig/climate/`hh'.gph", replace
parmest, saving("$fig_data/fig_econom_8_Cru/`hh'.dta", replace) level(95)
parmest, saving("$fig_data/fig_econom_8_Cru/origin/`hh'.dta", replace) level(95)

}





*(2) PRE
global hhhhhh log_pre_3_mean log_pre_6_mean log_pre_9_mean log_pre_12_mean

foreach hh in $hhhhhh{
reghdfe hml35 c.`hh'##i.deaths_50_100_1_level $dtr1 $tmp1 $conflict_1 ndvi $household_control1 $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)

sum `hh'
global Min: dis %4.0f r(min)
global Max: dis %4.0f r(max)
global Grid = ($Max-$Min)/10
global Grid1 = ($Max-$Min)/4


margins, dydx(deaths_50_100_1_level) at(`hh'=($Max($Grid)$Min)) post

marginsplot,name(`hh', replace) yline(0, lcol(gs5) lpattern(shortdash)) xlabel($Max($Grid1)$Min, format(%7.0f) labsize(3.5) angle(0)) title("") plot1opts(lcolor("50 184 151")  msymbol(circle) color("50 184 151") msize(2.2)) ci1opt(color("50 184 151") lwidth(0.5)) legend(off) ylabel(,format(%-7.2f) labsize(3.5) angle(0))  ytitle("Effect of SSVC on malaria",size(3.3))



graph save "$fig/climate/`hh'.gph", replace
parmest, saving("$fig_data/fig_econom_8_Cru/`hh'.dta", replace) level(95)
parmest, saving("$fig_data/fig_econom_8_Cru/origin/`hh'.dta", replace) level(95)
}




*(3) WET


global hhhhhh mean_3mon_wet mean_6mon_wet wet_9_mean mean_12mon_wet
*margins effects

foreach hh in $hhhhhh{
reghdfe hml35 c.`hh'##i.deaths_50_100_1_level $dtr1 $tmp1 $conflict_1 ndvi $household_control1 $person_charact1 , absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)

sum `hh'
global Min: dis %4.0f r(min)
global Max: dis %4.0f r(max)
global Grid = ($Max-$Min)/10
// global Grid1 = ($Max-$Min)/4


margins, dydx(deaths_50_100_1_level) at(`hh'=( $Max($Grid)$Min )) post
 marginsplot,name(`hh', replace) yline(0, lcol(gs5) lpattern(shortdash)) xlabel($Max($Grid1)$Min, format(%7.0f) labsize(3.5) angle(0)) title("") plot1opts(lcolor("50 184 151")  msymbol(circle) color("50 184 151") msize(2.2)) ci1opt(color("50 184 151") lwidth(0.5)) ytitle("")  legend(off) ylabel(,format(%-7.2f) labsize(3.5) angle(0))



graph save "$fig/climate/`hh'.gph", replace
parmest, saving("$fig_data/fig_econom_8_Cru/`hh'.dta", replace) level(95)
parmest, saving("$fig_data/fig_econom_8_Cru/origin/`hh'.dta", replace) level(95)
}

run "$dofile/2 fig2+figS6.do"
run "$dofile/3 fig3 cru_mapping.do"

**# Mechanism 1 Household structure #4

*the impact of SSVC on household  

use "$use_data/household.dta",clear

local rate man_rate woman_rate child_0_15_rate elder_50_rate
local n=1
foreach var in `rate'{
reghdfe `var' $conflict $household_control1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_5_mechanism/`var'.dta", replace) level(95) idstr(`var') idnum(`n')

local n=`n'+1
}






*household demographic on malaria rate
use "$use_data/individual.dta",clear
local household_var man_rate woman_rate child_0_15_rate elder_50_rate
local n=1
foreach var in `household_var'{
reghdfe hml35 `var'  $natural_control  $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_6_household_structure/`var'.dta", replace) level(95) idstr(`var') idnum(`n')
local n=`n'+1
}



*man_rate consequence
use "$use_data/individual.dta",clear
local man_result hv227 binary_wealth hv209 hv206 log_time_for_water
local g=1
foreach ss in `man_result'{

reghdfe `ss' man_rate $household_control1 $person_charact1,  absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_9_supple_man/`ss'.dta", replace) level(95) idstr(`ss') idnum(`g')
local g=`g'+1
}

run "$dofile/4 fig4.do"



**# Mechanism 2  #5

use "$use_data/individual.dta",clear


reghdfe hml35 c.ln_deaths_100_1_ds5#wealth_level wealth_level $conflict_1 $natural_control $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_4_social/wealth_level.dta", replace) level(95) idstr(wealth_level) idnum(1)

reghdfe hml35 c.ln_deaths_100_1_ds5#hv206 hv206 $conflict_1 $natural_control $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_4_social/hv206.dta", replace) level(95) idstr(hv206) idnum(2)

reghdfe hml35 c.ln_deaths_100_1_ds5#drink_water drink_water $conflict_1 $natural_control $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_4_social/drink_water.dta", replace) level(95) idstr(drink_water) idnum(3)


reghdfe hml35 c.ln_deaths_100_1_ds5#i.toilet toilet $conflict_1 $natural_control $household_control1 $person_charact1, absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_4_social/toilet.dta", replace) level(95) idstr(toilet) idnum(4)

run "$dofile/5 fig5.do"






**# Supplementary Fig 7 #6


*SSVC and net use 

use "$use_data/household.dta",clear
reghdfe net_use ln_deaths_100_1_ds5 $conflict_1 hv219 hv270 hv210 hv211 hv212 hv213 hv216,  absorb(adm1_name#hv025#hv007 adm1_name#hv025#hv006) cluster(adm1_name#hv025)
parmest, saving("$fig_data/fig_econom_9_supple_mechanism/net_use.dta", replace) level(95) idstr(net_use) idnum(1)


run "$dofile/figS10.do"






**# Descriptive Statisitic #7
clear
use "$use_data/individual.dta"

asdoc sum hml35 $conflict $natural_control $household_control1 $person_charact1, label replace fhc(\b) fhr(\b) save($result/descriptive_statistics.doc) format(%9.3f) abb(.)













