module Validator

  VERSION = "0.1.0"
  # Menyimpan pesan kesalahan dengan field sebagai kunci
  @@errors = {} of String => Array(String)

  # Menambahkan pesan kesalahan
  def self.add_error(field_name : String, label : String, message : String)
    @@errors[field_name] ||= [] of String
    @@errors[field_name] << message
  end

  # Mendapatkan semua pesan kesalahan
  def self.errors
    @@errors
  end

  # Mengosongkan pesan kesalahan
  def self.clear_errors
    @@errors.clear
  end

  # Validasi required
  def self.validate_required(value : String, label : String, field_name : String)
    if value.nil? || value.empty?
      add_error(field_name, label, "#{label} tidak boleh kosong.")
    end
  end

  # Validasi panjang minimum
  def self.validate_min_length(value : String, field_name : String, label : String, min_length : Int32)
    if value.size < min_length
      add_error(field_name, label, "#{label} harus memiliki minimal #{min_length} karakter.")
    end
  end

  # Validasi panjang maksimum
  def self.validate_max_length(value : String, field_name : String, label : String, max_length : Int32)
    if value.size > max_length
      add_error(field_name, label, "#{label} tidak boleh melebihi maksimal #{max_length} karakter.")
    end
  end

  # Validasi email
  def self.validate_email(value : String, field_name : String, label : String)
    unless value =~ /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
      add_error(field_name, label, "#{label} tidak valid.")
    end
  end

  # Mengembalikan apakah ada kesalahan
  def self.valid?
    @@errors.empty?
  end
end
