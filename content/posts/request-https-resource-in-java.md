---
title: "Request Https resource in Java"
description: "This article is about how to request resource from an HTTPS resource. e.g. https://a.b.c.d/test-metadata.xmlhttps://a.b.c.d/test-metadata.xml"
publishDate: "2012-03-05T06:06:31.000Z"
tags: ["java","https","basic-auth","coding"]
---

This article is about how to request resource from an **HTTPS** resource. e.g. [https://a.b.c.d/test-metadata.xml](https://a.b.c.d/test-metadata.xml)

We have to do following two things

-   Trust all certificates (PKIX path building failed)
-   Pass SSL handshake verification (javax SSLHandshakeException)
-   Pass basic (username/password) authentication (401, Authentication Required)

```java
import java.io.*;
import java.net.*;
import java.security.cert.*;
import javax.net.ssl.*;

public class HttpsRequestClient {
    private final String USERNAME = "ryanwu";
    private final String PASSWORD = "mypwd";
    private final String TESTURL = "https://a.b.c.d/test-metadata.xml";

    public static void main(String[] args) {
        HttpsRequestClient client = new HttpsRequestClient();
        switch (args.length) {
        case 0:
            client.testURL();
            break;
        case 1:
            client.testURL(args[0]);
        case 3:
            client.testURL(args[0], args[1], args[2]);
        default:
            client.testURL();
        }

    }

    public void testURL() {
        testURL(TESTURL, USERNAME, PASSWORD);
    }

    public void testURL(String url) {
        testURL(url, USERNAME, PASSWORD);
    }

    public void testURL(String testURL, final String name, final String pwd) {

        HttpsURLConnection testConnection = null;
        try {
            // Trust All HttpsCertificates
            SSLContext sc = SSLContext.getInstance("SSL");
            sc.init(null, new TrustManager[] { new AllPassTrustManager() }, null);

            // Pass handshake verification
            HostnameVerifier myHostnameVarifier = new HostnameVerifier() {
                public boolean verify(String urlHostName, SSLSession session) {
                    return true;
                }
            };

            // Configuration
            HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
            HttpsURLConnection.setDefaultHostnameVerifier(myHostnameVarifier);
            Authenticator.setDefault(new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(name, pwd.toCharArray());
                }
            });

            testConnection = (HttpsURLConnection) new URL(testURL).openConnection();

            printHttpsCertificates(testConnection);
            printResponseContent(testConnection);

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (testConnection != null)
                testConnection.disconnect();
        }

    }

    private static void printHttpsCertificates(HttpsURLConnection con) {
        try {
            System.out.println("-----Certificates-----");
            System.out.println("Response Code : " + con.getResponseCode());
            System.out.println("Cipher Suite : " + con.getCipherSuite());
            System.out.println(System.getProperty("line.separator"));

            Certificate[] certs = con.getServerCertificates();
            System.out.println("Certificate Number : " + certs.length);
            for (int i = 0; i < certs.length; i++) {
                Certificate cert = certs[i];
                System.out.println("No : " + i);
                System.out.println("Cert Type : " + cert.getType());
                System.out.println("Cert Hash Code : " + cert.hashCode());
                System.out.println("Cert Public Key Algorithm : " + cert.getPublicKey().getAlgorithm());
                System.out.println("Cert Public Key Format : " + cert.getPublicKey().getFormat());
                System.out.println(System.getProperty("line.separator"));
            }
        } catch (SSLPeerUnverifiedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void printResponseContent(HttpsURLConnection con) {
        try {
            System.out.println("-----Content-----");
            BufferedReader br = new BufferedReader(
               new InputStreamReader(con.getInputStream()));
            String input;
            while ((input = br.readLine()) != null) {
                System.out.println(input);
            }
            br.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * A TrustManager which passes all certificates
     *
     * @see TrustManager
     */
    private class AllPassTrustManager implements TrustManager, X509TrustManager {
        public X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public void checkServerTrusted(X509Certificate[] certs, String authType) throws CertificateException {
            return;
        }

        public void checkClientTrusted(X509Certificate[] certs, String authType) throws CertificateException {
            return;
        }
    }
}
````

With [HttpClient](http://hc.apache.org/httpcomponents-client-ga/index.html), the testURL method will become easier

````Java
public void testURL(String testURL, String name, String pwd) {
    DefaultHttpClient httpclient = new DefaultHttpClient();
    try {
        // Trust all https certificates
        SSLContext sc = SSLContext.getInstance("SSL");
        sc.init(null, new TrustManager[] { new AllPassTrustManager() }, null);
        // Use apache SSLSocketFactory
        httpclient.getConnectionManager().getSchemeRegistry()
                .register(new Scheme("https", 443, new SSLSocketFactory(sc)));
        httpclient.getCredentialsProvider().setCredentials(
            new AuthScope(AuthScope.ANY_HOST, 443),
            new UsernamePasswordCredentials(name, pwd));
        HttpGet httpget = new HttpGet(testURL);
        ResponseHandler<String> handler = new ResponseHandler<String>() {
                public String handleResponse(HttpResponse response)
                    throws ClientProtocolException, IOException {
                    System.out.println("Response Status : " + response.getStatusLine());
                    System.out.println("-----Content-----");
                    HttpEntity entity = response.getEntity();
                    if (entity != null) {
                        return EntityUtils.toString(entity);
                    } else {
                        return null;
                    }
                }
        };
        System.out.println(httpclient.execute(httpget, handler));
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        httpclient.getConnectionManager().shutdown();
    }
}
```

-   Reference :
    -   http://www.mkyong.com/java/java-https-client-httpsurlconnection-example/
    -   http://hc.apache.org/httpcomponents-client-ga/examples.html
