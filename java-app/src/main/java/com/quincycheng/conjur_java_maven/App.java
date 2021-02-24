package com.quincycheng.conjur_java_maven;

import com.cyberark.conjur.api.Conjur;
import com.cyberark.conjur.api.*;
import javax.net.ssl.*;
import java.security.cert.*;
import java.security.KeyStore;
import java.io.*;

/**
 * This is a Java app for demostrating the usage of Conjur API (https://github.com/cyberark/conjur-api-java)
 */
public class App 
{
    public static void main( String[] args )
    {
	System.out.println("******************************************");
	System.out.println("  Conjur Java Demo ");
	System.out.println("******************************************");

	System.out.println ("CONJUR_APPLIANCE_URL: " + System.getenv("CONJUR_APPLIANCE_URL") );
	System.out.println ("CONJUR_ACCOUNT: "  + System.getenv("CONJUR_ACCOUNT") );
	System.out.println ("CONJUR_AUTHN_LOGIN: "  + System.getenv("CONJUR_AUTHN_LOGIN") );
	System.out.println ("CONJUR_AUTHN_API_KEY: "  + System.getenv("CONJUR_AUTHN_API_KEY") );
	System.out.println ("VARIABLE_ID: "  + System.getenv("VARIABLE_ID") );

	Conjur conjur = new Conjur();
        String secret = conjur.variables().retrieveSecret( System.getenv("VARIABLE_ID") );

	System.out.println("The value of "+ System.getenv("VARIABLE_ID") +" is "+ secret);
    }
}
