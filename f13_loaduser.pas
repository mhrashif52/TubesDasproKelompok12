unit F013temp;

interface

uses Record_Perpus;

const
    NMax = 10000;

var

    arrDataAkun : array [1..NMax] of Akun;

    // Variable to Read Char or Line from csv file
	readchar : Char;
	readline : string;

    // Variable to Read Buku.csv
	fileuser : textfile;
	i,j  : integer;
    lenUser : integer;
	tipeDataUser : integer;
    fuser : file of char;
	
procedure loadUser;

implementation

procedure loadUser;
begin

system.Assign(fuser, 'user.csv');
system.Reset(fuser);
lenUser := FileSize(fuser);
Close(fuser);

system.Assign(fileuser, 'user.csv');
system.Reset(fileuser);

i := 1; // Untuk Index array arrDataAkun
j := 1; // Counting Read ke-berapa
tipeDataUser := 1;

readln(fileuser,readline);

read(fileuser,readchar);

repeat 

	case tipeDataUser of
	
	1 : 
		begin
		if  (readchar = ',') and (j <  lenUser)  then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 1) and (j <  lenUser)) do
		begin
			arrDataAkun[i].nama := arrDataAkun[i].nama + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
		
	2 : 
		begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 2) and (j <  lenUser) ) do
		begin
			arrDataAkun[i].alamat := arrDataAkun[i].alamat + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
	3 : 
		begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 3) and (j <  lenUser) ) do
		begin
		
			arrDataAkun[i].username := arrDataAkun[i].username + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;	
		
		end;
		
	4 : begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 4) and (j <  lenUser)) do
		begin
		
			arrDataAkun[i].password := arrDataAkun[i].password+ readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
		
	5 : begin
		if (readchar = ',') and (j <  lenUser) then 
		begin
			tipeDataUser := 1;
			i := i + 1;
			readln(fileuser, readchar); // Next Line (Untuk Menghindari 'new line' dalam Array
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 5) and (j <  lenUser)) do
		begin
			arrDataAkun[i].role := arrDataAkun[i].role + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
	
	end; // End of Case tipeDataUser
	
until (j >= lenUser);

Close(fileuser);

end; // End of Procedure

end.