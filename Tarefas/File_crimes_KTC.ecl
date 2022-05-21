
EXPORT File_crimes_KTC := MODULE
	EXPORT Layout:= RECORD
	UNSIGNED8 id;
	STRING case_number ;
	STRING8 date;
	STRING Block;
	STRING iucr ;
	STRING primary_type;
	STRING description;
	STRING location_description;
	BOOLEAN arrest;
	BOOLEAN domestic;
	STRING beat;
	STRING district;
	INTEGER8 ward;
	STRING community_area;
	STRING fbi_code;
	INTEGER8 x_coordinate;
	INTEGER8 y_coordinate;
	INTEGER8 year;
	STRING update_on;
	STRING latitude;
	STRING longitude;
	STRING location;

	END;
EXPORT File := DATASET('~class::intro::ktc::crimes_-_2001_to_present.csv', Layout, CSV(heading(1)));
END;


	