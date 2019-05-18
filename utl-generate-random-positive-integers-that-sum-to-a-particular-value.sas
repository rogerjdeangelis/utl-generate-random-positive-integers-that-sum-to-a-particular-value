Generate five thousand random positive integers that sum to one twenty five thousand

github
https://tinyurl.com/yxb98npt
https://github.com/rogerjdeangelis/utl-generate-random-positive-integers-that-sum-to-a-particular-value

SAS Forum
https://tinyurl.com/y2cw9xnr
https://communities.sas.com/t5/SAS-Programming/Random-Numbers-summing-to-a-particular-value/m-p/559505

Nabble R
Bill Venables
http://r.789695.n4.nabble.com/Sum-Random-Numbers-100-td862494.html
http://r.789695.n4.nabble.com/template/NamlServlet.jtp?macro=user_nodes&user=4984

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

Doc on rmultinormal
http://sekhon.berkeley.edu/robust/rmultinomial.html


*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

Number of patients.              25,000
Number of clinical trials        5000
Probability patients in a trial  1/6000 (not 1/5000 * 25000 = abg 5 patients in a trial)

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

Up to 40 obs from WANT total obs=5,000

 Obs    SUM

   1      6
   2      2
   3      4
   4      4
   5      0
 ...

Sum of 500 random integers

        SUM
      25000

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

%utl_submit_r64('
library(SASxport);
want<-as.data.frame(rmultinom(1, 25000, rep(1/5000, 5000)));
write.xport(want,file="d:/xpt/want.xpt");
');

libname xpt xport "d:/xpt/want.xpt";

data want;
  set xpt.want(rename=v1=sum) end=dne;
run;quit;

proc report data=want;
title "Sum of 500 random integers";
run;quit;

libname xpt clear;

