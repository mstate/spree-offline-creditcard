module Spree
  CreditCard.class_eval do 
    # require 'openssl'
    # require 'base64'
    require 'gpgme'
    before_save :encrypt_credit_card_details
    # overrides filter_sensitive to make sure the stored values are encrypted.
    private
    def encrypt_credit_card_details                 
      # don't encrypt again, this way we can clone and order and its creditcard and keep text encrypted
      return true unless encrypted_text.blank?
      # gnupg = GnuPG.new :recipient => SpreeOfflineCreditCard::Config.public_key_email
      # public_key_text = Rails.cache.fetch('public_key') do
      #   File.read("#{Rails.root}/#{SpreeOfflineCreditCard::Config.public_key_path}")
      # end
      # gnupg.load_public_key public_key_text        
      text_to_encrypt = "Number: #{number}    Code: #{verification_value}"
      # self[:encrypted_text] = gnupg.encrypt(text)
      # self[:display_number] = ActiveMerchant::Billing::CreditCard.mask(number) if self.display_number.blank?
      # self[:number] = ""
      # self[:verification_value] = ""
      GPGME::Key.import(File.open("#{Rails.root}/#{SpreeOfflineCreditCard::Config.public_key_path}"))
      crypto = GPGME::Crypto.new
      self.encrypted_text = crypto.encrypt text_to_encrypt, :recipients => SpreeOfflineCreditCard::Config.public_key_email   
    end
  end
end

