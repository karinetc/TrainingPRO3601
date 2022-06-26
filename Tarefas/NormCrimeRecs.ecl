IMPORT $;
EXPORT NormCrimeRecs := MODULE
EXPORT Layout := RECORD
UNSIGNED row_id;
UNSIGNED4 day;
STRING time;
STRING11 Case_Number;
STRING4 IUCR;
STRING33 Primary_Type;
STRING60 Description;
UNSIGNED4 block_ID;
END;
EXPORT File := DATASET('~CLASS::KTC::OUT::Crimes_Slim',Layout,THOR);
EXPORT IDX_PrimaryType_Description := INDEX(File,{Primary_Type,Description},{File},'~CLASS::KTC::KEY::PrimaryType_Description');
END;
