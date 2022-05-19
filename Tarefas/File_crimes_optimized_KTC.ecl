EXPORT File_crimes_optimized_KTC := MODULE
	EXPORT Layout:= RECORD
	UNSIGNED8 id;
	STRING9 case_number;
	STRING8 date;
	STRING38 block;
	STRING4 iucr;
	STRING33 primary_type;
	STRING60 description;
	STRING53 location_description;
	BOOLEAN arrest;
	BOOLEAN domestic;
	STRING4 beat;
	STRING3 district;
	INTEGER8 ward;
	UNSIGNED1 community_area;
	STRING3 fbi_code;
	INTEGER8 x_coordinate;
	INTEGER8 y_coordinate;
	INTEGER8 year;
	STRING22 update_on;
	REAL8 latitude;
	REAL8 longitude;
	STRING29 location;

	END;
EXPORT File := DATASET('~class::intro::ktc::crimes_-_2001_to_present.csv', Layout, CSV(heading(1)));
END;