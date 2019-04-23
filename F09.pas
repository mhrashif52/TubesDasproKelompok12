Unit F09;

interface

uses Record_Perpus;	

var
	Bukufile : text;
	textline : string;
	arrDataBuku : array[1..NMax] of DataBuku;
	InputBukuBaru : DataBuku;
	
	
procedure registerBukuBaru;

procedure updateregisterBukuBaru(arrDataBuku : array of DataBuku);


implementation

procedure registerBukuBaru;

begin
	writeln('Masukkan informasi buku yang ditambahkan:');
	write('Masukkan id buku: ');
	readln(InputBukuBaru.idBuku);
	write('Masukkan judul buku: '); 
	readln(InputBukuBaru.judul);
	write('Masukkan pengarang buku: ');
	readln(InputBukuBaru.author);
	write('Masukkan jumlah buku: ');
	readln(InputBukuBaru.jumlah);
	write('Masukkan tahun terbit buku: ');
	readln(InputBukuBaru.tahunterbit);
	write('Massukan kategori buku: ');
	readln(InputBukuBaru.kategori);
	
	NeffBukuBaru := NeffBukuBaru + 1;
	arrDataBuku[NeffBukuBaru].idBuku := InputBukuBaru.idBuku;
	arrDataBuku[NeffBukuBaru].judul := InputBukuBaru.judul;
	arrDataBuku[NeffBukuBaru].author := InputBukuBaru.author;
	arrDataBuku[NeffBukuBaru].jumlah := InputBukuBaru.jumlah;
	arrDataBuku[NeffBukuBaru].tahunterbit := InputBukuBaru.tahunterbit;
	arrDataBuku[NeffBukuBaru].kategori := InputBukuBaru.kategori;
end;

procedure updateregisterBukuBaru(arrDataBuku : array of DataBuku);
var
	i : integer;
begin
	system.Assign(Bukufile, 'buku.csv');
	system.Append(Bukufile);
	for i := 1 to NeffBukuBaru do
	begin
		textLine := arrDataBuku[i].idBuku + ',' + arrDataBuku[i].judul + ',' + arrDataBuku[i].author + ','+ arrDataBuku[i].jumlah +
		',' + arrDataBuku[i].tahunterbit + ',' + arrDataBuku[i].kategori + ',' ;
		writeln(Bukufile,textline);
end;
writeln('Buku berhasil ditambakan');
Close(Bukufile);
end;

end.
