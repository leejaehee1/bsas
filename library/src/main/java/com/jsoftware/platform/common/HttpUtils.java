package com.pikdata.pelican.util;

import com.pikdata.pelican.web.IndexController;
import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.DeleteMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.PutMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * Description
 * <p>
 * <pre>
 * <b>History:</b>
 *    Lee Jae-hee, 1.0, 2016. 8. 31. init
 * </pre>
 *
 * @author Lee Jae-hee
 * @version 1.0, 2016. 8. 31. init
 */
public class HttpUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(HttpUtils.class);

    public static String put(String s) {
        HttpClient client = new HttpClient();

        // Create a method instance.
        PutMethod method = new PutMethod(s);
        LOGGER.info(s);
        // Provide custom retry handler is necessary
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        try {
            // Execute the method.
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            // Read the response body.
            byte[] responseBody = method.getResponseBody();

            // Deal with the response.
            // Use caution: ensure correct character encoding and is not binary data
//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Release the connection.
            method.releaseConnection();
        }
        return "";
    }

    public static String put(String s, String file) {
        HttpClient client = new HttpClient();

        // Create a method instance.
        PutMethod method = new PutMethod(s);
        LOGGER.info(s);
        // Provide custom retry handler is necessary
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        method.getParams().setParameter("-T", file);

        try {
            // Execute the method.
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            // Read the response body.
            byte[] responseBody = method.getResponseBody();

            // Deal with the response.
            // Use caution: ensure correct character encoding and is not binary data
//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Release the connection.
            method.releaseConnection();
        }
        return "";
    }

    public static String delete(String s) {
        HttpClient client = new HttpClient();

        // Create a method instance.
        DeleteMethod method = new DeleteMethod(s);

        // Provide custom retry handler is necessary
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        try {
            // Execute the method.
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            // Read the response body.
            byte[] responseBody = method.getResponseBody();

            // Deal with the response.
            // Use caution: ensure correct character encoding and is not binary data
//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            System.err.println();
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Release the connection.
            method.releaseConnection();
        }
        return "";
    }

    public static String get(String s) {
        HttpClient client = new HttpClient();

        // Create a method instance.
        GetMethod method = new GetMethod(s);

        // Provide custom retry handler is necessary
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        try {
            // Execute the method.
//            HostConfiguration hostConfiguration = new HostConfiguration();
//            hostConfiguration.setHost("192.168.1.68");
//            ProxyHost proxyHost = new ProxyHost("192.168.1.68");
//            hostConfiguration.setProxyHost(proxyHost);
//            client.setHostConfiguration(hostConfiguration);
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            // Read the response body.
            byte[] responseBody = method.getResponseBody();

            // Deal with the response.
            // Use caution: ensure correct character encoding and is not binary data
//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            System.err.println();
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Release the connection.
            method.releaseConnection();
        }
        return "";
    }

    public static String post(String s) {
        System.out.println(s);

        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(s);
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        try {
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            byte[] responseBody = method.getResponseBody();

//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            method.releaseConnection();
        }
        return "";
    }

    public static String post(String s, String file) {
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(s);
        method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
                new DefaultHttpMethodRetryHandler(3, false));

        method.getParams().setParameter("-T", file);

        try {
            int statusCode = client.executeMethod(method);

            if (statusCode != HttpStatus.SC_OK) {
                LOGGER.info("Method failed: " + method.getStatusLine());
            }

            byte[] responseBody = method.getResponseBody();

//            System.out.println(new String(responseBody));
            return new String(responseBody);

        } catch (HttpException e) {
            LOGGER.info("Fatal protocol violation: " + e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LOGGER.info("Fatal transport error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            method.releaseConnection();
        }
        return "";
    }
}
