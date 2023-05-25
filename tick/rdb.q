system "l sym.q";

h_tp:hopen 5010;
/h_tp1:hopen 5012

//EURUSDFeed1:Feed1;
//GBPUSDFeed2:Feed2;
Feed3US:Feed3;



//Feed1avg:select accavg:avg EURUSDprice by accountRef from `EURUSDFeed1;


upd:{[t;d]  //if[t~`Feed1;`EURUSDFeed1 upsert d;update USDprice:((((R-RA)*NP*Period)%(1*Year))*(1%(1+R*(Period%Year))))*1.08 from `EURUSDFeed1];

			//if[t~`Feed2;`GBPUSDFeed2 upsert d;update USDprice:((((R-RA)*NP*Period)%(1*Year))*(1%(1+R*(Period%Year))))*1.24 from `GBPUSDFeed2];

                             if[t~`Feed3;`Feed3US upsert d;update USDprice:((((R-RA)*NP*Period)%(1*Year))*(1%(1+R*(Period%Year)))) from `Feed3US];
                    
                         //   if[t~`Feed2;`GBPUSDFeed2 upsert d;Feed2avg::select accavg:avg USDprice by accountRef from `GBPUSDFeed2];  

                             //  GB::`accountRef xkey Feed3US;
                                  
                                //USDpriceall::EURUSDFeed1 lj GB;

                                 // USDpriceall::EURUSDFeed1,GBPUSDFeed2;

                                 //  USDpriceall::`time xasc USDpriceall;

                                //USDpriceallavg::ej[`accountRef;Feed1avg;Feed2avg];
                                      
                                  //   Feedavg::select accavg:avg USDprice by accountRef from `USDpriceall;
         
                                         // USDpriceavg::select avg USDprice by accountRef from USDpriceall;

                                              USDpriceavg3::select avg USDprice by accountRef from Feed3US;
                                                 
                                                 USD35::select avg USDprice by 5 xbar time.minute,accountRef from Feed3US;

                                           //USD5::select avg USDprice by 5 xbar time.minute,accountRef from USDpriceall;
 
                             }
              
         

Disk_dir:`$":/Thomas_Qcode/tick/Disk";

/.u.x:.z.x,(count .z.x)_(":5010";":5012");

/end of day: save, clear, hdb reload
.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$":",.u.x 1;Disk_dir;x;`sym];@[;`sym;`g#] each t;};


/.u.rep:{(.[;();:;].)each x;if[null first y;:()];-11!y};

//system "cd ",1_-10_string first reverse y};

h_tp"(.u.sub[`;`])";

/.u.rep .(hopen `$":",.u.x 0)"(.u.sub[`;`];`.u `i`L)";

