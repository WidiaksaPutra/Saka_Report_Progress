// ignore_for_file: constant_identifier_names

import 'package:get_it/get_it.dart';

final getItInstance = GetIt.instance;
//sna
const String versiAplikasi = "1.0.2";
const String base_logo = "logo_spr";

//mdi
// const String versiAplikasi = "1.0.8"; 
// const String base_logo = "logo_mdi";

// hws
// const String versiAplikasi = "1.0.8";
// const String base_logo = "logo_hws";

const String kUsernameNullError = "Username tidak boleh kosong";
const String kPassNullError = "Password tidak boleh kosong";
const String kMatchPassError = "Password tidak cocok";
const String kCatatanError = "Catatan tidak boleh kosong";
const String kKodeSalesNullError = "Kode sales tidak boleh kosong";
const String kSerialPinNullError = "Pin tidak boleh kosong";
const String kLedgerNoAndNamaTokoNullError = "no ledger atau nama toko tidak boleh kosong";
const String kNamaTokoNullError = "Nama toko tidak boleh kosong";
const String kProvinsiNullError = "Alamat Provinsi tidak boleh kosong";
const String kKabupatenNullError = "Alamat Kabupaten tidak boleh kosong";
const String kKecamatanNullError = "Alamat Kecamatan tidak boleh kosong";
const String kOwnerNameTokoNullError = "Owner Name toko tidak boleh kosong";
const String kNoPhoneTokoNullError = "Owner No phone tidak boleh kosong";
const String kStoreAreaSizeTokoNullError = "Store area size tidak boleh kosong";
const String kFeaturedProductNullError = "Featured Product area size tidak boleh kosong";
const String kManagerNameNullError = "Manager Name area size tidak boleh kosong";
const String kManagerPhoneNullError = "Manager Phone area size tidak boleh kosong";
const String kKodePosNullError = "Kode Pos tidak boleh kosong";
const String kAlamatTokoNullError = "Alamat dan Maps toko tidak boleh kosong";
const String kTujuanKunjunganNullError = "Tujuan kunjungan tidak boleh kosong";
const String kKeteranganPengajuanKunjunganNullError = "Keterangan Pengajuan Kunjungan tidak boleh kosong";
const String kAlasanReset = "tolong berikan alasan melakukan reset...";
const String kAlasanOffline = "tolong berikan alasan menggunakan mode offline...";
const String kTipeOrderNullError = "pilih Tipe Order anda";
const String kKondisiKunjunganNullError = "Keterangan Pertama tidak boleh kosong";
const String kRencanaKunjunganNullError = "Rencana Kunjungan tidak boleh kosong";
const String kResponsTokoNullError = "Respons Toko tidak boleh kosong";
const String kOrderTokoNullError = "Order Toko tidak boleh kosong";
const String kResponsProyekNullError = "Respons Proyek tidak boleh kosong";
const String kGambarNullError = "Gambar tidak boleh kosong";
const String kKeteranganOrAlasanNullError = "Keterangan/Alasan Order tidak boleh kosong";
const String kTanggalNotNull = "Tanggal tidak boleh kosong..";
// const String kGambarNullError = "Anda perlu mengunggah minimal 2 gambar";
const String kMapReportError = "Toko belum memiliki lokasi, input lokasi toko terlebih dahulu...";
const String kLocationSubmit = "lokasi toko hanya dapat di atur sekali, apakah anda yakin dengan lokasi ini..?";
const String kTujuanSurveyNullError = "Tujuan survey tidak boleh kosong";
const String kKondisiSurveyNullError = "Kondisi survey tidak boleh kosong";
const String kRencanaSurveyNullError = "Rencana survey tidak boleh kosong";
const String kResponsTokoSurveyNullError = "Respons Toko tidak boleh kosong";
const String kTipeSurveyNullError = "Tipe Survey tidak boleh kosong";
const String kTipeKunjunganNullError = "Tipe Kunjungan tidak boleh kosong";
const String kLedgerTokoNullError = "Ledger toko tidak boleh kosong";
const String kNamaProyekNullError = "Nama proyek tidak boleh kosong";
const String kAlamatProyekNullError = "Alamat proyek tidak boleh kosong";
const String kConnectionLow = "Maaf, koneksi internet Anda tidak stabil. Tampilan kembali ke daftar list. Silakan coba lagi melanjutkan ke detail...";
const String kJumlahItemNullError = "Jumlah item order tidak boleh kosong";
const String kKodeItemNullError = "Kode item order tidak boleh kosong";
const String kDiscNullError = "Disc order tidak boleh kosong";
const String kDiscountNullError = "Discount order tidak boleh kosong";
const String kHargaSatuanNullError = "Harga Satuan order tidak boleh kosong"; 

