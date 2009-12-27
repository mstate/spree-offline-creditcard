Offline Creditcard
==================

This extension provides the ability to encrypt credit card information that is provided during checkout.  It also includes an offline gateway that gives you the option of storing the credit card without authorizing/capturing during checkout.

No decryption functionality is provided in this extension.  For totally secure storage of credit card information you should never store your private PGP key on a publicly accessible server.  This includes the server hosting your store.  There is an excellent Firefox plugin (FireGPG) which provides a nice way to securely decrypt PGP encrypted information from a browser (where the client machine can hold the private key.)

Fork-specific Notes
-------------------
1. Updated to be compatible with Spree 0.9.3
2. Slimmed down heavily. Includes only the *index* and *show* actions

Configuration
-------------
<pre>
Spree::Pgp::Config.set :email => "foo@example.com"
Spree::Pgp::Config.set :public_key => "config/foo-public.asc"
</pre>
