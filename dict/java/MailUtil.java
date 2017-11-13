import java.io.UnsupportedEncodingException;
import java.nio.file.Path;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

/**
 * メール送信ユーティリティ
 */
public class MailUtil {

  private static String charset = "ISO-2022-JP";

  private static String host = "192.168.xxx.xxx";

  private static String port = "25";

  private static String from = "xxx@example.com";

  private static String encoding = "base64";

  private Properties makeProperties() {
    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.port", port);
    props.put("mail.smtp.auth", false);
    props.put("mail.smtp.connectiontimeout", 60000);
    props.put("mail.smtp.timeout", 60000);
    props.put("mail.debug", false);
    return props;
  }

  private Multipart makeContent(List<String> body, Path attachmentPath) {
    try {
      MimeBodyPart mbp1 = new MimeBodyPart();
      mbp1.setText(String.join("\n", body), charset);
      MimeBodyPart mbp2 = new MimeBodyPart();
      FileDataSource fds = new FileDataSource(attachmentPath.toFile());
      mbp2.setDataHandler(new DataHandler(fds));
      mbp2.setFileName(MimeUtility.encodeWord(fds.getName()));
      Multipart mp = new MimeMultipart();
      mp.addBodyPart(mbp1);
      mp.addBodyPart(mbp2);
      return mp;
    } catch (MessagingException | UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * メール送信処理
   * 添付ファイルがないメールを送信する。
   * このメソッドは次のメソッド呼び出しと等価である。
   * {@code sendMail(to, subject, body, null)}
   * @param to メール送信先
   * @param subject メール件名
   * @param body メール本文
   */
  public void sendMail(String to, String subject, List<String> body) {
    sendMail(to, subject, body, null);
  }

  /**
   * メール送信処理
   * 処理の途中で例外が発生した場合は、
   * 例外の内容にかかわらず処理を中断しLECSExceptionを投げる。
   * @param to メール送信先
   * @param subject メール件名
   * @param body メール本文
   * @param attachmentPath 添付ファイルのパス
   * @throws MessagingException
   * @throws AddressException
   * @throws UnsupportedEncodingException
   */
  private void sendMail(String to, String subject, List<String> body
      , Path attachmentPath)
  {
    try {
      MimeMessage message = new MimeMessage(Session.getInstance(makeProperties()));
      message.setFrom(from);
      message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.setSubject(subject, charset);
      if (attachmentPath != null)
        message.setContent(makeContent(body, attachmentPath));
      else {
        message.setText(String.join("\n", body), charset);
        message.setHeader("Content-Transfer-Encoding", encoding);
      }
      Transport.send(message);
    } catch (MessagingException e) {
      throw new RuntimeException(e);
    }
  }

}
