clear
set more off
use ReplicationData2.dta





eststo out1: reg falsexam format_ol format_blended if enroll_count==3
eststo out2: reg falsexam format_ol format_blended gpa cum_total_crds sat_math_NEW sat_verbal_NEW if enroll_count==3
eststo out3: reg falsexam format_ol format_blended gpa cum_total_crds sat_math_NEW sat_verbal_NEW gender asian black hispanic hawaiian unknown if enroll_count==3
esttab out1 out2 out3 using t_B1_OLS_Final_Exam.rtf, replace  b(a3) t abs star(+ 0.10 * 0.05 ** 0.01 *** 0.001) r2(3) ar2(3) scalars (N "chi2 Wald Chi2" "p  Prob > chi2" F  "ll Log lik.") sfmt(3) nogaps label title ("Table B.1 OLS Regression Final Cumulative Exam by Delivery Modality")  

eststo out1: reg falsexam format_ol format_blended if enroll_count==3 |  enroll_count==2   | enroll_count==1
eststo out2: reg falsexam format_ol format_blended gpa cum_total_crds sat_math_NEW sat_verbal_NEW if enroll_count==3 |  enroll_count==2   | enroll_count==1
eststo out3: reg falsexam format_ol format_blended gpa cum_total_crds sat_math_NEW sat_verbal_NEW gender asian black hispanic hawaiian unknown    if enroll_count==3 |  enroll_count==2 | enroll_count==1
esttab out1 out2 out3 using t_B2_OLS_Final_Exam.rtf, replace  b(a3) t abs star(+ 0.10 * 0.05 ** 0.01 *** 0.001) r2(3) ar2(3) scalars (N "chi2 Wald Chi2" "p  Prob > chi2" F  "ll Log lik.") sfmt(3) nogaps label title ("Table B.2 OLS Final Exam WIth Attrition from Randomization to Course Completion") 

sort format_f2f_v_ol
local divide format_f2f_v_ol
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown 
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1                     
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A1_COMPLETED_F2f_v_Online_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.1 Descriptive Statistics for Those Who Completed Course: Face to Face (F2F) versus Online Sections") collabels("N" "Mean" "S.D.") mtitle ( "Online" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3
estpost ttest `vars', by (format_f2f_v_ol)
esttab using t_A1_COMPLETED_F2f_v_Online_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))")label title("Table A.1 Descriptive Statistics for Those Who Completed Course: Face to Face (F2F) versus Online Sections") collabels("F2F N" "F2F Mean" "Online N" "Online Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace

sort format_combined_v_f2f
local divide format_f2f_v_blended
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1 
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A2_COMPLETED_F2f_v_Blended_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.2 Descriptive Statistics for Those Who Completed Course: Face to Face (F2F) versus Blended Sections") collabels("N" "Mean" "S.D.") mtitle ( "Blended" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3
estpost ttest `vars', by (format_f2f_v_blended)
esttab using t_A2_COMPLETED_F2f_v_Blended_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))") label title("Table A.2 Descriptive Statistics for Those Who Completed Course: Face to Face (F2F) versus Blended Sections") collabels("F2F N" "F2F Mean" "Blended N" "Blended Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace

sort format_f2f_v_ol
local divide format_f2f_v_ol
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown 
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1                     
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A3_ISSUED_F2f_v_Online_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.3 Descriptive Statistics When Permission Number Issued: Face to Face (F2F) versus Online Sections") collabels("N" "Mean" "S.D.") mtitle ( "Online" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3 |  enroll_count==2   | enroll_count==1
estpost ttest `vars', by (format_f2f_v_ol)
esttab using t_A3_ISSUED_F2f_v_Online_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))")label title("Table A.3 Descriptive Statistics When Permission Number Issued: Face to Face (F2F) versus Online Sections") collabels("F2F N" "F2F Mean" "Online N" "Online Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace

sort format_combined_v_f2f
local divide format_f2f_v_blended
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1 
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A4_ISSUED_F2f_v_Blended_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.4 Descriptive Statistics When Permission Number Issued: Face to Face (F2F) versus Blended Sections") collabels("N" "Mean" "S.D.") mtitle ( "Blended" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3 |  enroll_count==2   | enroll_count==1
estpost ttest `vars', by (format_f2f_v_blended)
esttab using t_A4_ISSUED_F2f_v_Blended_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))") label title("Table A.4 Descriptive Statistics When Permission Number Issued: Face to Face (F2F) versus Blended Sections") collabels("F2F N" "F2F Mean" "Blended N" "Blended Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace


sort format_f2f_v_ol
local divide format_f2f_v_ol
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown 
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1                     
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A5_USED_F2f_v_Online_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.5 Descriptive Statistics When Permission Number Used: Face to Face (F2F) versus Online Sections") collabels("N" "Mean" "S.D.") mtitle ( "Online" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3 |  enroll_count==2
estpost ttest `vars', by (format_f2f_v_ol)
esttab using t_A5_USED_F2f_v_Online_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))")label title("Table A.5 Descriptive Statistics When Permission Number Used: Face to Face (F2F) versus Online Sections") collabels("F2F N" "F2F Mean" "Online N" "Online Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace

sort format_combined_v_f2f
local divide format_f2f_v_blended
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic  unknown
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1 
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A6_USED_F2f_v_Blended_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.6 Descriptive Statistics When Permission Number Used: Face to Face (F2F) versus Blended Sections") collabels("N" "Mean" "S.D.") mtitle ( "Blended" "F2F") nonum replace
local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white black asian hispanic unknown if enroll_count==3 |  enroll_count==2
estpost ttest `vars', by (format_f2f_v_blended)
esttab using t_A6_USED_F2f_v_Blended_TTEST.rtf, cells("N_1(fmt(0))mu_1(fmt(2))N_2(fmt(0))mu_2(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))") label title("Table A.6 Descriptive Statistics When Permission Number Used: Face to Face (F2F) versus Blended Sections") collabels("F2F N" "F2F Mean" "Blended N" "Blended Mean" "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace



sort experiment1
local divide experiment1
local vars  gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white ethnic_dummy
estimates drop _all 
estpost summarize `vars' 
estimates store A 
estpost summarize `vars' if `divide'==1 
estimates store B 
estpost summarize `vars' if `divide'==0 
estimates store C
esttab B C using t_A7_Exper_v_NonExper_TTEST.rtf, cells("count(fmt(0))mean(fmt(2)) sd(fmt(2))") label title("Table A.7 Descriptive Statistics Experimental and Non-Experimental Students") collabels("N" "Mean" "S.D.") mtitle ( "Exp" "NonExp") nonum replace

local vars gpa cum_total_crds sat_math_NEW sat_verbal_NEW  gender white ethnic_dummy 
estpost ttest `vars', by (experiment1)
esttab using t_A7_Exper_v_NonExper_TTEST.rtf, cells("N_2(fmt(0))mu_2(fmt(2))N_1(fmt(0))mu_1(fmt(2))b(fmt(2))t(fmt(2))p(fmt(2))") label title("Table A.7 Descriptive Statistics Experimental and Non-Experimental Students") collabels("Exp N" "Exp Mean""NonExp N" "NonExp Mean"  "Diff in Means" "t" "Pr(|T| > |t|)")  nonum replace





