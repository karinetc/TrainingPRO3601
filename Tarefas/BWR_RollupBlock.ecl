IMPORT $;
Layout_T_recs := RECORD
UNSIGNED4 block_ID := $.Formatted_File.row_id;  //colocando um novo nome para ter o block_ID
$.Formatted_File.Block;
END;  // só os campos que que quero na tabela de endereços
T_recs := TABLE($.Formatted_File,Layout_T_recs); //formated file e o layout definido
S_recs := SORT(T_recs,block);  //ordenando por bloco
S_recs;
COUNT(S_recs);
Layout_T_recs RollCSV(Layout_T_recs L, Layout_T_recs R) := TRANSFORM
SELF.block_ID := IF(L.block_ID < R.block_ID,L.block_ID,R.block_ID);  //vai tirando duplicatas, mantendo o menor row_id
SELF := L;
END;
Rollup_block := ROLLUP(S_Recs,LEFT.block=RIGHT.block,RollCSV(LEFT,RIGHT));
Rollup_block;
COUNT(Rollup_block);
S_Rollup_block := SORT(Rollup_block,block_ID);
OUTPUT(S_Rollup_block,,'~CLASS::KTC::OUT::LookupBlock',OVERWRITE);  //salvando a tabela que foi feita