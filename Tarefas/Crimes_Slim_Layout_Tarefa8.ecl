IMPORT $;

Crimes:= $.Formatted_File;

// Dados, sem os valores de endereço
Layout_Slim := RECORD
	crimes.row_id;
	crimes.id;
	crimes.case_number;
	crimes.day;
	crimes.time;
	crimes.iucr;
	crimes.primary_type;
	crimes.description;
	crimes.location_description;
	crimes.arrest;
	crimes.domestic;
	crimes.beat;
	crimes.ward;
	crimes.fbi_code;
	crimes.x_coordinate;
	crimes.y_coordinate;
	crimes.year;
	crimes.update_on;
	crimes.latitude;
	crimes.longitude;
	crimes.location;
END;

Chicago := TABLE(Crimes, Layout_Slim);
OUTPUT(Crimes, Layout_Slim, NAMED('Chicago'));

// Só registros de endereço, com o row_id
Layout_endereco:= RECORD
crimes.row_id;
crimes.block;
crimes.community_area;
crimes.district;

END;

Chicago_endereco := TABLE(Crimes, Layout_endereco);
OUTPUT(Crimes, Layout_endereco, NAMED('Chicago_endereco'));

// Join das duas informações
Combinados :=JOIN(Chicago, Chicago_endereco, LEFT.row_id=RIGHT.row_id);
OUTPUT(Combinados, NAMED('Combinados'));