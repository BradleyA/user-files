
#	etc/ssh/sshd_config-two-rpi3b.cptx86.com  3.191.249  2019-05-30T12:19:03.332424-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.190  
#	   first draft of sshd_config standards 
# Package generated configuration file
# See the sshd_config(5) manpage for details

# What ports, IPs and protocols we listen for
#Port 22
# >>>   added the following line      <<<
Port 12323
# Use these options to restrict which interfaces/protocols sshd will bind to
#ListenAddress ::
#ListenAddress 0.0.0.0
# >>>	 security vulnerabilities discovered with protocol 1
Protocol 2
# HostKeys for protocol version 2
HostKey /etc/ssh/ssh_host_rsa_key
# >>>   commented the following line      <<<
#	HostKey /etc/ssh/ssh_host_dsa_key
# >>>   added the following line      <<<
#	HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key
#Privilege Separation is turned on for security
UsePrivilegeSeparation yes

# Lifetime and size of ephemeral version 1 server key
KeyRegenerationInterval 3600
ServerKeyBits 1024

# Logging
SyslogFacility AUTH
LogLevel INFO

# Authentication:
# >>>   commented the following line      <<<
#	LoginGraceTime 120
# >>>   added the following line      <<<
LoginGraceTime 60
# >>>   commented the following line      <<<
#	PermitRootLogin prohibit-password
# >>>   added the following line      <<<
PermitRootLogin forced-commands-only
StrictModes yes

RSAAuthentication yes
PubkeyAuthentication yes
#AuthorizedKeysFile	%h/.ssh/authorized_keys
# >>>   added the following line      <<<
AuthorizedKeysFile /etc/ssh/keys/%u/.ssh/authorized_keys %h/.ssh/authorized_keys

# Don't read the user's ~/.rhosts and ~/.shosts files
IgnoreRhosts yes
# For this to work you will also need host keys in /etc/ssh_known_hosts
RhostsRSAAuthentication no
# similar for protocol version 2
HostbasedAuthentication no
# Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
#IgnoreUserKnownHosts yes

# To enable empty passwords, change to yes (NOT RECOMMENDED)
PermitEmptyPasswords no

# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
ChallengeResponseAuthentication no

# Change to no to disable tunnelled clear text passwords
#PasswordAuthentication yes

# Kerberos options
#KerberosAuthentication no
#KerberosGetAFSToken no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes

# >>>   commented the following line      <<<
# X11Forwarding yes
# >>>   added the following line      <<<
X11Forwarding no
X11DisplayOffset 10
PrintMotd no
PrintLastLog yes
# >>>   commented the following line      <<<
# TCPKeepAlive yes
# >>>   added the following 2 line      <<<
# >>>   messages are sent outside encrypted channel, spoofable, known security risk, add ClientAliveInterval which is encrypted
TCPKeepAlive no
#UseLogin no

#MaxStartups 10:30:60
Banner /etc/issue.net

# Allow client to pass locale environment variables
AcceptEnv LANG LC_*

Subsystem sftp /usr/lib/openssh/sftp-server

# Set this to 'yes' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.  Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to 'no'.
UsePAM yes
#
###
# >>>   added the following lineS     <<<
ClientAliveInterval 15
ClientAliveCountMax 3

#       “no” to prevent all TCP forwarding
AllowTcpForwarding no
#       login is allowed only for user names that match one of the patterns.
AllowUsers uone utwo uthree ufour ufive usix uadmin
AllowUsers back@192.168.1.0/24
#       Login allowed only for users whose primary or supplementary group list matches one of the patterns
#	AllowGroups sudo

