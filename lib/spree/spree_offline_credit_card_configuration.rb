class SpreeOfflineCreditCard::Configuration < Spree::Preferences::Configuration
  # preference :disable_bill_address, :boolean, :default => false
  preference :public_key_email, :string, :default => "foo@example.com" # replace with address of your PGP key
  
  preference :public_key_path, :string, :default => "config/foo-public.asc" # replace with real location of PUBLIC key
end
