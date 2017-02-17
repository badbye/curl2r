library(testthat)
context('test parse cookie')

test_that('', {
  cookie = 'SINAGLOBAL=4645198967773.468.1447948783256; _ga=GA1.2.1958093199.1460879935; _s_tentry=login.sina.com.cn; Apache=7220759215994.308.1481891113424; ULV=1481891113861:18:2:1:7220759215994.308.1481891113424:1480863344769; YF-V5-G0=bb389e7e25cccb1fadd4b1334ab013c1; YF-Page-G0=27b9c6f0942dad1bd65a7d61efdfa013; YF-Ugrow-G0=1eba44dbebf62c27ae66e16d40e02964; TC-V5-G0=c427b4f7dad4c026ba2b0431d93d839e; TC-Ugrow-G0=0149286e34b004ccf8a0b99657f15013; TC-Page-G0=0dba63c42a7d74c1129019fa3e7e6e7c; SSOLoginState=1484985900; wb_g_upvideo_2214298737=1; wvr=6; SCF=AuMRsNIT-85h1E6KRSCItIg1GjYQ4jot-6i7y2B2c2Va5895yeAPfVeqBcEWZiYMHqTvcv_3LH44gj7r8IE6cUA.; SUB=_2A251osFtDeTxGeRM6lYT-SbLyDuIHXVW2bWlrDV8PUNbmtBeLWXQkW-SFqhsaPSxfHH8f2dVPFW5jS_-YA..; SUBP=0033WrSXqPxfM725Ws9jqgMF55529P9D9Whhvwb.7WPORNwpT4FIRrxs5JpX5KMhUgL.FozEeKBE1KnNe0M2dJLoI79bqgxbwg-t; SUHB=0HTwhvTbybc3iO; ALF=1518855357; UOR=iphone.tgbus.com,widget.weibo.com,login.sina.com.cn'
  res = parse_cookie(cookie)
  expect_is(res, 'list')
  expect_true(!any(names(res) %in% c('', NA, NULL)))
  for (i in 1:length(res)){
    expect_is(names(res[i]), 'character')
    expect_is(res[[i]], 'character')
  }
})

