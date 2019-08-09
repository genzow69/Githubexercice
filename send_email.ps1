#SCRIPT ENVOI EMAIL
# 10 07 2018


$smtpServer = "smtp.free.fr"
$SMTPclient = new-object System.Net.Mail.SmtpClient $smtpServeur 
$SMTPClient.port = 465
$SMTPclient.EnableSsl = $true
#Informations d'authentification SMTP 
$SMTPAuthUsername = "soandso@everquest.com"
$SMTPAuthPassword = "KunrkRulz" 
 $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($SMTPAuthUsername,$SMTPAuthPassword)

$to = "trakanon@everquest.com"
$subject = "[TEST] ENVOI auto email par powershell pour $to "
$body = "
<html>
  <head></head>
     <body>
        <p>Bonjour,<br />
           Voici un email automatique envoyé avec POWERSHELL<br />:
        </p>
      </body>
</html>"
# envoi de l'email en priorité haute
Send-MailMessage -smtpserver $smtpserver -from $SMTPAuthUsername  -to $to -subject $subject -body $body -bodyasHTML -priority High