unit Login;
{Unit yang berguna untuk login akun yang sudah terdaftar sebelumnya}

interface
	uses Record_Perpus;
	procedure Login(var Akun_Lama : akun);

implementation
	procedure Login(var Akun_Lama : akun);
		var
			Akun_Temp : akun;
			
		begin
			write('Masukkan Username: ');
			readln(Akun_Temp.username);
			write('Masukkan Password: ');
			readln(Akun_Temp.password);
			while (Akun_Lama.username <> Akun_Temp.username) or (Akun_Lama.password <> Akun_Temp.password) do
				begin
					writeln('Username / password salah! Silakan coba lagi.');
					write('Masukkan Username: ');
					readln(Akun_Temp.username);
					write('Masukkan Password: ');
					readln(Akun_Temp.password);
				end;
			writeln('Selamat Datang ',Akun_Lama.nama,'!');
		end;
end.	
		
