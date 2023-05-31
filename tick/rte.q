system "l sym.q";
h_tp:hopen 5010;


EURFeed1:Feed1;
GBPFeed2:Feed2;

upd:{[t;d] if[t~`Feed1;`EURFeed1 upsert d;update price:(((R-RA)*NP*Period)%(1*Year))*(1%(1+R*(Period%Year))) from `EURFeed1];   //Calculate the price for Feed1 in EUR
			if[t~`Feed2;`GBPFeed2 upsert d;update price:(((R-RA)*NP*Period)%(1*Year))*(1%(1+R*(Period%Year))) from `GBPFeed2]}     //Calculate the price for Feed2 in GBP

h_tp"(.u.sub[`;`])";

