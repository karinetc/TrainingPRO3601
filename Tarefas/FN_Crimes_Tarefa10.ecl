// Fazendo a consulta:

//pesquisar por primary type
//pesquisar por description

IMPORT $;

EXPORT FN_Crimes_Tarefa10 (STRING primary, STRING descr) := FUNCTION
	
	basekey1 := $.NormCrimeRecs.IDX_PrimaryType_Description;
	basekey2 := $.NormAddrRecs.IDX_block;
	
	FilteredKey := IF(primary='',
										basekey1(Primary_Type=primary), 
										basekey1(Description=descr AND Primary_Type=primary)
										);
	
	Outrec := RECORD
		RECORDOF(basekey1) AND NOT [block_ID];
		RECORDOF(basekey2) AND NOT [block_ID];
	END;
	
	Outrec MyJoin(basekey2 Le, FilteredKey Ri):= TRANSFORM
		SELF:=Le;
		SELF:=Ri;
	END;
	
	JoinRecs:= JOIN(basekey2,FilteredKey,
									LEFT.block_ID=RIGHT.block_ID, 
									MyJoin(LEFT, RIGHT),
									ALL);

	RETURN OUTPUT(JoinRecs);
END;