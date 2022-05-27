New_Layout := RECORD
   UNSIGNED   recid; 
	 STRING10 dia;
	 STRING10 hora;
	 $.File_crimes_optimized_KTC.Layout;
 END;

New_Layout MyTransf($.File_crimes_optimized_KTC.Layout Le, UNSIGNED cnt) := TRANSFORM  
   SELF.recid:=cnt;
	 SELF.dia:= Le.date[..10];
	 SELF.hora:=  Le.date[12..19];
   SELF := Le;
 END;

 //newds := PROJECT($.File_crimes_optimized_KTC.File, MyTransf(LEFT,COUNTER));  //recebo um data set, e passo uma função com dois parâmetros
 //newds;
 
 EXPORT UID_Crimes := PROJECT($.File_crimes_optimized_KTC.File, MyTransf(LEFT,COUNTER))
															:PERSIST('~CLASS::KTC::PERSIST::UID_Crimes');