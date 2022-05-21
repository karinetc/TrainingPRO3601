IMPORT $,STD;
crimes := $.File_crimes_optimized_KTC.File;


//Filtrando de 2010 até 2020
filtro_data :=crimes.date[7..10]  >= '2010' AND crimes.date[7..10] <= '2020';

recset := crimes(filtro_data);

rec2 := RECORD
  ano:= recset.date[7..10];
	cnt := COUNT(GROUP);
END;

crosstab := TABLE(recset,rec2,date[7..10]);
//crosstab;

crosstab_sorted:= SORT(crosstab, ano);
crosstab_sorted;


avg := AVE(crosstab,cnt);
avg;
