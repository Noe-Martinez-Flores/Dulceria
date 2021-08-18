package com.example.Dulceria.util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
    private static String myEmail = "calaveritazuca@gmail.com";
    private static String password = "candyman-10";

    public boolean sendRecoverPassword(String email, String codigo, String ip) {
        String title = "Recuperar contraseña Gestor de Contenido";
        try {
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.user", myEmail);
            props.setProperty("mail.smtp.auth", "true");
            props.put("mail.smtp.ssl.truts", "smtp.gmail.com");
            String body = "<!DOCTYPE html>\n" +
                    "<html lang=\"en\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
                    "<head>\n" +
                    "  <meta charset=\"UTF-8\">\n" +
                    "  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n" +
                    "  <meta name=\"x-apple-disable-message-reformatting\">\n" +
                    "  <title></title>\n" +
                    "  <!--[if mso]>\n" +
                    "  <noscript>\n" +
                    "    <xml>\n" +
                    "      <o:OfficeDocumentSettings>\n" +
                    "        <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                    "      </o:OfficeDocumentSettings>\n" +
                    "    </xml>\n" +
                    "  </noscript>\n" +
                    "  <![endif]-->\n" +
                    "  <style>\n" +
                    "    table, td, div, h1, p {font-family: Arial, sans-serif;}\n" +
                    "  </style>\n" +
                    "</head>\n" +
                    "<body style=\"margin:0;padding:0;\">\n" +
                    "  <table role=\"presentation\" style=\"width:100%;border-collapse:collapse;border:0;border-spacing:0;background:#ffffff;\">\n" +
                    "    \n" +
                    "    <tr>\n" +
                    "      <td align=\"center\" style=\"padding:0;\">\n" +
                    "        <table role=\"presentation\" style=\"width:602px;border-collapse:collapse;border:1px solid #cccccc;border-spacing:0;text-align:left;\">\n" +
                    "          <td style=\"padding:30px;background:#ee4c50;\">\n" +
                    "            <table role=\"presentation\" style=\"width:100%;border-collapse:collapse;border:0;border-spacing:0;font-size:9px;font-family:Arial,sans-serif;\">\n" +
                    "              <tr>\n" +
                    "                <td style=\"padding:0;width:50%;\" align=\"left\">\n" +
                    "                  \n" +
                    "                </td>\n" +
                    "                <td style=\"padding:0;width:50%;\" align=\"right\">\n" +
                    "                  <table role=\"presentation\" style=\"border-collapse:collapse;border:0;border-spacing:0;\">\n" +
                    "                    <tr>\n" +
                    "                      <td style=\"padding:0 0 0 10px;width:38px;\">\n" +
                    "                        \n" +
                    "                      </td>\n" +
                    "                      <td style=\"padding:0 0 0 10px;width:38px;\">\n" +
                    "                        \n" +
                    "                      </td>\n" +
                    "                    </tr>\n" +
                    "                  </table>\n" +
                    "                </td>\n" +
                    "              </tr>\n" +
                    "            </table>\n" +
                    "          </td>\n" +
                    "          <tr>\n" +
                    "            <td align=\"center\" style=\"padding:0px 0 0px 0;background:#70bbd9;\">\n" +
                    "              <img src=\"https://scontent.fcvj2-1.fna.fbcdn.net/v/t1.6435-9/100733384_101376204938450_4591666041989365760_n.jpg?_nc_cat=108&ccb=1-4&_nc_sid=e3f864&_nc_ohc=riDMhVg_BioAX-BYbLZ&_nc_ht=scontent.fcvj2-1.fna&oh=1259f68b158045ae46cd070be3047cc3&oe=613219AE\" alt=\"\" width=\"600\" style=\"height:auto;display:block;\" />\n" +
                    "            </td>\n" +
                    "          </tr>\n" +
                    "          \n" +
                    "          <tr>\n" +
                    "            <td style=\"padding:36px 30px 42px 30px;\">\n" +
                    "              <table role=\"presentation\" style=\"width:100%;border-collapse:collapse;border:0;border-spacing:0;\">\n" +
                    "                <tr>\n" +
                    "                  <td align=\"center\" style=\" padding:0 0 36px 0;color:#153643;\">\n" +
                    "                    <h1 style=\"font-size:24px;margin:0 0 20px 0;font-family:Arial,sans-serif;\">Recuperación de la contraseña</h1>\n" +
                    "                    <p style=\"margin:0 0 12px 0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;\">Solicito un cambio de Contraseña, si reconoce este acto prosiga :</p>\n" +
                    "                    <p style=\"margin:0;font-size:16px;line-height:24px;font-family:Arial,sans-serif;\"><a href=\""+ip+"?code="+codigo+"\" style=\"color:#0073ba;text-decoration:underline;\">¡Da CLIC aquí!</a></p>\n" +
                    "                    \n" +
                    "                  </td>\n" +
                    "                </tr>\n" +
                    "                \n" +
                    "              </table>\n" +
                    "            </td>\n" +
                    "          </tr>\n" +
                    "          <tr>\n" +
                    "            <td style=\"padding:30px;background:#ee4c50;\">\n" +
                    "              <table role=\"presentation\" style=\"width:100%;border-collapse:collapse;border:0;border-spacing:0;font-size:9px;font-family:Arial,sans-serif;\">\n" +
                    "                <tr>\n" +
                    "                  <td style=\"padding:0;width:50%;\" align=\"left\">\n" +
                    "                    \n" +
                    "                  </td>\n" +
                    "                  <td style=\"padding:0;width:50%;\" align=\"right\">\n" +
                    "                    <table role=\"presentation\" style=\"border-collapse:collapse;border:0;border-spacing:0;\">\n" +
                    "                      <tr>\n" +
                    "                        <td style=\"padding:0 0 0 10px;width:38px;\">\n" +
                    "                          <a href=\"http://www.twitter.com/\" style=\"color:#ffffff;\"><img src=\"https://assets.codepen.io/210284/tw_1.png\" alt=\"Twitter\" width=\"38\" style=\"height:auto;display:block;border:0;\" /></a>\n" +
                    "                        </td>\n" +
                    "                        <td style=\"padding:0 0 0 10px;width:38px;\">\n" +
                    "                          <a href=\"http://www.facebook.com/\" style=\"color:#ffffff;\"><img src=\"https://assets.codepen.io/210284/fb_1.png\" alt=\"Facebook\" width=\"38\" style=\"height:auto;display:block;border:0;\" /></a>\n" +
                    "                        </td>\n" +
                    "                      </tr>\n" +
                    "                    </table>\n" +
                    "                  </td>\n" +
                    "                </tr>\n" +
                    "              </table>\n" +
                    "            </td>\n" +
                    "          </tr>\n" +
                    "        </table>\n" +
                    "      </td>\n" +
                    "    </tr>\n" +
                    "  </table>\n" +
                    "</body>\n" +
                    "</html>\n" +
                    "\n" +
                    "\n";
            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(myEmail, password);
                        }
                    });
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("calaveritazuca@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(title, "utf-8");
            message.setContent(body, "text/html;charset=UTF-8");
            Transport.send(message);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;


        }
    }
}