const String kQtyItemNullError = "Quantity item order tidak boleh kosong";
const String kNoHpSupirNullError = "No Hp Supir tidak boleh kosong";
const String kSupirNullError = "Supir tidak boleh kosong";
const String kNoMobilNullError = "No Mobil tidak boleh kosong";
const String kDiscSupplierNullError = "Disc Supplier tidak boleh kosong";
const String kDiscInternalNullError = "Disc Internal tidak boleh kosong";

const String snackBarLoginBerhasil = "Login Berhasil";
const String snackBarLoginSalah = "Maaf, Username atau Password Salah. Silakan periksa kembali dan coba lagi...";
const String snackBarLoginGagal = "Maaf, Login Gagal";

const String snackBarRegisterApproval = "Menunggu Approval dari Admin.";
const String snackBarRegisterActive = "Menunggu Aktivasi dari Admin.";
const String snackBarRegisterApproveBerhasil = "User Sudah di Approve.";
const String snackBarRegisterActiveBerhasil = "User Sudah Aktive.";
const String snackBarRegisterSukses = "Registrasi Sukses.";
const String snackBarRegistrasiGagal = "Maaf, Pin dan Kode Sales Anda Tidak Dapat Melakukan Registrasi...";
const String snackBarRegistrasiGagal2 = "Maaf, Pin atau Kode Sales yang Anda masukkan salah. Silakan periksa kembali dan coba lagi...";
const String snackBarRegistrasiGagal4 = "Maaf, Registrasi Gagal";

const String snackBarLogoutBerhasil = "Logout Berhasil";
const String snackBarLogoutGagal = "Logout Gagal";

const String snackBarFormReportBerhasil = "Data kunjungan berhasil di simpan...";
const String snackBarSimpanPengajuanBerhasil = "Pengajuan berhasil di simpan...";
const String snackBarDeletePengajuanBerhasil = "Pengajuan berhasil di hapus...";
const String snackBarBatalPengajuanBerhasil = "Pengajuan berhasil di hapus...";
const String snackBarAjukanPengajuanBerhasil = "Pengajuan berhasil di ajukan...";

// const String snackBarSimpanPengajuanGagal = "Maaf, terdapat kesalahan pada pengajuan kunjungan yang anda masukan, Silakan periksa kembali dan coba lagi...";
const String snackBarSimpanPengajuanGagal = "Pengajuan kunjungan gagal di simpan...";
const String snackBarDeletePengajuanGagal = "Pengajuan kunjungan gagal di hapus...";
const String snackBarAjukanPengajuanGagal = "Pengajuan kunjungan gagal di ajukan...";

const String snackBarFormReportGagal = "Maaf, terdapat kesalahan pada Form report yang anda masukan, Silakan periksa kembali dan coba lagi...";
const String snackBarFormReportGagal2 = "Form report gagal di simpan...";

const String snackBarFormSurveyBerhasil = "Form survey berhasil di simpan...";
const String snackBarFormSurveyGagal = "Maaf, terdapat kesalahan pada Form survey yang anda masukan, Silakan periksa kembali dan coba lagi...";
const String snackBarFormSurveyGagal2 = "Form survey gagal di simpan...";

const String snackBarUpdateAplikasiTrue = "Aplikasi terupdate ke versi $versiAplikasi...";

const String snackBarError500 = "(500) Maaf, terjadi kesalahan pada api kami. Kami sedang berusaha memperbaikinya. Silakan coba lagi nanti...";
const String deviceIdProblem = "Maaf, terdapat problem pada device id, silahkan screenshot pesan ini, dan hubungin tim IT...";

const String gpsProblemListen = "Maaf, terdapat gangguan pada GPS, silahkan matikan lokasi sejenak dan hidupkan kembali lokasi...";
const String gpsProblem = "Maaf, lokasi anda tidak aktif, silahkan hidupkan lokasi...";

const String snackBarLogout = "Maaf, token Anda tidak lagi berlaku. Anda akan diarahkan ke halaman login...";

const String snackBarFormKosong = "Formulir belum lengkap, silakan isi semua kolom yang kosong...";

const String namaTokoStatus= "Nama toko sudah tersedia, silahkan ganti nama toko...";

const String screatKey = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
const String apiKeyMaps = "AIzaSyA-s1rNAif8oHRuCySaITRxxh9rzbsxC9I";
const String tokenUnshorten = "c260ecb87fc25421de47df946da3004bfb46f1ad";
