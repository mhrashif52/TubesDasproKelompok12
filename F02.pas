unit F02;
{Unit yang berguna untuk login akun yang sudah terdaftar sebelumnya}

interface
	uses Record_Perpus;
	procedure loginAkun(var arrDataAkun : array of akun);

implementation
	procedure loginAkun(var arrDataAkun : array of akun);
		const
			NMax = 10000;
		
		var
			i,valid : integer;
			namaTemp : string;
			Akun_Temp : akun;
			
		begin
			write('Masukkan Username: ');
			readln(Akun_Temp.username);
			write('Masukkan Password: ');
			readln(Akun_Temp.password);
			valid := 0;
			
			for i:= 0 to (NMax-1) do
				begin
					if(Akun_Temp.username = arrDataAkun[i].username) and (Akun_Temp.password = arrDataAkun[i].password ) then
						begin
							valid := 1;
							namaTemp := arrDataAkun[i].nama;
							usernameLogin := arrDataAkun[i].username;
							userLoginStatus := arrDataAkun[i].role;
						end;
				end;

			while (valid = 0) do
				begin
					writeln('Username / password salah! Silakan coba lagi.');
					write('Masukkan Username: ');
					readln(Akun_Temp.username);
					write('Masukkan Password: ');
					readln(Akun_Temp.password);
						
					for i:= 1 to (NMax-1) do
						begin
							if(arrDataAkun[i].username = Akun_Temp.username) and (arrDataAkun[i].password = Akun_Temp.password) then
								begin
									valid := 1;
									namaTemp := arrDataAkun[i].nama;
									usernameLogin := arrDataAkun[i].username;
									userLoginStatus := arrDataAkun[i].role;
								end;
						end;
				end;
			writeln('Selamat Datang ',namaTemp,'!');
		end;
end.	
