EXPORT NormAddrRecs := MODULE
EXPORT Layout := RECORD
UNSIGNED4 block_ID;
STRING38 Block;
END;
EXPORT File := DATASET('~CLASS::KTC::OUT::LookupBlock',Layout,THOR);
EXPORT IDX_block := INDEX(File,{block_ID},{File},'~CLASS::KTC::KEY::Lookup_CSZ');
END;


// a tabela já foi feita, agora eu definido os campos que quero manter. 
